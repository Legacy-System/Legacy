if Legacy then
salveTime = stopStopWatch(tempSalveStopwatch)
Legacy.Curing.bal.apply = true

if salveTime and Legacy.Settings.Curing.cureEchos then
  cecho(" <white>"..salveLocale:title().."<DimGray> (<gold>"..salveTime.."<DimGray>)")
end
deleteStopWatch(tempSalveStopwatch)
end