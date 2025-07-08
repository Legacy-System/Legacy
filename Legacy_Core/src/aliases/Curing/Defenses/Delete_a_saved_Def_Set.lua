
if Legacy.Curing.Defs[matches[2]:title()] then
  Legacy.Curing.Defs[matches[2]:title()] = nil
  Legacy.echo("<red>The Defense set '"..matches[2]:title().."' was deleted!")
end