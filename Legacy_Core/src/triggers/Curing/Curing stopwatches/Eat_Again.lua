if Legacy then
eatTime = stopStopWatch(eatStopwatch)

if eatTime and Legacy.Settings.Curing.cureEchos then
  cecho(" <white>Eat<DimGray> (<gold>"..eatTime.."<DimGray>)")
end
Legacy.Curing.bal.eat = true
resetStopWatch(eatStopwatch)
end