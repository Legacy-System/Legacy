local tat = matches[3]
Legacy.Curing.Tattoos = Legacy.Curing.Tattoos or {}

if Legacy.Curing.Tattoos[matches[2]] == nil then
  Legacy.Curing.Tattoos[matches[2]] = {}
  Legacy.Curing.Tattoos[matches[2]][matches[3]] = {charges = (tonumber(matches[4]) or "n/a")}
else
Legacy.Curing.Tattoos[matches[2]][matches[3]] = {charges = (tonumber(matches[4]) or "n/a")}
end