if Legacy then
if gmcp.IRE == nil then
  gmcp.IRE = {}
  gmcp.IRE.Target = {}
  gmcp.IRE.Target.Info = {}
  gmcp.IRE.Target.Info.hpperc = "-1"
end
if gmcp.Char then
deleteLine()
if target == nil then
  target = gmcp.Char.Status.name
end

if gmcp.IRE then
  if gmcp.IRE.Target then
    if gmcp.IRE.Target.Info.hpperc == nil then
      tarHealth = "100%"
    else
      tarHealth = gmcp.IRE.Target.Info.hpperc:gsub("%%", "")
    end
  end
end
local vitals = Legacy[gmcp.Char.Status.name].Vitals
local stats = Legacy[gmcp.Char.Status.name]

Legacy.Settings.Prompt = Legacy.Settings.Prompt or {

["showHealth"]        = true,
["showMana"]          = true,
["showWillpower"]     = false,
["showTarget"]        = true,
["showEndurance"]     = false,
["gameDate"]          = false,
["xp"]                = false,
["rage"]              = false,
["exits"]             = true,
["defs"]              = false,
["seasons"]           = false,
["timestamps"]        = true,
["vitalsChange"]      = true,
["display"]           = "rawper",
["limbtracker"]       = false,
["showClassStats"]    = false,
}

if Legacy.Settings.usePrompt and not DelLPrompt then
  --deleteFull()
  --Set HP Colors by %
  if vitals.hpPer < 30 then
    healthColor = "red"
  elseif vitals.hpPer < 75 then
    healthColor = "yellow"
  elseif vitals.hpPer > 100 then
    healthColor = "orange"
  else
    healthColor = "forest_green"
  end
  
  --Set Mana Colors by %
  if vitals.mpPer < 30 then
    manaColor = "red"
  elseif vitals.mpPer < 75 then
    manaColor = "yellow"
  elseif vitals.mpPer > 100 then
    manaColor = "orange"
  else
    manaColor = "forest_green"
  end
  
  --Set Endurance Colors by %
  if vitals.epPer < 30 then
    endColor = "red"
  elseif vitals.epPer < 75 then
    endColor = "yellow"
  elseif vitals.epPer > 100 then
    endColor = "orange"
  else
    endColor = "forest_green"
  end
  
  --Set Willpower Colors by %
  if vitals.wpPer < 30 then
    willColor = "red"
  elseif vitals.wpPer < 75 then
    willColor = "yellow"
  elseif vitals.wpPer > 100 then
    willColor = "orange"
  else
    willColor = "forest_green"
  end
  
  --Set Target HP% by color
  if gmcp.IRE.Target then
    if gmcp.IRE.Target.Info.hpperc ~= "-1" then
      if tonumber(tarHealth) < 30 then
        tarColor = "red"
      elseif tonumber(tarHealth) < 75 then
        tarColor = "yellow"
      elseif tonumber(tarHealth) > 100 then
        tarColor = "orange"
      else
        tarColor = "forest_green"
      end
    end
  end
  
  
  
  --Move the table Show X order around to change where it will appear in your prompt
  --handling Alertness from mapper (Auto disabled from the actual mapper folder)
