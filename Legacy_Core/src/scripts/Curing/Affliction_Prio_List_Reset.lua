--This function will check your set priorities against your base, and will reset your prios back to base.
function Curing_Reset()
  gagprios = true
  local priostr = "curing priority "
  for aff, prio in pairs(Legacy.Curing.Prios.legacy) do
    --if prio ~= Legacy.Curing.Prios.temp[aff] then
       priostr = priostr..aff.." "..prio.." "
    --end
  end
  send(priostr, false)
  tempTimer(20, function() 
      gagprios = false 
    end)
end
registerAnonymousEventHandler("CuringReset", "Curing_Reset")