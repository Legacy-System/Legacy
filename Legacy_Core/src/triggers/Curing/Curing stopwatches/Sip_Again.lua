if Legacy then
sipTime = stopStopWatch(sipStopwatch)
Legacy.Curing.bal.sip = true

--Sorry Elemental Lords!
if Legacy.Curing.Affs['latched'] or Legacy.Curing.Affs['kkractlebrand'] then
  send('sip health')
end

if sipTime and Legacy.Settings.Curing.cureEchos then
  if sipType == "mana" then
    cecho(" <cyan>Mana<DimGray> (<gold>"..sipTime.."<DimGray>)")
  elseif sipType == "health" then
    cecho(" <green>Health<DimGray> (<gold>"..sipTime.."<DimGray>)")
  end
end
resetStopWatch(sipStopwatch)
end