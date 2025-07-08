if Legacy then
if restoring then
  restoring = false
  restoreTime = stopStopWatch(restoreStopwatch)
    if restoreTime and Legacy.Settings.Curing.cureEchos then
      cecho(" <white>Restore<DimGray> (<gold>"..restoreTime.."<DimGray>)")
    end
  resetStopWatch(restoreStopwatch)

end
end