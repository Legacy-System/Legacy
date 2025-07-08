if Legacy then
smokeTime = stopStopWatch(smokeStopwatch)
if smokeTime and Legacy.Settings.Curing.cureEchos then
  cecho(" <white>Smoke<DimGray> (<gold>"..smokeTime.."<DimGray>)")
end
Legacy.Curing.bal.smoke = true
resetStopWatch(smokeStopwatch)
end