mmp.firstAlert = false
-- handle alertness
if mmp.alertness and next(mmp.alertness) then
  
  local dirs = {}
  for direction, _ in pairs(mmp.alertness) do dirs[#dirs+1] = direction end
  local people = select(2, next(mmp.alertness)) or {}
  --coloring people
  for _,v in pairs(people) do
    if Legacy.NDB.db[v:title()] then
      table.remove(people, table.index_of(people, v))
      table.insert(people, "<"..Legacy.Settings.NDB.Config[Legacy.NDB.db[v].city:lower()].color..">"..v)
    end
  end
  
   cecho("\n<red>[<cyan>" .. dirs[table.size(dirs)].. " <red>-".." <white>" .. table.concat(people, ', ').. "<cyan> ("..#people..")<red>]")
   mmp.alertness = nil

  raiseEvent("mmapper updated pdb")
end
  echo("\n")
  
  if Legacy.Settings.Prompt.gameDate == true then
    cecho("<ansi_yellow>(<ansi_white>"..Legacy.Settings.IGDate.monthabrev[Legacy.Settings.IGDate.month].."<ansi_yellow> <ansi_white>"..Legacy.Settings.IGDate.day.."<ansi_yellow>, <ansi_white>"..Legacy.Settings.IGDate.year.."<ansi_yellow>)")
  end
  
  if Legacy.Settings.Prompt.seasons == true then
    if Legacy.Settings.IGDate.season == "fall" then
      echo("🍁 ")
    elseif Legacy.Settings.IGDate.season == "winter" then
      echo("⛄ ")
    elseif Legacy.Settings.IGDate.season == "spring" then
      echo("🌻 ")
    elseif Legacy.Settings.IGDate.season == "summer" then
      echo("☀️ ")
    else
      echo("ðŸŒ» ")
    end
  end
  
  --Show Health
  if Legacy.Settings.Prompt.showHealth == true then
    if Legacy.Curing.Affs.blackout then
      cecho("<green>H:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        cecho("<green>H:<"..healthColor..">"..vitals.Health.."<white>|<"..healthColor..">"..vitals.hpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        cecho("<green>H:<"..healthColor..">"..vitals.hpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        cecho("<green>H:<"..healthColor..">"..vitals.Health.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        cecho("<green>H:<"..healthColor..">"..vitals.Health.."<white>|<"..healthColor..">"..vitals.MaxHP.." ")
      end
    end
  end
  
  --Show Mana
  if Legacy.Settings.Prompt.showMana == true then
    if Legacy.Curing.Affs.blackout then
      cecho("<cyan>M:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        cecho("<cyan>M:<"..manaColor..">"..vitals.Mana.."<white>|<"..manaColor..">"..vitals.mpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        cecho("<cyan>M:<"..manaColor..">"..vitals.mpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        cecho("<cyan>M:<"..manaColor..">"..vitals.Mana.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        cecho("<cyan>M:<"..manaColor..">"..vitals.Mana.."<white>|<"..manaColor..">"..vitals.MaxMP.." ")
      end
    end
  end
  
  --Show Endurance
  if Legacy.Settings.Prompt.showEndurance == true then
    if Legacy.Curing.Affs.blackout then
      cecho("<purple>E:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        cecho("<purple>E:<"..endColor..">"..vitals.Endurance.."<white>|<"..endColor..">"..vitals.epPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        cecho("<purple>E:<"..endColor..">"..vitals.epPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        cecho("<purple>E:<"..endColor..">"..vitals.Endurance.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        cecho("<purple>E:<"..endColor..">"..vitals.Endurance.."<white>|<"..endColor..">"..vitals.MaxEP.." ")
      end
    end
  end
  
  --Show Willpower
  if Legacy.Settings.Prompt.showWillpower == true then
    if Legacy.Curing.Affs.blackout then
      cecho("<yellow>W:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        cecho("<yellow>W:<"..willColor..">"..vitals.Willpower.."<white>|<"..willColor..">"..vitals.wpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        cecho("<yellow>W:<"..willColor..">"..vitals.wpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        cecho("<yellow>W:<"..willColor..">"..vitals.Willpower.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        cecho("<yellow>W:<"..willColor..">"..vitals.Willpower.."<white>|<"..willColor..">"..vitals.MaxWP.." ")
      end    
    end
  end
  
  if Legacy.Settings.Prompt.exits == true and gmcp.Room then
    local dirtab = table.deepcopy(Legacy.Room.directionTable)
    
    cecho("<ansi_yellow>[<cyan>")
    local exits = {}
    local exitcount = 0
    for k,v in pairs(gmcp.Room.Info.exits) do
      exitcount = exitcount + 1
      if exitcount < table.size(gmcp.Room.Info.exits) then
        if table.contains(Legacy.Room.Walls.Ice, tostring(k)) then
          cechoLink("<cyan>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Fire, tostring(k)) then
          cechoLink("<red>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Stone, tostring(k)) then
          cechoLink("<grey>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Thorn, tostring(k)) then
          cechoLink("<forest_green>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        else
          cechoLink("<white>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        end
      else
        if table.contains(Legacy.Room.Walls.Ice, tostring(k)) then
          cechoLink("<cyan>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Fire, tostring(k)) then
          cechoLink("<red>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Stone, tostring(k)) then
          cechoLink("<grey>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Thorn, tostring(k)) then
          cechoLink("<forest_green>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        else
          cechoLink("<white>"..k:upper().."<DimGrey>", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        end
      end
    end
    cecho("<ansi_yellow>]")
  end
  
  
  if Legacy.Settings.Prompt.xp == true then
    cecho(" <gold>"..gmcp.Char.Status.level)
  end
  
  
  if Legacy.Settings.Prompt.rage == true then
    cecho(" <ansi_yellow>Rage:<white>"..Legacy[gmcp.Char.Status.name].rage)
  end
  
  
  
  
  if Legacy.Settings.Prompt.timestamps == true then
    echo(" "..getTime(true, "hh:mm:ss").." ")
  end
  
  if Legacy.Settings.Prompt.defs == true then
    echo("-")
    
    if gmcp.Char.Vitals.eq  == "1" then
      cecho("<red>e")
    end
    if gmcp.Char.Vitals.bal == "1" then
      cecho("<red>x")
    end
    if table.contains(Legacy.Curing.Defs.current, "cloak") then
      cecho("<green>c")
    end
    if table.contains(Legacy.Curing.Defs.current, "kola") then
      cecho("<green>k")
    end
    if table.contains(Legacy.Curing.Defs.current, "blindness") then
      cecho("<green>b")
    end
    if table.contains(Legacy.Curing.Defs.current, "deafness") then
      cecho("<green>d")
    end
     echo("-")
  end
  
  --Show Class Specifics
  --Reference Legacy.{your character name}.Vitals for the variables
  
  if Legacy.Settings.Prompt.showClassStats == true then
    if gmcp.Char.Status.class == "Apostate" then
      cecho(" <ansi_yellow>Essence: <white>"..stats.essence)
    elseif gmcp.Char.Status.class == "Bard" then
      cecho(" <ansi_yellow>Voice "..stats.voice)
      cecho(" <ansi_yellow>Stance "..stats.stance)
    elseif gmcp.Char.Status.class == "Blademaster" then
      cecho(" <ansi_yellow>Shin: "..stats.shin)
      cecho(" <ansi_yellow>Stance: "..stats.stance)
    elseif gmcp.Char.Status.class == "Depthswalker" then
      cecho(" <ansi_yellow>Word : "..stats.word)
      cecho(" <ansi_yellow>Age: "..stats.age)
    elseif gmcp.Char.Status.class == "Druid" then
      cecho(" <ansi_yellow>Morph: "..stats.morph)
    elseif gmcp.Char.Status.class == "Infernal" then
      cecho(" <ansi_yellow>Essence: "..stats.essence)
    elseif gmcp.Char.Status.class == "Magi" then
      cecho(" <ansi_yellow>Channels: "..stats.channels)
    elseif gmcp.Char.Status.class == "Monk" then
      
      if stats.stance == nil then else cecho(" <ansi_yellow>Stance: "..stats.stance) end
      if stats.form == nil then else cecho(" <ansi_yellow>Form: "..stats.form) end
      if stats.kata == nil then else cecho(" <ansi_yellow>Kata: "..stats.kata) end
      cecho(" <ansi_yellow>Kai: "..stats.kai)
    elseif gmcp.Char.Status.class == "Occultist" then
      cecho(" <ansi_yellow>Karma: <white>"..stats.karma)
      cecho(" <ansi_yellow>Entity: "..stats.entity)
    elseif gmcp.Char.Status.class == "Paladin" then
      cecho(" <ansi_yellow>Wrath: "..stats.wrath)
      cecho(" <ansi_yellow>Wrath?: "..stats.wrathbal)
    elseif gmcp.Char.Status.class == "Pariah" then
      cecho(" <ansi_yellow>Epitaph: "..stats.epitaphlength)
    elseif gmcp.Char.Status.class == "Priest" then
      cecho(" <ansi_yellow>Conviction: "..stats.conviction)
      cecho(" <ansi_yellow>Prayer#: "..stats.prayerlength)
      cecho(" <ansi_yellow>Prayer?: "..stats.prayer)
      cecho(" <ansi_yellow>Angelpower: "..stats.angelpower)
      cecho(" <ansi_yellow>Devotion: "..stats.devotion)
    elseif gmcp.Char.Status.class == "Runewarden" then
      cecho(" <ansi_yellow>Empower: "..stats.empower)
    elseif gmcp.Char.Status.class == "Sentinel" then
      cecho(" <ansi_yellow>Morph: "..stats.morph)
    elseif gmcp.Char.Status.class == "Serpent" then
      cecho(" <ansi_yellow>Venom: "..stats.venom)
    elseif gmcp.Char.Status.class == "Shaman" then
      cecho(" <ansi_yellow>Spirits: "..stats.spirits)
    elseif gmcp.Char.Status.class == "Sylvan" then
      cecho(" <ansi_yellow>Channels: "..stats.channels)
    elseif gmcp.Char.Status.class == "Unnamable" then
      cecho(" <ansi_yellow>Karma: <white>"..stats.karma)
      cecho(" <ansi_yellow>Anathema: "..stats.anathema)
      cecho(" <ansi_yellow>Manifestation: "..stats.manifestation)
    end
  end
  
  
  --Show Target
  if Legacy.Settings.Prompt.showTarget == true then
    if gmcp.IRE.Target then
      if gmcp.IRE.Target.Info.id == "-1" then
        if Legacy.NDB.db[target] then
          local city = Legacy.NDB.db[target].city:lower()
          local citycolor = Legacy.Settings.NDB.Config[city].color
          if Legacy.Settings.lockPrompt == true then
            cecho(" <DimGray>[ <"..citycolor..">"..target.." <DimGray>]")
          elseif Legacy.Settings.lockPrompt == false then
            cechoLink(" <DimGray>[ <cyan>"..target.." <DimGray>]", [[expandAlias("ndb "..target)]], "click for information", true)
          end
        else
        cecho(" <DimGray>[ <orange>"..target.." <DimGray>]")
        end
      else
        if table.contains(gmcp.Char.Items.List.items, gmcp.IRE.Target.Set) then
          cecho("<DimGray> [ <cyan>"..gmcp.IRE.Target.Info.id.." <DimGray>] <ansi_white>-<"..tarColor..">"..gmcp.IRE.Target.Info.hpperc.."<ansi_white>-")
        end
      end
    end
  end
  
  if Legacy.Settings.Prompt.limbtracker == true and lb then
    cecho(lb.prompt())
  end
  
  
  if Legacy.Settings.Prompt.vitalsChange == true then
      Legacy[gmcp.Char.Status.name].newHealth = tonumber(gmcp.Char.Vitals.hp)
      Legacy[gmcp.Char.Status.name].newMana = tonumber(gmcp.Char.Vitals.mp)
      
      if (Legacy[gmcp.Char.Status.name].newHealth == Legacy[gmcp.Char.Status.name].oldHealth) and (Legacy[gmcp.Char.Status.name].newMana == Legacy[gmcp.Char.Status.name].oldMana) then
        --nothing
      elseif math.floor((Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) / gmcp.Char.Vitals.maxhp * 100) == 100 or math.floor((Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) / gmcp.Char.Vitals.maxhp * 100) == 100 or math.floor((Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) / gmcp.Char.Vitals.maxmp * 100) == 100 or math.floor((Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) / gmcp.Char.Vitals.maxmp * 100) == 100 then
        --stops from seeing everytime the prompt breaks out of blackout
      elseif math.floor(Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) > 150 or math.floor(Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) > 150 or math.floor(Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) > 150 or math.floor(Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) > 150  then 
        cecho(" <DimGrey>( ")
        if Legacy[gmcp.Char.Status.name].oldHealth > Legacy[gmcp.Char.Status.name].newHealth and math.floor(Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) > 150 then
          cecho("<ansiRed>-<red>"..math.floor(Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth).."h ")
          if math.floor((Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) / gmcp.Char.Vitals.maxhp * 100) > 0 then
            cecho("<ansiRed>"..math.floor((Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) / gmcp.Char.Vitals.maxhp * 100).."% "..Legacy.Settings.Prompt.healthLost())
          end
        elseif Legacy[gmcp.Char.Status.name].oldHealth < Legacy[gmcp.Char.Status.name].newHealth and math.floor(Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) > 150 then
          cecho("<forest_green>+<green>"..math.floor(Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth).."h ")
          if math.floor((Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) / gmcp.Char.Vitals.maxhp * 100) > 0 then
            cecho("<forest_green>"..math.floor((Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) / gmcp.Char.Vitals.maxhp * 100).."% ")
          end
        end
        
        if Legacy[gmcp.Char.Status.name].oldMana > Legacy[gmcp.Char.Status.name].newMana and math.floor(Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) > 150 then
          cecho("<ansiRed>-<red>"..math.floor(Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana).."m ")
          if math.floor((Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) / gmcp.Char.Vitals.maxmp * 100) > 0 then
            cecho("<ansiRed>"..math.floor((Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) / gmcp.Char.Vitals.maxmp * 100).."% ")
          end
        elseif Legacy[gmcp.Char.Status.name].oldMana < Legacy[gmcp.Char.Status.name].newMana and math.floor(Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) > 150 then
          cecho("<forest_green>+<green>"..math.floor(Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana).."m ")
          if math.floor((Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) / gmcp.Char.Vitals.maxmp * 100) > 0 then
            cecho("<forest_green>"..math.floor((Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) / gmcp.Char.Vitals.maxmp * 100).."% ")
          end
        end
        cecho("<DimGrey>)")
        
        if Legacy[gmcp.Char.Status.name].Vitals.bleed > 100 then
          cecho(" <DimGrey>(<ansiRed>"..Legacy[gmcp.Char.Status.name].Vitals.bleed.."B<DimGrey>)")
        end
      end
      
      Legacy[gmcp.Char.Status.name].oldHealth = tonumber(gmcp.Char.Vitals.hp)
      Legacy[gmcp.Char.Status.name].oldMana = tonumber(gmcp.Char.Vitals.mp)

  end
  if Legacy.Settings.Curing.affPrompt ~= nil and Legacy.Settings.Curing.affPrompt then
    cecho(LegacyAffPrompt())
  end
  if Legacy.Settings.Curing.status ~=  nil and Legacy.Settings.Curing.status == true then
    --nothing
  else
    cecho(" <red>(<dim_grey>PP<red>)")
  end
  if Legacy.Settings.lockPrompt == false then
  cechoPopup("*", 
  {  
  function() Legacy.echo("Right clicking might work better.") end, 
  function() if Legacy.Settings.Prompt.showHealth == true then Legacy.Settings.Prompt.showHealth = false Legacy.echo("Removed Health from the Legacy Prompt") else Legacy.Settings.Prompt.showHealth = true Legacy.echo("Added Health to the Legacy Prompt")end send("ql") end, 
  function() if Legacy.Settings.Prompt.showMana == true then Legacy.Settings.Prompt.showMana = false Legacy.echo("Removed Mana from the Legacy Prompt") else Legacy.Settings.Prompt.showMana = true Legacy.echo("Added Mana to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showTarget == true then Legacy.Settings.Prompt.showTarget = false Legacy.echo("Removed Target from the Legacy Prompt") else Legacy.Settings.Prompt.showTarget = true Legacy.echo("Added Target to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showEndurance == true then Legacy.Settings.Prompt.showEndurance = false Legacy.echo("Remoed Endurance from the Legacy Prompt") else Legacy.Settings.Prompt.showEndurance = true Legacy.echo("Added Endurance to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showWillpower == true then Legacy.Settings.Prompt.showWillpower = false Legacy.echo("Removed Willpower from the Legacy Prompt") else Legacy.Settings.Prompt.showWillpower = true Legacy.echo("Added Willpower to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.gameDate == true then Legacy.Settings.Prompt.gameDate = false Legacy.echo("Removed Game Date from the Legacy Prompt") else Legacy.Settings.Prompt.gameDate = true Legacy.echo("Added Game Date to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.exits == true then Legacy.Settings.Prompt.exits = false Legacy.echo("Removed Exits from the Legacy Prompt") else Legacy.Settings.Prompt.exits = true Legacy.echo("Added Exits to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.defs == true then Legacy.Settings.Prompt.defs = false Legacy.echo("Removed Defs from the Legacy Prompt") else Legacy.Settings.Prompt.defs = true Legacy.echo("Added Defs to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.seasons == true then Legacy.Settings.Prompt.seasons = false Legacy.echo("Removed Seasons from the Legacy Prompt") else Legacy.Settings.Prompt.seasons = true Legacy.echo("Added Seasons to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.timestamps == true then Legacy.Settings.Prompt.timestamps = false Legacy.echo("Removed Timestamps from the Legacy Prompt") else Legacy.Settings.Prompt.timestamps = true Legacy.echo("Added Timestamps to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.vitalsChange == true then Legacy.Settings.Prompt.vitalsChange = false Legacy.echo("Removed Vitals Changes from the Legacy Prompt") else Legacy.Settings.Prompt.vitalsChange = true Legacy.echo("Added Vitals Changes to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.damageType == true then Legacy.Settings.Prompt.damageType = false Legacy.echo("Removed Damage Type from the Legacy Prompt") else Legacy.Settings.Prompt.damageType = true Legacy.echo("Added Damage Type to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.limbtracker == true then Legacy.Settings.Prompt.limbtracker = false Legacy.echo("Removed Limb Tracker from the Legacy Prompt") else Legacy.Settings.Prompt.limbtracker = true Legacy.echo("Added Limb Tracker to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showClassStats == true then Legacy.Settings.Prompt.showClassStats = false Legacy.echo("Removed Class Stats from the Legacy Prompt") else Legacy.Settings.Prompt.showClassStats = true Legacy.echo("Added Class Stats to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.rage == true then Legacy.Settings.Prompt.rage = false Legacy.echo("Removed Rage from the Legacy Prompt") else Legacy.Settings.Prompt.rage = true Legacy.echo("Added Rage to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.xp == true then Legacy.Settings.Prompt.xp = false Legacy.echo("Removed Experience from the Legacy Prompt") else Legacy.Settings.Prompt.xp = true Legacy.echo("Added Experience to the Legacy Prompt") end send("ql") end,
  },
  
  {
  "Click Below to Toggle Prompt Settings",
  "Toggle Health", 
  "Toggle Mana",
  "Toggle Target",
  "Toggle Endurance",
  "Toggle Willpower",
  "Toggle Game Date",
  "Toggle Exits",
  "Toggle Defences",
  "Toggle Seasons",
  "Toggle Timestamps",
  "Toggle Vitals Changes",
  "Toggle Damage Types",
  "Toggle Limb Tracker",
  "Toggle Class Stats",
  "Toggle Rage",
  "Toggle XP",
  }, true)
  end
  end
end

end
DelLPrompt = false
deleteCheck = false
raiseEvent("LPrompt")