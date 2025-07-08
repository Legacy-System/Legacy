function Aff_Remove()
  if Legacy then

  
  if Legacy.Curing.Affs[gmcp.Char.Afflictions.Remove[1]] == true then
    Legacy.Curing.Affs[gmcp.Char.Afflictions.Remove[1]] = nil
    if gmcp.Char.Afflictions.Remove[1] == "aeon" and Legacy.Settings.Curing.slowcure then
      Legacy.bigEcho("Cured Aeon, resuming normal curing.")
      Reprio("asthma")
    end
  end
  
  if Legacy.Settings.Curing.SS.Settings.batch == true and Legacy.Curing.Affs["aeon"] then
    send("curing batch off")
  end
  
  if gmcp.Char.Afflictions.Remove[1] == "aeon" then
    send("curing batch on")
  end
  
  
    if Legacy.Settings.Curing.precache == true and gmcp.Char.Afflictions.Remove[1] == "addiction" and not table.contains(Legacy.Curing.Affs, "damagedrightarm") and not table.contains(Legacy.Curing.Affs, "damagedleftarm") then
      if Legacy.Settings.Curing.SS.Settings.fallback == true then
        local cache = {"kelp", "bloodroot", "ginseng", "goldenseal", "aurum", "magnesium", "ferrum", "plumbum"}
        for _,v in pairs(cache) do
          send("outr 5 "..v)
        end  
      elseif Legacy.Settings.Curing.SS.Settings.method == "Concoctions" then
        local cache = {"kelp", "bloodroot", "ginseng", "goldenseal"}
        for _,v in pairs(cache) do
          send("outr 5 "..v)
        end
      elseif Legacy.Settings.Curing.SS.Settings.method == "Transmutation" then
        local cache = {"aurum", "magnesium", "ferrum", "plumbum"}
        for _,v in pairs(cache) do
          send("outr 5 "..v)
        end
      end
    end
  
  if Legacy.Settings.Curing.ttsAffs then 
    --Add Afflictions that you would like to have Text to Speech say when you lose them
    local speakAffs = {"inquisition", "pinshot", "lightbind", "hamstring", "tension", "ensorcelled"}
      if table.contains(speakAffs, gmcp.Char.Afflictions.Remove[1]) then
        ttsSpeak("Lost "..gmcp.Char.Afflictions.Remove[1])
      end
    end
  end
end

registerAnonymousEventHandler("gmcp.Char.Afflictions.Remove", "Aff_Remove")