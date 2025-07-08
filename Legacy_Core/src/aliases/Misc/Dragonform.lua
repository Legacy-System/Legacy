Legacy.Curing.dragonforming = true
if matches[2] then
  send('curing off')
  send("dragonform "..matches[2])
elseif matches[2] == nil then
  local ExtraMostBestestDragon = 0
  local ExtraMostBestestDragoncolor = ""
  for k,v in pairs(Legacy.Curing.Dragonform) do
    if v > ExtraMostBestestDragon then
      ExtraMostBestestDragon = v
      ExtraMostBestestDragoncolor = k
    end
  end
  send('curing off')
  send("dragonform "..ExtraMostBestestDragoncolor)
end