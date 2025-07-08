cecho("<ansi_yellow>Other packages available with Legacy:\n")
Legacy_Downloads()
for k,v in pairs(Legacy.Extras) do

cechoLink("<cyan>"..k:title()..": <ansi_white>"..v.desc, function() installPackage(v.link) end, v.desc, true)
echo("\n\n")

end
