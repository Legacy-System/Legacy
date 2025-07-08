if Legacy then
  Legacy.Settings.IGDate = Legacy.Settings.IGDate or {}
  Legacy.Settings.IGDate = {day = matches.day, month = matches.month, year = matches.year, 
  monthabrev = {
    ["Sarapin"] = "Sar",
    ["Daedalan"] = "Dae",
    ["Aeguary"] = "Aeg",
    ["Miraman"] = "Mir",
    ["Scarlatan"] = "Scar",
    ["Ero"] = "Ero",
    ["Valnuary"] = "Val",
    ["Lupar"] = "Lup",
    ["Phaestian"] = "Phae",
    ["Chronos"] = "Chr",
    ["Glacian"] = "Gla",
    ["Mayan"] = "May",
    }, 
}
 	  if Legacy.Settings.IGDate.month == "Sarapin" or Legacy.Settings.IGDate.month == "Daedalan" or Legacy.Settings.IGDate.month == "Mayan" then
      Legacy.Settings.IGDate.season =  "winter"
    end
    
    if Legacy.Settings.IGDate.month == "Aeguary" or Legacy.Settings.IGDate.month == "Miraman" or Legacy.Settings.IGDate.month == "Scarlatan" then
      Legacy.Settings.IGDate.season =  "spring"
    end
    
    if Legacy.Settings.IGDate.month == "Ero" or Legacy.Settings.IGDate.month == "Valnuary" or Legacy.Settings.IGDate.month == "Lupar" then
      Legacy.Settings.IGDate.season =  "summer"
    end
    
    if Legacy.Settings.IGDate.month == "Sarapin" or Legacy.Settings.IGDate.month == "Daedalan" or Legacy.Settings.IGDate.month == "Mayan" then
      Legacy.Settings.IGDate.season =  "winter"
    end
    
    if Legacy.Settings.IGDate.month == "Phaestian" or Legacy.Settings.IGDate.month == "Chronos" or Legacy.Settings.IGDate.month == "Glacian" then
      Legacy.Settings.IGDate.season =  "fall"
    end
    

end

