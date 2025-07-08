deleteFull()
local person = matches[2]:title()
local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[person].city:lower()].color
Legacy.echo("<green><b>Added "..("<"..color..">" or "<white>")..person:title().." <DimGrey>(<gold>"..Legacy.NDB.db[person].city.."<DimGrey>) <green>to your Lust Whitelist.")
table.insert(Legacy.Curing.Lust.whiteList, person)
