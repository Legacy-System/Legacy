--Toggles prioing mana or health

if Legacy.Settings.Curing.SS.Settings.sipPrio == "Health" then
  send("curing prio mana")
elseif Legacy.Settings.Curing.SS.Settings.sipPrio == "Mana" then
  send("curing prio health")
end