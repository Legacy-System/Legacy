if Legacy then
focusTime = stopStopWatch(focusStopwatch)

if focusTime and Legacy.Settings.Curing.cureEchos then
  cecho(" <white>Focus<DimGray> (<gold>"..focusTime.."<DimGray>)")
end
Legacy.Curing.bal.focus = true
resetStopWatch(focusStopwatch)

end