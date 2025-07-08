local who = matches[2]
if Legacy.CT.timers[who] then
  if Legacy.CT.timers[who].class == "Sublimation" then
    ClassTimer(who, "Sublimation")
  else
    ClassTimer(who, "Alchemist")
  end
else
  ClassTimer(who, "Alchemist")
end

