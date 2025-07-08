function Deprio(aff)
  Legacy.Curing.Prios.PrioUpdates = Legacy.Curing.Prios.PrioUpdates or {}
  local aff = aff:title()
    if Legacy.Curing.Prios.temp[aff] ~= 26 and not table.contains(Legacy.Curing.Prios.PrioUpdates, aff.." 26") then
      table.insert(Legacy.Curing.Prios.PrioUpdates, aff.." 26")
      Legacy.Curing.Prios.temp[aff] = 26
    end
end

function Reprio(...)
  Legacy.Curing.Prios.PrioUpdates = Legacy.Curing.Prios.PrioUpdates or {}
  local argAffs = {...}
  
  for _, aff in pairs(argAffs) do
    local aff = aff:title()
    if (Legacy.Curing.Prios.temp[aff] < Legacy.Curing.Prios.legacy[aff]) or (Legacy.Curing.Prios.temp[aff] > Legacy.Curing.Prios.legacy[aff]) and not table.contains(Legacy.Curing.Prios.PrioUpdates, aff.." "..Legacy.Curing.Prios.legacy[aff]) then
      table.insert(Legacy.Curing.Prios.PrioUpdates, aff.." "..Legacy.Curing.Prios.legacy[aff])
      Legacy.Curing.Prios.temp[aff] = Legacy.Curing.Prios.legacy[aff]
    end
  end    
end

function Prio(aff, pos)
  if pos == nil then pos = 1 end
  Legacy.Curing.Prios.PrioUpdates = Legacy.Curing.Prios.PrioUpdates or {}
  local aff = aff:title()
  if Legacy.Curing.Prios.temp[aff] ~= pos and not table.contains(Legacy.Curing.Prios.PrioUpdates, aff.." "..pos) then
    table.insert(Legacy.Curing.Prios.PrioUpdates, aff.." "..pos)
    Legacy.Curing.Prios.temp[aff] = pos
  end
end


function UpdatePrios()
if Legacy == nil then return end
  Legacy.Curing.Prios.PrioUpdates = Legacy.Curing.Prios.PrioUpdates or {}
  if table.size(Legacy.Curing.Prios.PrioUpdates) > 0 then
    send("curing priority "..table.concat(Legacy.Curing.Prios.PrioUpdates, " "))
    Legacy.Curing.Prios.PrioUpdates = {}
  end
  
end
registerAnonymousEventHandler("LPrompt", "UpdatePrios")