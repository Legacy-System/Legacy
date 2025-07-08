Legacy.Curing.Affs = {}

for k,v in pairs(gmcp.Char.Afflictions.List) do
  if not table.contains(Legacy.Settings.Curing.IgnoredAffs, v.name) then
    Legacy.Curing.Affs[v.name] = true
  end
end