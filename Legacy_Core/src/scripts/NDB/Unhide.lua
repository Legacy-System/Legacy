function Unhide()
  local timing = 0
  for k,v in pairs(Legacy.NDB.hidden) do
    local who = v
    tempTimer(timing, function() send("queue add free honour "..who) end)
    timing = timing + 2.6
  end
end