if Legacy then
  cecho("<ansi_yellow>\nCuring:\n\n")
  if Legacy.Settings.Curing.cureEchos == true then
    cechoLink(" <green>O", function() Legacy.Settings.Curing.cureEchos = false expandAlias("legacy")  end, "Click to turn off Curing Echoes", true)
    cecho("<ansi_white> Disable curing echoes.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.Curing.cureEchos = true expandAlias("legacy")  end, "Click to turn on Curing Echoes", true)
    cecho("<ansi_white> Enable curing echoes.\n")
  end
  
  if Legacy.Settings.Curing.burstset == true then
    cechoLink(" <green>O", function() Legacy.Settings.Curing.burstset = false expandAlias("legacy")  end, "Click to turn off using the Burst Defense Set", true)
    cecho("<ansi_white> Disable switching to the Burst Curing set on starbursting (0 defenses by default).\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.Curing.burstset = true expandAlias("legacy")  end, "Click to turn on using the Burst Defense Set", true)
    cecho("<ansi_white> Enable switching to the Burst Curing set on starbursting (0 defenses by default).\n")
  end
  
  if Legacy.Settings.Curing.precache == true then
    cechoLink(" <green>O", function() Legacy.Settings.Curing.precache = false expandAlias("legacy")  end, "Click to turn off Precaching", true)
    cecho("<ansi_white> Disable Precaching.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.Curing.precache = true expandAlias("legacy")  end, "Click to turn on Precaching", true)
    cecho("<ansi_white> Enable Precaching.\n")
  end

  if Legacy.Settings.Curing.slowcure == true then
    cechoLink(" <green>O", function() Legacy.Settings.Curing.slowcure = false expandAlias("legacy")  end, "Click to turn off Legacy can do slowcuring mode", true)
    cecho("<ansi_white> Disable Legacy being able to activate slowcuring mode in ret/aeon.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.Curing.slowcure = true expandAlias("legacy")  end, "Click to turn on Legacy being able to do slowcuring mode", true)
    cecho("<ansi_white> Enable Legacy being able to activate slowcuring mode in ret/aeon.\n")
  end
  
  if Legacy.Settings.Curing.ttsAffs == true then
      cechoLink(" <green>O", function() Legacy.Settings.Curing.ttsAffs = false expandAlias("legacy")  end, "Click to turn off Text to speech affliction calling.", true)
      cecho("<ansi_white> Disable TTS Affliction calling.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.Curing.ttsAffs = true expandAlias("legacy")  end, "Click to turn on Text to speech affliction calling.", true)
    cecho("<ansi_white> Enable TTS Affliction calling.\n")
  end
  
  
  cecho("<ansi_yellow>\nName Database:\n\n")
  if   Legacy.Settings.NDB.removeDormant == true then
    cechoLink(" <green>O", function()   Legacy.Settings.NDB.removeDormant = false expandAlias("legacy")  end, "Click to keep Dormant Players in your database.", true)
    cecho("<ansi_white> Will keep Dormant and Retired Players in your NDB.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.NDB.removeDormant  = true expandAlias("legacy")  end, "Click to remove Dormant Players from your database.", true)
    cecho("<ansi_white> Will remove Dormant and Retired Players from your NDB.\n")
  end 
   
  if Legacy.UI[1] == nil then
  
  else  
  if Legacy.Settings.UI.Chatbox.ignoreMobs ~= nil then 
    cecho("<ansi_yellow>\nUI:\n\n")
    if Legacy.Settings.UI.Chatbox.ignoreMobs == true then
      cechoLink(" <green>O", function() Legacy.Settings.UI.Chatbox.ignoreMobs = false expandAlias("legacy")  end, "Click to hide denizen says from the chatbox.", true)
      cecho("<ansi_white> Will hide denizen says from the chatbox.\n")
    else
      cechoLink(" <red>X", function() Legacy.Settings.UI.Chatbox.ignoreMobs  = true expandAlias("legacy")  end, "Click to show denizen says in the chatbox.", true)
      cecho("<ansi_white> Will show denizen says in the chatbox.\n")
    end 
  end
  
  end
   
  cecho("<ansi_yellow>\nGeneral:\n\n")
  if Legacy.Settings.usePrompt == true then
    cechoLink(" <green>O", function() Legacy.Settings.usePrompt = false expandAlias("legacy")  end, "Click to turn off the Legacy Prompt", true)
    cecho("<ansi_white> Disable the Legacy Prompt or toggle with 'lprompt'.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.usePrompt = true expandAlias("legacy")  end, "Click to turn on the Legacy Prompt", true)
    cecho("<ansi_white> Enable the Legacy Prompt or toggle with 'lprompt'.\n")
  end
  
  if Legacy.Settings.Curing.affPrompt == true then
    cechoLink(" <green>O", function() Legacy.Settings.Curing.affPrompt = false expandAlias("legacy")  end, "Click to turn off the Affliction Prompt", true)
    cecho("<ansi_white> Disable the Affliction Prompt.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.Curing.affPrompt = true expandAlias("legacy")  end, "Click to turn on the Affliction Prompt", true)
    cecho("<ansi_white> Enable the Affliction Prompt.\n")
  end
  
  if Legacy.Settings.ignoreUpdate == true then
    cechoLink(" <green>O", function() Legacy.Settings.ignoreUpdate = false expandAlias("legacy")  end, "Click to Ignore update notifications.", true)
    cecho("<ansi_white> Disable Upate notifications.\n")
  else
    cechoLink(" <red>X", function() Legacy.Settings.ignoreUpdate = true expandAlias("legacy")  end, "Click to See update notificiations", true)
    cecho("<ansi_white> Enable Update notifications.\n")
  end
  
    
  if Legacy.Announcement.ignore == true then
    cechoLink(" <green>O", function() Legacy.Announcement.ignore = false expandAlias("legacy")  end, "Ignore Legacy System Messages on Login.", true)
    cecho("<ansi_white> Ignore Legacy System Messages on Login.\n")
  else
    cechoLink(" <red>X", function() Legacy.Announcement.ignore = true expandAlias("legacy")  end, "Ignore Legacy System Messages on Login", true)
    cecho("<ansi_white> See Legacy System Messages on Login.\n")
  end     


end