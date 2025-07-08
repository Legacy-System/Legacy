function ClassTimer(who, class)
  if Legacy then

    local class = class:title() or "none"
    local who = who or target
    local warriors = {"Paladin", "Runewarden", "Unnamable", "Infernal"}
    local specs    = {"SnB", "DwC", "DwB", "2H"}
    
    if Legacy.CT.timers[who] == nil then    
       Legacy.CT.trackedClass =  class
    else
      Legacy.CT.trackedClass = Legacy.CT.timers[who].class
    end
    
    if Legacy.CT.Enemies[who:title()] == nil then
     Legacy.CT.Enemies[who:title()] = ""
     Legacy.NDB.db[who:title()].class = class:title()
     if Legacy.NDB.db[who:title()].city ~= Legacy.NDB.db[gmcp.Char.Status.name].city then
      send("queue add freestand enemy "..who)
     end
    elseif Legacy.CT.Enemies[who:title()] == "" then
     Legacy.echo("<red>Adjusted "..who:title().." from <gold> "..Legacy.CT.Enemies[who:title()].." <red>to <gold>"..class:title())
     Legacy.CT.Enemies[who:title()] = class:title()
     Legacy.NDB.db[who:title()].class = class:title()
    end
  

    
      
    for k, v in pairs(Legacy.CT.timers) do
      if Legacy.CT.timers[k].class:match(class) and k == who then
        killTimer(Legacy.CT.timers[k].timer)
        Legacy.CT.timers[who] = {["class"] = Legacy.CT.trackedClass, ["timer"] = tempTimer(120, function()  Legacy.echo("Removed <gold>"..Legacy.CT.timers[who].class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white> from enemy consideration.") Legacy.CT.timers[who] = nil raiseEvent("removedClass") end)}
        enClass = Legacy.CT.trackedClass
        Legacy.CT.Enemies[who:title()] = enClass:title()
        Legacy.NDB.db[who:title()].class = enClass:title()
        return
      end
    end
    
    if Legacy.CT.timers[who] == nil then
      Legacy.echo("Curing against <gold>"..class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white>.")
      Legacy.CT.timers[who] = {["class"] = class, ["timer"] = tempTimer(120, function()  Legacy.echo("Removed <gold>"..Legacy.CT.timers[who].class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white> from enemy consideration.") Legacy.CT.timers[who] = nil raiseEvent("removedClass") end)}       
      enClass = class
      Legacy.CT.Enemies[who:title()] = enClass:title()
      Legacy.NDB.db[who:title()].class = enClass:title()      
    else
      if table.contains(specs, class) and table.contains(warriors, Legacy.CT.timers[who].class) then
          killTimer(Legacy.CT.timers[who].timer)
          Legacy.CT.timers[who] = {["class"] = Legacy.CT.trackedClass..class, ["timer"] = tempTimer(120, function()  Legacy.echo("Removed <gold>"..Legacy.CT.timers[who].class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white> from enemy consideration.") Legacy.CT.timers[who] = nil raiseEvent("removedClass") end)}
          Legacy.echo("Curing against <gold>"..Legacy.CT.trackedClass..class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white>.")
          enClass = Legacy.CT.trackedClass..class
          Legacy.CT.Enemies[who:title()] = enClass:title()
          Legacy.NDB.db[who:title()].class = enClass:title()
  
      elseif table.contains(warriors, class) and table.contains(specs, Legacy.CT.timers[who].class) then
          killTimer(Legacy.CT.timers[who].timer)
          Legacy.CT.timers[who] = {["class"] = class..Legacy.CT.trackedClass, ["timer"] = tempTimer(120, function()  Legacy.echo("Removed <gold>"..Legacy.CT.timers[who].class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white> from enemy consideration.") Legacy.CT.timers[who] = nil raiseEvent("removedClass") end)}
          Legacy.echo("Curing against <gold>"..class..Legacy.CT.trackedClass.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white>.")
          enClass = class..Legacy.CT.trackedClass
          Legacy.CT.Enemies[who:title()] = enClass:title()
          Legacy.NDB.db[who:title()].class = enClass:title()

      else
        killTimer(Legacy.CT.timers[who].timer)
        Legacy.CT.timers[who] = {["class"] = class, ["timer"] = tempTimer(120, function()  Legacy.echo("Removed <gold>"..Legacy.CT.timers[who].class.." <DimGrey>("..Legacy.NDB.color(who)..who:title().."<DimGrey>)<white> from enemy consideration.") Legacy.CT.timers[who] = nil raiseEvent("removedClass") end)}
        enClass = class
        Legacy.CT.Enemies[who:title()] = enClass:title()
        Legacy.NDB.db[who:title()].class = enClass:title()
      end
    end
    
    if table.size(Legacy.CT.timers) == 3 then
      Legacy.echo("<b><red>Perhaps we should flee!")
      enClass = "Group"
    elseif table.size(Legacy.CT.timers) > 3 then
      enClass = "Group"
      return
    end
    
    
    
  end--end of Legacy Check
end --End of Function

function TimerCheck()
  if table.size(Legacy.CT.timers) == 0 then
    gagprios = true
    Curing_Reset()
    enClass = ""
    Legacy.echo("No longer tracking any enemies...")
    Legacy.echo("Resetting Affliction Priorities.")
  end
end
registerAnonymousEventHandler("removedClass", "TimerCheck")