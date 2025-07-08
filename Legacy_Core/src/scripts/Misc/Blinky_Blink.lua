function doblink( room, color, duration )
	local colorn, durationn
	local r,g,b,br,bg,bb
	room = tonumber(room)
  GotoID = room
	if type(color) == "table" then
		r,g,b,br,bg,bb = unpack(color)
   end
	if not color then
		r,g,b,br,bg,bb = 220,0,0,255,186,23
	end
	if not duration then durationn = 10 else durationn = duration end
 
	highlightRoom(room,r,g,b,br,bg,bb,1,255,255)
	for i=0.5, durationn do
		tempTimer( i, function() highlightRoom( room, r,g,b,br,bg,bb, 1, 255, 255 ) end )
		tempTimer( i+0.5, function() unHighlightRoom( room ) end )
	end
	tempTimer( durationn + 1, function() unHighlightRoom( room ) end )
end
 
local oldEchonums = mmp.echonums
 
mmp.echonums = function(roomname)
  oldEchonums(roomname)
  local rooms = mmp.searchRoomExact(roomname)
 
  if not next(rooms) then
    echo "?" return nil end
 
  -- transform the kv table into a table of tables for cleaner code.
    -- + perhaps Mudlet in future will give this us anyway, sorted by relevancy
  local dt = {}
  for roomid,room in pairs(rooms) do
    dt[#dt+1] = {name = room, id = roomid}
  end
  doblink ( dt[1].id )
end
 
function roomIDExact(rname)
  local rooms = mmp.searchRoom(rname)
  local finalroom = {}
  for k, v in pairs(rooms) do
    if v == rname then
      table.insert(finalroom, k)
    end
  end
  return table.concat(finalroom, ", ")
end
