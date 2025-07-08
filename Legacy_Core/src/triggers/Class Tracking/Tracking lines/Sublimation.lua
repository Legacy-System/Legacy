for k, v in pairs(Legacy.CT.timers) do
  if Legacy.CT.timers[k].class == "Alchemist" then
    ClassTimer(k, "Sublimation")
    Legacy.echo("<b><red>Adjusted "..Legacy.NDB.color(k)..k.."<red> to <gold>Sublimation<red>.")
  end
end