if matches[2] then
Legacy.Settings.Dor.status = true
local str = matches[2]
local queue = string.split(str, ", ")
Legacy.Settings.Dor.queue = table.deepcopy(queue)
Legacy.Dor()
else
  Legacy.echo("<red><b>Clearing your DOR Queue")
  Legacy.Settings.Dor.status = false
  Legacy.Dor("clear")
  send("cq all")
end