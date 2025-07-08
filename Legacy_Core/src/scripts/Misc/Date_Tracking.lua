function DateTrack()
  if not Legacy then return end
  local date = Legacy.Settings.IGDate
  local ire = gmcp.IRE.Time.List

  date.day = ire.day
  date.month = ire.month
  date.year  = ire.year
end
registerAnonymousEventHandler('gmcp.IRE.Time', 'DateTrack')