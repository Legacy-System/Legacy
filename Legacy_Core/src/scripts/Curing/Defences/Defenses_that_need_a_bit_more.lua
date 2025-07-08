function Manual_Defs()
if Legacy then
  local Defs = function(arg) if table.contains(Legacy.Curing.Defs[Legacy.Curing.Defs.currentset].defences, arg) then return true else return false end end
  
  local activeDefs = {
  ["benediction"] = {cmd = "recite benediction on me", Q = "class"},
  
  
  }
  
  for k,v in pairs(activeDefs) do
    if Defs(k) then
      send("queue add "..activeDefs[k].Q.." "..activeDefs[k].cmd)
    end
  end
  
end
end
