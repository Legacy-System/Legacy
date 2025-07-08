send("settarget "..matches[2])
target = matches[2]:title()
if Legacy.NDB.db[target] then
  local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[target].city:lower()].color
  Legacy.NDB.lookup(target)
  sendAll("unally "..target, "enemy "..target)
  possibleClass = Legacy.NDB.db[target].class
  Legacy.bigEcho("Target set to: "..("<"..color..">" or "<white>")..target:title().." <DimGrey>(<gold>Level "..Legacy.NDB.db[target].level.." "..Legacy.NDB.db[target].class.."<DimGrey>)", "purple", "white")
  tempTimer(4, [[if Legacy.NDB.db[target].class ~= possibleClass then   local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[target].city:lower()].color
   Legacy.echo("Adjusted <"..color..">"..target.."'s <white>class to <gold>"..Legacy.NDB.db[target].class.."<white>.") end]])
   
  if ak then
    ak.oresetparse()
  end
end