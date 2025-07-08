function DefAdd()
  if Legacy then
    Legacy.Curing.Defs.ignore = {"heldbreath", "parrying (left leg)","parrying (right leg)","parrying (left arm)", "parrying (right arm)", "parrying (torso)", "parrying (head)"}
    Legacy.Curing.Defs.current = Legacy.Curing.Defs.current or {}
    if not Legacy.Curing.Defs.current[gmcp.Char.Defences.Add.name] and not gmcp.Char.Defences.Add.name:match("parrying") and not table.contains(Legacy.Curing.Defs.ignore, gmcp.Char.Defences.Add.name) then
      local DefAdded = gmcp.Char.Defences.Add.name
      Legacy.Curing.Defs.current[gmcp.Char.Defences.Add.name] = true
      if Legacy.Settings.Curing.cureEchos then cecho("\n<white>[<green>DEF<white>]: <green>"..DefAdded:title()) end
    end
    if gmcp.Char.Defences.Add.name == "prismatic" then
      send("curing off")
    end
    addedDefs = addedDefs or {}
    if not table.contains(Legacy.Curing.Defs[Legacy.Curing.Defs.currentset].keepup, gmcp.Char.Defences.Add.name ) then
      if Legacy.Curing.Defs.tracking[gmcp.Char.Defences.Add.name] ~= 0 and  not table.contains(Legacy.Curing.Defs.ignore, gmcp.Char.Defences.Add.name)then
        if not table.contains(addedDefs, gmcp.Char.Defences.Add.name) then
          table.insert(addedDefs, gmcp.Char.Defences.Add.name)
        end
        
          local presend = "curing priority defense "
          
            tempPromptTrigger(function() if table.size(addedDefs) > 0 then send(presend.." "..table.concat(addedDefs, " reset ").." reset") addedDefs = {} end end, 1)
          
            Legacy.Curing.Defs.tracking[gmcp.Char.Defences.Add.name] = 0
      end
    end
  end
end