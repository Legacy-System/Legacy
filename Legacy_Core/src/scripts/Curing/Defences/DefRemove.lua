function DefRemove()
  if Legacy then
    local DefRemoved = gmcp.Char.Defences.Remove[1]
    Legacy.Curing.Defs.ignore = {"heldbreath", "parrying (left leg)","parrying (right leg)","parrying (left arm)", "parrying (right arm)", "parrying (torso)", "parrying (head)",}
    Legacy.Curing.Defs.current = Legacy.Curing.Defs.current or {}
    if Legacy.Curing.Defs.current[gmcp.Char.Defences.Remove[1]] and not table.contains(Legacy.Curing.Defs.ignore, gmcp.Char.Defences.Remove[1])  then
      local DefRemoved = gmcp.Char.Defences.Remove[1]
        Legacy.Curing.Defs.current[DefRemoved] = nil
      if Legacy.Settings.Curing.cureEchos then cecho("\n<white>[<red>DEF<white>]: <red>"..DefRemoved:title()) end
    end
    if DefRemoved == "prismatic" then
        send("curing on")
    end
    
    removedDefs = removedDefs or {}
    if table.contains(Legacy.Curing.Defs[Legacy.Curing.Defs.currentset].keepup, gmcp.Char.Defences.Remove[1]) and  not table.contains(Legacy.Curing.Defs.ignore, gmcp.Char.Defences.Remove[1]) then
      if Legacy.Curing.Defs.tracking[gmcp.Char.Defences.Remove[1]] ~= 25 then
        if not table.contains(removedDefs, gmcp.Char.Defences.Remove[1]) then
          table.insert(removedDefs, gmcp.Char.Defences.Remove[1])
        end
        local presend = "curing priority defense "
        tempPromptTrigger(function() if table.size(removedDefs) > 0 then send(presend.." "..table.concat(removedDefs, " 25 ").." 25") removedDefs = {} end end, 1)
        Legacy.Curing.Defs.tracking[gmcp.Char.Defences.Remove[1]] = 25
      end
    end
  end
end