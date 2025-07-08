mmp.alertness = mmp.alertness or {}
local alertness = mmp.alertness

local roomexists, getRoomName, anytolong, matches, deleteLine = mmp.roomexists, getRoomName, mmp.anytolong, matches, deleteLine

if mmp.debug then
 mmp.alertnessTime = mmp.alertnessTime or createStopWatch()
 startStopWatch(mmp.alertnessTime)
end

if matches[4] ~= "location" and not table.contains(alertness, matches[2]) then
  local longexitname = matches[4]
  alertness[longexitname] = alertness[longexitname] or {}
  alertness[longexitname][#alertness[longexitname]+1] = matches[2]
  deleteLine()
elseif matches[4] == "location" then
  local currentroomname = mmp.cleanroomname(mmp.currentroomname)
  if matches[3] == currentroomname then
    alertness.here = alertness.here or {}
    alertness.here[#alertness.here+1] = matches[2]
    deleteLine()
  end
end


if not mmp.firstAlert then
	mmp.firstAlert = true
	mmp.pdb_lastupdate = {}
end

mmp.pdb[matches[2]] = matches[3]
mmp.pdb_lastupdate[matches[2]] = true


if mmp.debug then mmp.echo("alertness trigger for "..matches[2].." took "..stopStopWatch(mmp.alertnessTime).."s.") end