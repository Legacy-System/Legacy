if matches[3] ~= nil and matches[3] == "delete" then
  Legacy.echo("<red>Removing "..Legacy.NDB.color(matches[2]:title())..matches[2]:title().." <red>from your NDB.")

else

local person = matches[2]:title()
if Legacy.NDB.db[person] then
  Legacy.NDB.lookup(person)
  Legacy.Settings.NDB.newHL(person)
  local city = Legacy.NDB.db[person].city
  for k,v in pairs(Legacy.NDB.db[person]) do
    if k:title() == "Title" then
      cecho("\n<"..Legacy.Settings.NDB.Config[city:lower()].color..">"..Legacy.NDB.db[person].title.."\n")
      local titlestr = #Legacy.NDB.db[person].title
      local dashcount = 0
      while titlestr > dashcount do
        cecho("<ansi_yellow>-")
        dashcount = dashcount + 1
      end
      cecho("<ansi_yellow>-")
    end
  end
        for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "city" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "house" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "ArmyRank" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "class" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "level" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
else
  cecho("\n<white>[<gold>Legacy<white>]<white>: Getting "..person:title().."'s information...")
  Legacy.NDB.lookup(person)
  Legacy.Settings.NDB.newHL(person)
  
    tempTimer(4,function()
    if Legacy.NDB.db[person] then
    local city = Legacy.NDB.db[person].city
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k:title() == "Title" then
          cecho("\n<"..Legacy.Settings.NDB.Config[city:lower()].color..">"..Legacy.NDB.db[person].title.."\n")
          local titlestr = #Legacy.NDB.db[person].title
          local dashcount = 0
          while titlestr > dashcount do
          cecho("<ansi_yellow>-")
          dashcount = dashcount + 1
          end
          cecho("<ansi_yellow>-")
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "city" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "house" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "ArmyRank" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "class" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
      
      for k,v in pairs(Legacy.NDB.db[person]) do
        if k == "level" then
          cecho("\n<orange>"..k:title().. ":<white> "..v)
        end
      end
    end
  end)
end
end