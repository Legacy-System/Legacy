--Adds/Removes people whom you will not reject lust from
--Tremove is just a shortened version of table.remove 
Legacy.Curing.Lust = Legacy.Curing.Lust or {}
Legacy.Curing.Lust.whiteList = Legacy.Curing.Lust.whiteList or {}

if matches[2] == nil then
 send('curing rejection whitelist show')
elseif matches[3] ~= nil then
local person = matches[3]:title()

  if Legacy.NDB.db[person] then
    local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[person].city:lower()].color
    Legacy.NDB.lookup(person)
    if matches[2] == "add" then
      send('curing rejection whitelist add '..person)
    elseif matches[2] == "remove" then
      send('curing rejection whitelist remove '..person)
    end
  end
 end