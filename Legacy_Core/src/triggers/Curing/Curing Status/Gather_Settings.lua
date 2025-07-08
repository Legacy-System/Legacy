if matches[2] == "Sipping" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.sipping = true
  else
    Legacy.Settings.Curing.SS.Settings.sipping = false
  end
elseif matches[2] == "Affliction Curing" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.affCuring = true
  else
    Legacy.Settings.Curing.SS.Settings.affCuring = false
  end
elseif matches[2] == "Defence Upkeep" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.defUpKeep = true
  else 
    Legacy.Settings.Curing.SS.Settings.defUpKeep = false
  end
elseif matches[2] == "Curing Method" then
  Legacy.Settings.Curing.SS.Settings.method = matches[3]
elseif matches[2] == "Fallback Curing" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.fallback = true
  else
    Legacy.Settings.Curing.SS.Settings.fallback = false
  end
elseif matches[2] == "Health/Mana Priority" then
  Legacy.Settings.Curing.SS.Settings.sipPrio = matches[3]
elseif matches[2] == "Sip health at" then
  local siphealth = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.sipHealth = tonumber(siphealth)
elseif matches[2] == "Sip mana at" then
  local sipmana = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.sipMana = tonumber(sipmana)
elseif matches[2] == "Eat moss below health" then
  local eatmosshealth = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.mossHealth = tonumber(eatmosshealth)
elseif matches[2] == "Eat moss below mana" then
  local eatmossmana = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.mossMana = tonumber(eatmossmana)  
elseif matches[2] == "Use focus" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.focus = true
  else 
    Legacy.Settings.Curing.SS.Settings.focus = false
  end
elseif matches[2] == "Focus over herbs" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.focusHerb = true
  else 
    Legacy.Settings.Curing.SS.Settings.focusHerb = false
  end
elseif matches[2] == "Use tree" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.tree = true
  else 
    Legacy.Settings.Curing.SS.Settings.tree = false
  end
elseif matches[2] == "Use clot" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.clot = true
  else 
    Legacy.Settings.Curing.SS.Settings.clot = false
  end
elseif matches[2] == "Use Kaido Transmute" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.kaidoTransmute = true
  else 
    Legacy.Settings.Curing.SS.Settings.kaidoTransmute = false
  end
elseif matches[2] == "Use insomnia" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.insomnia = true
  else 
    Legacy.Settings.Curing.SS.Settings.insomnia = false
  end
elseif matches[2] == "Batch actions" then
  if matches[3] == "Yes" then
    Legacy.Settings.Curing.SS.Settings.batch = true
  else 
    Legacy.Settings.Curing.SS.Settings.batch = false
  end
elseif matches[2] == "Clot at" then
  local clotnum = string.gsub(matches[3], "bleeding", "")
  Legacy.Settings.Curing.SS.Settings.clotAt = tonumber(clotnum)
elseif matches[2] == "Will cure fractures above" then
  local fraccure = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.fracHealth = tonumber(faraccure)
elseif matches[2] == "Will use mana above" then
  local manaabove = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.manaAbove = tonumber(manaabove) 
elseif matches[2] == "Will clot health until" then
  local clothealth = string.gsub(matches[3], "%%", "")
  Legacy.Settings.Curing.SS.Settings.clotHealth = tonumber(clothealth)  
end