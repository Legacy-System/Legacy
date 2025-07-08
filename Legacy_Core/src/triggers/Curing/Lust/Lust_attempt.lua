if Legacy then
  local city = Legacy.NDB.db[matches[2]:title()].city or "NA"
  local color = Legacy.Settings.NDB.Config[city:lower()].color
  if table.contains(Legacy.Curing.Lust.whiteList, city) then
    --nothing
  elseif table.contains(Legacy.Curing.Lust.whiteList, matches[2]:title()) then
    --nothing
  else
    Legacy.bigEcho("WE HAVE BEEN LUSTED BY <"..color..">"..matches[2]:upper().."<gold> REJECTING THEM WHEN WE REGAIN BALANCE!!", "red", "gold")
  end
end