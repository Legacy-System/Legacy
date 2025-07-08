if Legacy.Settings.Curing.slowcure then
  if slowcount == nil then
    slowcount = 1
  else
    slowcount = slowcount + 1
  end
  
  if slowcount >= 5 and Legacy.Curing.Affs.retardation == nil and Legacy.Curing.Affs.aeon == nil then
    Legacy.bigEcho("RETARDATION DETECTED, CHECKING AGAIN IN 5 SECONDS", "red", "yellow")
    Legacy.Curing.Affs.retardation = true
    if RetTimer then
      killTimer(RetTimer)
      RetTimer = tempTimer(6, function() Legacy.Curing.Affs.retardation = nil end)
    else
      RetTimer = tempTimer(6, function() Legacy.Curing.Affs.retardation = nil end)
    end
    slowcount = 0
  end
end
