--This is set up to wipe tattoos that get below a certain point, and ink you new ones. 
local fixat = 10 -- This is the number of charges at which you want to wipe off your tattoo and ink a new one


tatQ = tatQ or {}
for bodypart , tattoo in pairs(Legacy.Curing.Tattoos) do
  for types, charge in pairs(Legacy.Curing.Tattoos[bodypart]) do
    if charge.charges == "art" or charge.charges == "n/a" or types == "starburst" then
      --nothing
    else
      if tonumber(charge.charges) <= fixat then
      send("wipe off "..types)
      table.insert(tatQ, types)
      end
    end
  end
end
Tats()
if table.size(tatQ) == 0 then
  Legacy.echo("No Tattoos to fix!")
end