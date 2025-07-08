deleteFull()
local person = matches[2]:title()
local color = Legacy.Settings.NDB.Config[Legacy.NDB.db[person].city:lower()].color

Legacy.echo("<red><b>Removed "..("<"..color..">" or "<white>")..person:title().." <DimGrey>(<gold>"..Legacy.NDB.db[person].city.."<DimGrey>) <red>from your Lust Whitelist.")
table.bremove(Legacy.Curing.Lust.whiteList, person)
