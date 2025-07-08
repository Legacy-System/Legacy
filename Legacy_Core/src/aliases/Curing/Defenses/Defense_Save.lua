--HAS TO BE ONE WORD, BUT MAY CONTAIN NUMBERS
if matches[2] == nil then
  Legacy.echo("Defense Set '"..Legacy.Curing.Defs.currentset:title().."' Saved!")
  Legacy.Curing.Defs[Legacy.Curing.Defs.currentset] = table.deepcopy(Legacy.Curing.Defs.temp)
elseif matches[2] == "basic" or matches[2] == "Basic" then
  Legacy.echo("<red>SORRY! Name is taken! Use something other than '<white>"..matches[2].."<red>'.")
elseif matches[2] == "keepup" or matches[2] == "Keepup" then
  Legacy.echo("<red>SORRY! Name is taken! Use something other than '<white>"..matches[2].."<red>'.")
elseif matches[2] == "legacy" or matches[2] == "Legacy" then
  Legacy.echo("<red>SORRY! Name is taken! Use something other than '<white>"..matches[2].."<red>'.")
elseif matches[2] == "temp" or matches[2] == "Temp" then
  Legacy.echo("<red>SORRY! Name is taken! Use something other than '<white>"..matches[2].."<red>'.")
elseif matches[2] == "current" or matches[2] == "Current" then
  Legacy.echo("<red>SORRY! Name is taken! Use something other than '<white>"..matches[2].."<red>'.")
elseif matches[2] == "Currentset" or matches[2] == "currentset" then
  Legacy.echo("<red>SORRY! Name is taken! Use something other than '<white>"..matches[2].."<red>'.")
elseif Legacy.Curing.Defs[matches[2]:title()] then
  Legacy.echo("Defense Set '<gold>"..matches[2]:title().."<white>' Saved!")
  Legacy.Curing.Defs[matches[2]:title()] = table.deepcopy(Legacy.Curing.Defs.temp)
else
  Legacy.echo("Defense Set '"..matches[2]:title().."' Created!")
  Legacy.Curing.Defs[matches[2]:title()] = table.deepcopy(Legacy.Curing.Defs.temp)
end
