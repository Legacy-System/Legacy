Legacy.echo("City Enemies for the city of "..Legacy.NDB.db[gmcp.Char.Status.name].city..", matching: <gold>"..matches[2]:title().."<white>.")
local name = matches[2]:lower():title()
for k,v in pairs(Legacy.NDB.Enemies) do
  if string.starts(k, name) then
  cechoLink("\n<DimGrey>-- "..Legacy.NDB.color(k)..k, function() send("city charge list "..k) end, "Click to see "..k.."'s charge list.", true)
  end
end
