--Feel free to change the pattern, this is simply a curing toggle.

if Legacy.Settings.Curing.status == false then
  Legacy.Settings.Curing.status = true
  send("curing on")
else
  Legacy.Settings.Curing.status = false
  send("curing off")
end