function Dset(set)
if not Legacy then return end

  if Legacy.Curing.Defs.tracking == nil then
   for _,v in pairs(Legacy.Curing.Defs.all) do
    Legacy.Curing.Defs.tracking[v] = 0
   end
  end
  
  local defenselist = "curing priority defense "
  local allList = "curing priority defense "
  local ignoreddefs = {"ironform", "insufflate", "incandescence", "hyperfocus", "heads", "haste", "frenzied", "firefly", "extispicy", "enhancedform", "eavesdropping", "eaglelegend",
                      "dustform", "demonfury", "deliverance", "chameleon", "brains", "blunder", "blocking", "blessingofthegods", "blackboarlegend", "battlesong", "arctar", "amamaalierlegend",
                      "alligatorlegend", "aiming", "agithtailegend", "lifebond", "lifegiver", "lifesteal", "maticlegend", "morph", "nicatorlegend", "phased", "preachblessing", "prismatic", 
                      "promosurcoat", "scholasticism", "seasonelegend", "setweapon", "shikudoform", "shinrejoinder", "spinning", "spiritwalk", "starburst", "sympathy", "tekurastance", "tongues",
                      "tumors", "twoartsstance", "unnamablepresence", "venomsacks", "viridian", "weakvigour", "wolflegend", "xporb"}





if set == nil then
cecho("\n\n<ansi_yellow>Saved Defense Sets:\n")
local setcount = 1
for k,v in pairs(Legacy.Curing.Defs) do

  if k == "all" or k == "temp" or k == "ignore" or k == "current" or k == "legacy" or k == "currentset" or k == "tracking" then
  else
    if setcount < 3 then
      cechoLink("<gold> "..k, function() Dset(k) end, "Set "..k:upper().." as your current set, containing "..table.size(Legacy.Curing.Defs[k].defences).." defences.", true)
      local str = #k
      local i = 0
      while i < (15 - str) do
      echo(" ")
      i = i + 1
      end
      setcount = setcount + 1
    elseif setcount >=3 then
      echo("\n\n")
      setcount = 1
      cechoLink("<gold> "..k, function() Dset(k) end, "Set "..k:upper().." as your current set, containing "..table.size(Legacy.Curing.Defs[k].defences).." defences.", true)
      local str = #tostring(k)
      local i = 0
      while i < (15 - str) do
      echo(" ")
      i = i + 1
      end
      setcount = setcount + 1
    end
  end
end
elseif Legacy.Curing.Defs[set:title()] then
  send("curing priority defense list reset")
  local deflist = "curing priority defense "
  local currentset = set:title()
  for _,v in pairs(Legacy.Curing.Defs[currentset].defences) do
    Legacy.Curing.Defs.tracking[v] = 25
  end
  Legacy.Curing.Defs.currentset = set:title()
  send(deflist..table.concat(Legacy.Curing.Defs[currentset].defences, " 25 ").." 25")
  Legacy.echo("Loaded the '<gold>"..set:title().."<white>' Defense set.")
  
  Legacy.Curing.Defs.temp = {defences = {}, keepup = {}}
  Legacy.Curing.Defs.temp = table.deepcopy(Legacy.Curing.Defs[Legacy.Curing.Defs.currentset])
  send("remove armour")
  send("wear "..Armour())
elseif not Legacy.Curing.Defs[set:title()] then
  Legacy.echo("Defense Set '"..set:title().."' Created!")
  Legacy.Curing.Defs.temp = {defences = {}, keepup = {}}
  Legacy.Curing.Defs[set:title()] = table.deepcopy(Legacy.Curing.Defs.temp)
  Dset(set:title())
end
end