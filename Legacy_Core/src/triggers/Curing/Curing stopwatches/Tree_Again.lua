if Legacy then
treeTime = stopStopWatch(treeStopwatch)

if treeTime and Legacy.Settings.Curing.cureEchos then
  cecho(" <white>Tree<DimGray> (<gold>"..treeTime.."<DimGray>)")
end
Legacy.Curing.bal.tree = true
resetStopWatch(treeStopwatch)
end