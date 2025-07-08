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
    }}
end