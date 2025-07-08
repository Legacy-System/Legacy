if Legacy then
local vitals = Legacy[gmcp.Char.Status.name].Vitals

  if matches[2] == nil then
  cecho([[
          <ansi_yellow>Options for this command:
              Prompt <option>
          
          <ansi_white>-- <ansi_yellow>Time  <ansi_white>Toggles timestamps.
          
          <ansi_white>-- <ansi_yellow>Exits <ansi_white>Toggles exits.
          
          <ansi_white>-- <ansi_yellow>Stats <ansi_white>Choose the way Health, Willpower, Endurance, Mana display.
          
          <ansi_white>-- <ansi_yellow>Will <ansi_white>Toggles showing Willpower.
          
          <ansi_white>-- <ansi_yellow>Endurance <ansi_white>Toggles showing Willpower.

          
          
          
          
          ]])

  else
    if matches[2] == "time" or matches[2] == "Time" then
      send("ql")
      if Legacy.Settings.Prompt.timestamps == true then
        Legacy.Settings.Prompt.timestamps = false
        Legacy.echo("Removed <gold>Timestamps<white> from prompt.")
      else
        Legacy.Settings.Prompt.timestamps = true
        Legacy.echo("Added <gold>Timestamps<white> to prompt.") 
      end
    elseif matches[2] == "stats" or matches[2] == "Stats" then
      if Legacy.Settings.Prompt.display == "rawper" then
        Legacy.Settings.Prompt.display = "per"
        cecho("\n<white>Percent Only: <green>H:<"..healthColor..">"..vitals.hpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        Legacy.Settings.Prompt.display = "raw"
        cecho("\n<white>Raw Number: <green>H:<"..healthColor..">"..vitals.Health.." ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        Legacy.Settings.Prompt.display = "rawmax"
        cecho("\n<white>Raw and Max: <green>H:<"..healthColor..">"..vitals.Health.."<white>|<"..healthColor..">"..vitals.MaxHP.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        Legacy.Settings.Prompt.display = "rawper"
        cecho("\n<white>Raw and Percent: <green>H:<"..healthColor..">"..vitals.Health.."<white>|<"..healthColor..">"..vitals.hpPer.."% ")
      end
    elseif matches[2] == "exits" or matches[2] == "exits" then
       if Legacy.Settings.Prompt.exits == true then
        Legacy.Settings.Prompt.exits = false
        Legacy.echo("Removed <gold>Exits<white> from prompt.")
      else
        Legacy.Settings.Prompt.exits = true
        Legacy.echo("Added <gold>Exits<white> to prompt.") 
      end
    elseif matches[2] == "will" or matches[2] == "Will" or matches[2] == "wp" then
       if Legacy.Settings.Prompt.showWillpower == true then
        Legacy.Settings.Prompt.showWillpower = false
        Legacy.echo("Removed <gold>Willpower<white> from prompt.")
      else
        Legacy.Settings.Prompt.showWillpower = true
        Legacy.echo("Added <gold>Willpower<white> to prompt.") 
      end
    elseif matches[2] == "end" or matches[2] == "endurance" or matches[2] == "Endurance" then
       if Legacy.Settings.Prompt.showEndurance == true then
        Legacy.Settings.Prompt.showEndurance = false
        Legacy.echo("Removed <gold>Endurance<white> from prompt.")
      else
        Legacy.Settings.Prompt.showEndurance = true
        Legacy.echo("Added <gold>Endurance<white> to prompt.") 
      end        
    end
  end
end