if Legacy then
if matches.status == "activated" then
  Legacy.Settings.Curing.status = true
elseif matches.status == "disabled" then
  Legacy.Settings.Curing.status = false
end
end