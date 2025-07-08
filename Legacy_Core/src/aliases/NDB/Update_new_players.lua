 Legacy.NDB.getOnline()
  
  Legacy.NDB.hidden = {}
  Legacy.NDB.awake = {}
  local citylist = {"targossas", "hashan", "mhaldor", "ashtan", "cyrene", "eleusis"}
  for k,v in pairs(Legacy.NDB.db) do
    if v.city == "(hidden)" then
      if table.contains(Legacy.NDB.hidden, k) then
        --nothing
      else
        table.insert(Legacy.NDB.hidden, k)
      end
    end
  end
  Legacy.echo("Gathering information for NDB...")
tempTimer(3,function()  
  local f, s = io.open(getMudletHomeDir() .. "/Legacy/NDB/who.json")
    if f then 
      s = f:read("*l"):trim()
      io.close(f)
    end
    local t = yajl.to_value(s)
    for _, v in pairs(t.characters) do
        Legacy.NDB.lookup(v.name)
        if not table.contains(Legacy.NDB.awake, v.name) then
          table.insert(Legacy.NDB.awake, v.name)
        end
        --Legacy.Settings.NDB.newHL(v.name)
    end
    Legacy.Settings.NDB.highlights()
   end)
   
tempTimer(6, [[Legacy.echo("NDB finished updating for <gold>"..table.size(Legacy.NDB.db).."<white> people.")]])
  if table.size(Legacy.NDB.hidden) > 0 then
    tempTimer(7, [[Legacy.echo("People that will need manually honoured: <gold>"..table.concat(Legacy.NDB.hidden, "<white>,<gold> "))]])
    tempTimer(7.5, function() Legacy.echo("Would you like to automatically honour hidden people?") 
                              cechoLink(" <green>Y", [[Unhide()]], "Click to Unhide Hidden people.", true) 
                              cecho("<DimGrey>/") 
                              cechoLink("<red>N", [[send("")]], "Click to do nothing for some reason.", true)
                              cecho("  <DimGrey>(<ansi_white>This should take about "..math.floor(2.6 * #Legacy.NDB.hidden).." seconds.<DimGrey>)")end)
  end
    
