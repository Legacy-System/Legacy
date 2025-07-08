deleteFull()
if matches[2] == "health" then
  Legacy.Settings.Curing.SS.Settings.sipPrio = "Health"
elseif matches[2] == "mana" then
  Legacy.Settings.Curing.SS.Settings.sipPrio = "Mana"
end
cecho("\n<white>[<gold>Legacy<white>]:<white> Prioed "..Legacy.Settings.Curing.SS.Settings.sipPrio)
  
