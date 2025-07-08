local Quisalis = {}
local Ivory = {}
if matches[2] == "all" then
  for k,v in pairs(Legacy.NDB.db) do
    if v.mark ~= nil then
      local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[k].city:lower()].color
      if v.mark == "Quisalis" then
        table.insert(Quisalis, "<"..color..">"..k:title())
      elseif v.mark == "Ivory" then
        table.insert(Ivory, "<"..color..">"..k:title())
      end
    end
  end
else
  for k,v in pairs(Legacy.NDB.db) do
    if v.mark ~= nil and table.contains(Legacy.NDB.awake, k) then
      local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[k].city:lower()].color
      if v.mark == "Quisalis" then
        table.insert(Quisalis, "<"..color..">"..k:title())
      elseif v.mark == "Ivory" then
        table.insert(Ivory, "<"..color..">"..k:title())
      end
    end
  end
  cecho("\n<ansi_yellow>Online Marks:\n\n")
end


cecho("<red>Quisalis: "..table.concat(Quisalis, "<white>, "))
echo("\n\n")
cecho("<white>Ivory: "..table.concat(Ivory, "<white>, "))