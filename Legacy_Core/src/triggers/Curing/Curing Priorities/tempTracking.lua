matches[2] = string.gsub(matches[2], "%((%d+)%)","%1")
if Legacy.Settings.Curing.cureEchos == true and gagprios == false then
  deleteFull()
  cecho("\n<white>[<gold>Prio<white>]: "..matches[2]:title().." <DimGrey>(<gold>"..matches[3].."<DimGrey>)")
end
  Legacy.Curing.Prios.temp[matches[2]:title()] = tonumber(matches[3])

