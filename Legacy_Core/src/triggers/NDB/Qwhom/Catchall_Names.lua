deleteFull()

local who = string.gsub(matches.who, "%s+$", "")
local where = matches.where
local area = ""

if string.find(matches[1], "%(") == nil then
  where = "Gemmed or Off-Plane"
  area = "Unknown Area"
end

if where ~= "Gemmed or Off-Plane" and where ~= "" and where ~= nil then
  area = mmp.searchRoomExact(where)
  if area and next(area) then
    area = mmp.getAreaName(next(area))
  else
    area = "Unknown Area"
  end
end

Legacy.NDB.qwhom = Legacy.NDB.qwhom or {}
Legacy.NDB.qwhom[area] = Legacy.NDB.qwhom[area] or {}
Legacy.NDB.qwhom[area][where] = Legacy.NDB.qwhom[area][where] or {}
Legacy.NDB.lookup(who)


if Legacy.NDB.db[who] then
local city = Legacy.NDB.db[who].city:lower()
local citycolor = Legacy.Settings.NDB.Config[city].color
local who = "<"..citycolor..">"..who
table.insert(Legacy.NDB.qwhom[area][where], who)
end

