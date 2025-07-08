--[[ A.add This script thoroughly re-written to:
1. display green 'X' when defs on Keepup, red 'X' when defs on Defup. 
2. Click once to add to Keepup/Defup, click to remove from Keepup, click again to remove from Defup. 
3. All class defences that do not appear in the current class should appear at the bottom of Keepup display.
]]

function Keepup(arg)
  if Legacy then

    local defs = {"kola", "airpocket", "deafness", "blindness", "fangbarrier", "levitating", "temperance", "insulation", "density", "speed", "rebounding", 
    "mindseye", "cloak", "mosstattoo", "starburst", "oxtattoo", "belltattoo", "megalithtattoo", "boartattoo", "moontattoo",
    "telesense", "treewatch", "vigilance", "alertness", "groundwatch", "thirdeye", "skywatch", "softfocusing", "nightsight", 
    "hypersight", "deathsight", "lifevision", "electricresist", "fireresist", "coldresist", "magicresist", "pacing", "shroud",
    "shipwarning", "heldbreath", "selfishness", "poisonresist", "insomnia", "metawake"}
  
    local defs_resist = {"magicresist","electricresist","poisonresist","coldresist","fireresist","temperance","insulation",}
    local defs_tats = {"megalithtattoo","oxtattoo", "belltattoo", "boartattoo", "moontattoo","mosstattoo","cloak","mindseye","starburst"}
    local defs_aware = {"skywatch","treewatch","groundwatch","alertness","shipwarning","thirdeye"}
    local defs_paranoid = {"telesense","vigilance","hypersight","nightsight"}
    local defs_misc = { "kola", "deafness", "blindness", "fangbarrier", "levitating", "density", "speed", "rebounding", 
                        "airpocket","softfocusing", "deathsight", "lifevision", "pacing", "shroud", "heldbreath", "selfishness", "insomnia", "metawake"}
    local mana_drain = {"skywatch","treewatch","groundwatch","alertness","shipwarning","telesense",
                        "vigilance","hypersight","softfocusing","metawake"}
  
    local Class = {
      Alchemist = {"astronomy", "extispicy", "mercury", "sulphur", "tin" },
      Apostate = {"shroud"},
      Bard = {"acrobatics", "arrowcatching", "balancing", "drunkensailor", "gripping", "heartsfury", "aria", "lay", "songbird", "tune",},
      Blademaster = {"consciousness", "gripping", "mindnet", "projectiles", "retaliation", "shinbinding", "shinclarity", "shintrance", "standingfirm" , "toughness", "waterwalking", "weathering",}, --A.add Retaliation.
      Depthswalker = {"bodyaugment", "durability", "percision", "blur", "reflections", "disperse", "shadowveil",},
      Druid = {"affinity", "elusiveness", "evasion", "reflexes", "resistance", "stealth", "vitality", "flailingstaff" },
      Infernal = {"gripping", "weathering", "resistance", "deathaura"},
      Jester = {"acrobatics", "balancing", "gripping", "arrowcatching", "slippery"},
      Magi = {"chargeshield", "diamondskin", "stoneskin", "reflections", "stonefist" },
      Monk = {"bodyblock", "evadeblock", "pinchblock", "projectiles", "regeneration", "resistance", "splitmind", "standingfirm", "toughness", "vitality", "weathering", "mindnet", "conciousness", "mindcloak", "kaitrance"},
      Occultist = {"astralform", "lifevision", "devilmark", "distortedaura", "shroud", "tentacles", },
      Paladin = {"gripping", "faith", "fervour", "retribution", "dawnhand", "unbowed", "weathering"},
      Pariah = {},
      Priest = {"heresy", "inspiration", "thermalshield", "earthshield", "enduranceblessing", "frostshield", "willpowerblessing"},
      Psion = {"secondskin", "rupturesight", "guidedstrike", "psitranscend"},
      Runewarden = {"weathering", "gripping", "resistance",},
      Sentinel = {"barkskin", "evasion"},
      Serpent = {"weaving", "hiding", "ghost", "scales", "pacing", "shroud", "secondsight"},
      Shaman = {"gripping"},
      Sylvan = {"barkskin", "flailingstaff"},
      Unnamable = {"gripping", "weathering", "resistance"},
      Dragon = {"dragonarmour", "dragonbreath"},
      ["air Elemental Lord"] = {},
      ["water Elemental Lord"] = {},
      ["fire Elemental Lord"] = {},
      ["earth Elemental Lord"] = {},
      
      ["air Elemental Lady"] = {},
      ["water Elemental Lady"] = {},
      ["fire Elemental Lady"] = {},
      ["earth Elemental Lady"] = {},
      
      ["air Elemental Fae"] = {},
      ["water Elemental Fae"] = {},
      ["fire Elemental Fae"] = {},
      ["earth Elemental Fae"] = {},
    }
  
    local WepSpec = {
    ["SnB"] = {},
    ["DwC"] = {"blademastery"},
    ["DwB"] = {},
    ["2H"]  = {"deflect"}, --A.add
    }
    local function keepupsTable(givenTable)
      table.sort(givenTable)
      defcount = 0
      for k,v in pairs(givenTable) do
        if defcount < 4 then
          cecho("<DimGray>[")
          if table.contains(Legacy.Curing.Defs.temp.keepup, v) then
            if table.contains(mana_drain, v) then
              cechoLink("<blue>K<DimGray>] <light_sky_blue>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.keepup, table.index_of(Legacy.Curing.Defs.temp.keepup, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Keepup", true)
            else
              cechoLink("<green>K<DimGray>] <r>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.keepup, table.index_of(Legacy.Curing.Defs.temp.keepup, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Keepup", true)
            end
          elseif table.contains(Legacy.Curing.Defs.temp.defences, v) then
            if table.contains(mana_drain, v) then
              cechoLink("<ansiMagenta>D<DimGray>] <light_sky_blue>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.defences, table.index_of(Legacy.Curing.Defs.temp.defences, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Defences", true)
            else            
              cechoLink("<red>D<DimGray>] <r>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.defences, table.index_of(Legacy.Curing.Defs.temp.defences, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Defences", true)
            end
          else
            if table.contains(mana_drain, v) then
              cechoLink(" <DimGray>] <light_sky_blue>"..v:title(), function() if not table.contains(Legacy.Curing.Defs.temp.defences, v) then table.insert(Legacy.Curing.Defs.temp.defences, v)end table.insert(Legacy.Curing.Defs.temp.keepup, v) send("curing priority defense "..v.." 25") Keepup() end, "Click to add to Keepup", true)
            else
              cechoLink(" <DimGray>] <r>"..v:title(), function() if not table.contains(Legacy.Curing.Defs.temp.defences, v) then table.insert(Legacy.Curing.Defs.temp.defences, v)end table.insert(Legacy.Curing.Defs.temp.keepup, v) send("curing priority defense "..v.." 25") Keepup() end, "Click to add to Keepup", true)
            end
          end
  
          local str = #v
          local i = 0
          while i < (15 - str) do
            echo(" ")
            i = i + 1
          end
          defcount = defcount + 1
        elseif defcount >= 4 then
          echo("\n")
          defcount = 1
          cecho("<DimGray>[")
          if table.contains(Legacy.Curing.Defs.temp.keepup, v) then
            if table.contains(mana_drain, v) then
              cechoLink("<blue>K<DimGray>] <light_sky_blue>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.keepup, table.index_of(Legacy.Curing.Defs.temp.keepup, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Keepup", true)
            else
              cechoLink("<green>K<DimGray>] <r>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.keepup, table.index_of(Legacy.Curing.Defs.temp.keepup, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Keepup", true)
            end
          elseif table.contains(Legacy.Curing.Defs.temp.defences, v) then
            if table.contains(mana_drain, v) then
              cechoLink("<ansiMagenta>D<DimGray>] <light_sky_blue>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.defences, table.index_of(Legacy.Curing.Defs.temp.defences, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Defences", true)
            else            
              cechoLink("<red>D<DimGray>] <r>"..v:title(), function() table.remove(Legacy.Curing.Defs.temp.defences, table.index_of(Legacy.Curing.Defs.temp.defences, v)) send("curing priority defense "..v.." reset") Keepup() end, "Click to remove from Defences", true)
            end
          else
            if table.contains(mana_drain, v) then
              cechoLink(" <DimGray>] <light_sky_blue>"..v:title(), function() if not table.contains(Legacy.Curing.Defs.temp.defences, v) then table.insert(Legacy.Curing.Defs.temp.defences, v)end table.insert(Legacy.Curing.Defs.temp.keepup, v) send("curing priority defense "..v.." 25") Keepup() end, "Click to add to Keepup", true)
            else
              cechoLink(" <DimGray>] <r>"..v:title(), function() if not table.contains(Legacy.Curing.Defs.temp.defences, v) then table.insert(Legacy.Curing.Defs.temp.defences, v)end table.insert(Legacy.Curing.Defs.temp.keepup, v) send("curing priority defense "..v.." 25") Keepup() end, "Click to add to Keepup", true)
            end
          end
          local str = #v
          local i = 0
          while i < (15 - str) do
            echo(" ")
            i = i + 1
          end
        end
      end
    end
    if arg == nil then
      defcount = 0

      cecho("\n\n<green>Keepup <ansi_yellow>for: <cyan>"..Legacy.Curing.Defs.currentset)
      cecho("\n\n<ansi_white>Non-Class Specific Defences\n")
      cecho("\n<cyan>Resistances\n")
      keepupsTable(defs_resist)
      
      cecho("\n<cyan>Tattoos\n")
      keepupsTable(defs_tats)
      
      cecho("\n<cyan>Awareness\n")
      keepupsTable(defs_aware)
      
      cecho("\n<cyan>Paranoia\n")
      keepupsTable(defs_paranoid)
      
      cecho("\n<cyan>Misc\n")
      keepupsTable(defs_misc)

      if Legacy[gmcp.Char.Status.name].class:match("Dragon") then
        defcount = 0
        cecho("\n\n<ansi_white>Class Specific Defences\n")
        keepupsTable(Class["Dragon"])
      else
        cecho("\n\n<ansi_white>Class Specific Defences\n")
        keepupsTable(Class[gmcp.Char.Status.class])
      end
    
      local warriors = {"Paladin", "Runewarden", "Unnamable", "Infernal"}
    
      if table.contains(warriors, gmcp.Char.Status.class) then
        defcount = 0
        cecho("\n\nWeapon Spec Specific Defences\n")
        keepupsTable(WepSpec[Legacy[gmcp.Char.Status.name].wepspec])
      end --Warriors
    
      -- These should be toggled off if they're showing up:
      local OtherDefs = table.n_complement(Legacy.Curing.Defs.temp.defences, defs)
      OtherDefs = table.n_complement(OtherDefs, Class[gmcp.Char.Status.class])
      if table.contains(warriors, gmcp.Char.Status.class) then OtherDefs = table.n_complement(OtherDefs, WepSpec[Legacy[gmcp.Char.Status.name].wepspec]) end
      cecho("\n\nOther Class Specific Defences\n")
      if table.size(OtherDefs) > 0 then
        defcount = 0
        keepupsTable(OtherDefs)
      end --OtherDefs
    --
    elseif arg then
      if Legacy.Curing.Defs.tracking[arg:lower()] == 25 then
        Legacy.echo("Removed '<gold>"..arg:title().."<white>' from keepup.")
        send("curing priority defense "..arg.." reset")
        table.remove(Legacy.Curing.Defs.temp.keepup, table.index_of(Legacy.Curing.Defs.temp.keepup, arg))
      elseif Legacy.Curing.Defs.tracking[arg:lower()] == 0 then
        Legacy.echo("Added '<gold>"..arg:title().."<white>' to keepup.")
        send("curing priority defense "..arg.." 25")
        table.insert(Legacy.Curing.Defs.temp.keepup, arg)
      elseif Legacy.Curing.Defs.tracking[arg:lower()] == nil then
        Legacy.echo("<red>The Defense '<gold>"..arg:title().."<red>' is not being tracked or is not a defense.")    
      end
    end --arg
    Legacy.Curing.Defs[Legacy.Curing.Defs.currentset] = table.deepcopy(Legacy.Curing.Defs.temp)
  end --Legacy
end --func