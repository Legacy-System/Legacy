--This compiles the classes for each person in your enemies list

Legacy.CT.enteam = {}

for n,c in pairs(Legacy.CT.Enemies) do
  Legacy.CT.enteam[c] = Legacy.CT.enteam[c] or {}
  Legacy.CT.enteam[c].count = Legacy.CT.enteam[c].count or 0
  Legacy.CT.enteam[c].who = Legacy.CT.enteam[c].who or {}
  
  
  if table.contains(Legacy.CT.enteam[c].who, n) then
  else
    if Legacy.NDB.db[n] then
      local city = Legacy.NDB.db[n].city
      table.insert(Legacy.CT.enteam[c].who, "<"..Legacy.Settings.NDB.Config[city:lower()].color..">"..n)
    else
      table.insert(Legacy.CT.enteam[c].who, n)
    end
  end
  
  if table.contains(Legacy.CT.enteam, c) then
    Legacy.CT.enteam[c].count = Legacy.CT.enteam[c].count + 1
  else
    Legacy.CT.enteam[c].count = 1
  end
end


cecho("\n<yellow>Enemy Composition:")
cecho("\n<ansi_yellow>------------------------------")
for k,v in pairs(Legacy.CT.enteam) do
cecho("\n<orange>"..k.." <DimGray>[<white>"..v.count.."<DimGray>]: <white>"..table.concat(v.who, ", "))
end
cecho("\n<ansi_yellow>------------------------------")
