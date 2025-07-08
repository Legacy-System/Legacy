function Legacy_Affs()
if Legacy then
if Legacy.Settings.Curing then
Legacy.Curing.Affs = Legacy.Curing.Affs or {}
  
  if gmcp.Char.Afflictions.Add.name == "aeon" then
    Legacy.bigEcho("GAINED AEON STARTING SLOWCURE")
    send("curing batch off")
    Prio("asthma")
  end
  
  if table.contains(Legacy.Curing.Affs, gmcp.Char.Afflictions.Add.name) then
    --nothing
  else
    if table.contains(Legacy.Settings.Curing.IgnoredAffs, gmcp.Char.Afflictions.Add.name) then
      --nothing
    else 
      Legacy.Curing.Affs[gmcp.Char.Afflictions.Add.name] = true
      if gmcp.Char.Afflictions.Add.name == "amnesia" then
        send("touch hope")
      end
    end
  end
  
    
   
   if Legacy.Settings.Curing.ttsAffs then 
    --Add Afflictions that you would like to have Text to Speech say when you gain them
    local speakAffs = {"damagedleftleg", "damagedrightleg", "damagedrightarm", "damangedleftarm", "inquisition", "impaled", "damagedhead", "mangledhead"}
      if table.contains(speakAffs, gmcp.Char.Afflictions.Add.name) then
        if gmcp.Char.Afflictions.Add.name == "damagedhead" then
          ttsSpeak(gmcp.Char.Afflictions.Add.name:gsub("damaged", ""))
        elseif gmcp.Char.Afflictions.Add.name:match("damaged") then
          ttsSpeak(gmcp.Char.Afflictions.Add.name:gsub("damaged", ""))
        elseif table.contains(speakAffs, gmcp.Char.Afflictions.Add.name) then
          ttsSpeak(gmcp.Char.Afflictions.Add.name)
        end
      end
    end



end
end
end
registerAnonymousEventHandler("gmcp.Char.Afflictions.Add", "Legacy_Affs")

function WarningAff()
  --List of Afflictions you want to be block hilighted.
  local spookyaffs = {"mindravaged", "disrupted", "inquisition", "blackout", "aeon"}
  local color1 = "red"
  local color2 = "red"
  
  
    if table.contains(spookyaffs, gmcp.Char.Afflictions.Add.name) then
     local msg = gmcp.Char.Afflictions.Add.name
     
       
      cecho("\n<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<yellow>"..msg:upper().."<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=")
      cecho("\n<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<yellow>"..msg:upper().."<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=")
      cecho("\n<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<yellow>"..msg:upper().."<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=<"..color1..">=<"..color2..">=")
    end 
  

  
end
registerAnonymousEventHandler("gmcp.Char.Afflictions.Add", "WarningAff")
