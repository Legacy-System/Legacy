




if matches[2] == nil then
  for k,v in pairs(Legacy.Settings.NDB.Config) do
    if k == "targossas" then
      cecho("\n<"..v.color..">"..k:title().."\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "mhaldor" then
      cecho("\n<"..v.color..">"..k:title().."\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "cyrene" then
      cecho("\n<"..v.color..">"..k:title().."\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "eleusis" then
      cecho("\n<"..v.color..">"..k:title().."\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "ashtan" then
      cecho("\n<"..v.color..">"..k:title().."\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "hashan" then
      cecho("\n<"..v.color..">"..k:title().."\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "(none)" then
      cecho("\n<"..v.color..">Cityless\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    elseif k == "(hidden)" then
      cecho("\n<"..v.color..">Hidden\n <orange>Color: <"..v.color..">"..v.color:title().." <orange>Bold: <"..v.color..">"..tostring(v.bold).." <orange>Italics: <"..v.color..">"..tostring(v.italics).." <orange>Underline: <"..v.color..">"..tostring(v.underline).."\n")
    end
  end
elseif matches[3] == nil then
  if matches[2] == "reset" then
    local resetlist = {}
    for k,v in pairs(Legacy.NDB.db) do
      if v.color ~= nil then
        table.insert(resetlist, "<"..v.color..">"..k)
        v.color = nil
        v.underline = nil
        v.bold = nil
        v.italics = nil
        
      end
    end
    if table.size(resetlist) > 0 then
      Legacy.echo("Removed specific coloring for: "..table.concat(resetlist, "<white>, "))
    else
      Legacy.echo("No names are in need of resetting.")
    end
  elseif matches[2] == "ash" or matches[2] == "ashtan" or matches[2] == "Ashtan" then
    local city = Legacy.Settings.NDB.Config.ashtan
    cecho("\n<"..city.color..">".."Ashtan\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title())
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.ashtan.bold == true then Legacy.Settings.NDB.Config.ashtan.bold = false Legacy.echo("Ashtan will no longer be bolded.") else Legacy.Settings.NDB.Config.ashtan.bold = true Legacy.echo("Ashtan will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.ashtan.italics == true then Legacy.Settings.NDB.Config.ashtan.italics = false Legacy.echo("Ashtan will no longer be in italics.") else Legacy.Settings.NDB.Config.ashtan.italics = true Legacy.echo("Ashtan will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.ashtan.underline == true then Legacy.Settings.NDB.Config.ashtan.underline = false Legacy.echo("Ashtan will no longer be in underline.") else Legacy.Settings.NDB.Config.ashtan.underline = true Legacy.echo("Ashtan will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  elseif matches[2] == "mdor" or matches[2] == "mhaldor" or matches[2] == "Mhaldor" then
    local city = Legacy.Settings.NDB.Config.mhaldor
    cecho("\n<"..city.color..">".."Mhaldor\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title())
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.mhaldor.bold == true then Legacy.Settings.NDB.Config.mhaldor.bold = false Legacy.echo("Mhaldor will no longer be bolded.") else Legacy.Settings.NDB.Config.mhaldor.bold = true Legacy.echo("mhaldor will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.mhaldor.italics == true then Legacy.Settings.NDB.Config.mhaldor.italics = false Legacy.echo("Mhaldor will no longer be in italics.") else Legacy.Settings.NDB.Config.mhaldor.italics = true Legacy.echo("mhaldor will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.mhaldor.underline == true then Legacy.Settings.NDB.Config.mhaldor.underline = false Legacy.echo("Mhaldor will no longer be in underline.") else Legacy.Settings.NDB.Config.mhaldor.underline = true Legacy.echo("mhaldor will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  elseif matches[2] == "ele" or matches[2] == "eleusis" or matches[2] == "Eleusis" or matches[2] == "cygreen" then
    local city = Legacy.Settings.NDB.Config.eleusis
    cecho("\n<"..city.color..">".."Eleusis\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title())
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.eleusis.bold == true then Legacy.Settings.NDB.Config.eleusis.bold = false Legacy.echo("Eleusis will no longer be bolded.") else Legacy.Settings.NDB.Config.eleusis.bold = true Legacy.echo("eleusis will now be bolded.") end end, "Click to toggle if a city' players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.eleusis.italics == true then Legacy.Settings.NDB.Config.eleusis.italics = false Legacy.echo("Eleusis will no longer be in italics.") else Legacy.Settings.NDB.Config.eleusis.italics = true Legacy.echo("eleusis will now be in italics.") end end, "Click to toggle if a city' players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.eleusis.underline == true then Legacy.Settings.NDB.Config.eleusis.underline = false Legacy.echo("Eleusis will no longer be in underline.") else Legacy.Settings.NDB.Config.eleusis.underline = true Legacy.echo("eleusis will now be in underline.") end end, "Click to toggle if a city' players will be in underline", true)
  elseif matches[2] == "hash" or matches[2] == "hashan" or matches[2] == "Hashan" then
    local city = Legacy.Settings.NDB.Config.hashan
    cecho("\n<"..city.color..">".."Hashan\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title())
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.hashan.bold == true then Legacy.Settings.NDB.Config.hashan.bold = false Legacy.echo("Hashan will no longer be bolded.") else Legacy.Settings.NDB.Config.hashan.bold = true Legacy.echo("hashan will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.hashan.italics == true then Legacy.Settings.NDB.Config.hashan.italics = false Legacy.echo("Hashan will no longer be in italics.") else Legacy.Settings.NDB.Config.hashan.italics = true Legacy.echo("hashan will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.hashan.underline == true then Legacy.Settings.NDB.Config.hashan.underline = false Legacy.echo("Hashan will no longer be in underline.") else Legacy.Settings.NDB.Config.hashan.underline = true Legacy.echo("hashan will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  
  elseif matches[2] == "targ" or matches[2] == "targossas" or matches[2] == "Targossas" or matches[2] == "goodguys" then
    local city = Legacy.Settings.NDB.Config.targossas
    cecho("\n<"..city.color..">".."Targossas\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title())
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.targossas.bold == true then Legacy.Settings.NDB.Config.targossas.bold = false Legacy.echo("Targossas will no longer be bolded.") else Legacy.Settings.NDB.Config.targossas.bold = true Legacy.echo("targossas will now be bolded.") end end, "Click to toggle if a city' players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.targossas.italics == true then Legacy.Settings.NDB.Config.targossas.italics = false Legacy.echo("Targossas will no longer be in italics.") else Legacy.Settings.NDB.Config.targossas.italics = true Legacy.echo("targossas will now be in italics.") end end, "Click to toggle if a city' players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.targossas.underline == true then Legacy.Settings.NDB.Config.targossas.underline = false Legacy.echo("Targossas will no longer be in underline.") else Legacy.Settings.NDB.Config.targossas.underline = true Legacy.echo("targossas will now be in underline.") end end, "Click to toggle if a city' players will be in underline", true)
  elseif matches[2] == "cy" or matches[2] == "cyrene" or matches[2] == "Cyrene" then
    local city = Legacy.Settings.NDB.Config.cyrene
    cecho("\n<"..city.color..">".."Cyrene\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title()) 
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.cyrene.bold == true then Legacy.Settings.NDB.Config.cyrene.bold = false Legacy.echo("Cyrene will no longer be bolded.") else Legacy.Settings.NDB.Config.cyrene.bold = true Legacy.echo("cyrene will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.cyrene.italics == true then Legacy.Settings.NDB.Config.cyrene.italics = false Legacy.echo("Cyrene will no longer be in italics.") else Legacy.Settings.NDB.Config.cyrene.italics = true Legacy.echo("cyrene will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.cyrene.underline == true then Legacy.Settings.NDB.Config.cyrene.underline = false Legacy.echo("Cyrene will no longer be in underline.") else Legacy.Settings.NDB.Config.cyrene.underline = true Legacy.echo("cyrene will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  elseif matches[2] == "gods" or matches[2] == "divine" or matches[2] == "Gods" or matches[2] == "Divine" or matches[2] == "God" or matches[2] == "god" then
    local city = Legacy.Settings.NDB.Config.divine
    cecho("\n<"..city.color..">".."Gods\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title()) 
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config.divine.bold == true then Legacy.Settings.NDB.Config.divine.bold = false Legacy.echo("Gods will no longer be bolded.") else Legacy.Settings.NDB.Config.divine.bold = true Legacy.echo("Gods will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config.divine.italics == true then Legacy.Settings.NDB.Config.divine.italics = false Legacy.echo("Gods will no longer be in italics.") else Legacy.Settings.NDB.Config.divine.italics = true Legacy.echo("Gods will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config.divine.underline == true then Legacy.Settings.NDB.Config.divine.underline = false Legacy.echo("Gods will no longer be in underline.") else Legacy.Settings.NDB.Config.divine.underline = true Legacy.echo("Gods will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  elseif matches[2] == "cityless" or matches[2] == "rogues" or matches[2] == "Rogues" or matches[2] == "Cityless" then
    local city = Legacy.Settings.NDB.Config["(none)"]
    cecho("\n<"..city.color..">".."Cityless\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title()) 
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config["(none)"].bold == true then Legacy.Settings.NDB.Config["(none)"].bold = false Legacy.echo("Cityless will no longer be bolded.") else Legacy.Settings.NDB.Config["(hidden)"].bold = true Legacy.echo("Cityless will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config["(none)"].italics == true then Legacy.Settings.NDB.Config["(none)"].italics = false Legacy.echo("Cityless will no longer be in italics.") else Legacy.Settings.NDB.Config["(hidden)"].italics = true Legacy.echo("Cityless will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config["(none)"].underline == true then Legacy.Settings.NDB.Config["(none)"].underline = false Legacy.echo("Cityless will no longer be in underline.") else Legacy.Settings.NDB.Config["(hidden)"].underline = true Legacy.echo("Cityless will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  elseif matches[2] == "hidden" or matches[2] == "sneakybitches" or matches[2] == "cowards" or matches[2] == "Hidden" then
    local city = Legacy.Settings.NDB.Config["(hidden)"]
    cecho("\n<"..city.color..">".."Hidden\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title()) 
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config["(hidden)"].bold == true then Legacy.Settings.NDB.Config["(hidden)"].bold = false Legacy.echo("Hidden will no longer be bolded.") else Legacy.Settings.NDB.Config["(none)"].bold = true Legacy.echo("Cityless will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config["(hidden)"].italics == true then Legacy.Settings.NDB.Config["(hidden)"].italics = false Legacy.echo("Hidden will no longer be in italics.") else Legacy.Settings.NDB.Config["(none)"].italics = true Legacy.echo("Cityless will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config["(hidden)"].underline == true then Legacy.Settings.NDB.Config["(hidden)"].underline = false Legacy.echo("Hidden will no longer be in underline.") else Legacy.Settings.NDB.Config["(none)"].underline = true Legacy.echo("Cityless will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  elseif table.contains(Legacy.Settings.NDB.Config, matches[2]) then
    local city = Legacy.Settings.NDB.Config[matches[2]]
    cecho("\n<"..city.color..">"..matches[2]:title().."\n<orange>Color: ")
    cecho("<"..city.color..">"..city.color:title()) 
    cecho("\n<orange>Bold: ")
    cechoLink("<"..city.color..">"..tostring(city.bold), function() if Legacy.Settings.NDB.Config[matches[2]].bold == true then Legacy.Settings.NDB.Config[matches[2]].bold = false Legacy.echo(matches[2].." will no longer be bolded.") else Legacy.Settings.NDB.Config[matches[2]].bold = true Legacy.echo(matches[2].." will now be bolded.") end end, "Click to toggle if a city's players will be bold", true)
    cecho("\n<orange>Italics: ")
    cechoLink("<"..city.color..">"..tostring(city.italics), function() if Legacy.Settings.NDB.Config[matches[2]].italics == true then Legacy.Settings.NDB.Config[matches[2]].italics = false Legacy.echo(matches[2].." will no longer be in italics.") else Legacy.Settings.NDB.Config[matches[2]].italics = true Legacy.echo(matches[2].." will now be in italics.") end end, "Click to toggle if a city's players will be in italics", true)
    cecho("\n<orange>Underline: ")
    cechoLink("<"..city.color..">"..tostring(city.underline), function() if Legacy.Settings.NDB.Config[matches[2]].underline == true then Legacy.Settings.NDB.Config[matches[2]].underline = false Legacy.echo(matches[2].." will no longer be in underline.") else Legacy.Settings.NDB.Config[matches[2]].underline = true Legacy.echo(matches[2].." will now be in underline.") end end, "Click to toggle if a city's players will be in underline", true)
  
  end
else
--Changes Color
  if matches[2] == "ash" or matches[2] == "ashtan" or matches[2] == "Ashtan" then
    local city = Legacy.Settings.NDB.Config.ashtan
    if table.contains(_G.color_table, matches[3]) then
      city.color = matches[3]
      Legacy.echo("<white>You have changed <gold>Ashtans's <white>color to: <"..city.color..">"..city.color:title())
    else
      Legacy.echo("That is not an option, did you mean: ")
      local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(matches[3]:lower()) or k:match(matches[3]:title()) then
          colorCount = colorCount + 1
          cechoLink("\n<"..k..">"..k, function() expandAlias("ndbs ash "..k) end, "click to set Ashtan's color to "..k, true)
        end
      end
      if colorCount == 0 then
        cechoLink("<red> 0 color suggestions, click to see available options.", function() showColors(4)end, "Click to see colors in display", true)
      end
    end
    
  elseif matches[2] == "mdor" or matches[2] == "mhaldor" or matches[2] == "Mhaldor" then
    local city = Legacy.Settings.NDB.Config.mhaldor
     if table.contains(_G.color_table, matches[3]) then
      city.color = matches[3]
      Legacy.echo("<white>You have changed <gold>Mhaldor's <white>color to: <"..city.color..">"..city.color:title())
    else
      Legacy.echo("That is not an option, did you mean: ")
      local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(matches[3]:lower()) or k:match(matches[3]:title()) then
          colorCount = colorCount + 1
          cechoLink("\n<"..k..">"..k, function() expandAlias("ndbs mhaldor "..k) end, "click to set Mhaldor's color to "..k, true)
        end
      end
      if colorCount == 0 then
        cechoLink("<red> 0 color suggestions, click to see available options.", function() showColors(4)end, "Click to see colors in display", true)
      end
    end
  elseif matches[2] == "ele" or matches[2] == "eleusis" or matches[2] == "Eleusis" then
    local city = Legacy.Settings.NDB.Config.eleusis
     if table.contains(_G.color_table, matches[3]) then
      city.color = matches[3]
      Legacy.echo("<white>You have changed <gold>Eleusis' <white>color to: <"..city.color..">"..city.color:title())
    else
      Legacy.echo("That is not an option, did you mean: ")
      local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(matches[3]:lower()) or k:match(matches[3]:title()) then
          colorCount = colorCount + 1
          cechoLink("\n<"..k..">"..k, function() expandAlias("ndbs eleusis "..k) end, "click to set Eleusis' color to "..k, true)
        end
      end
      if colorCount == 0 then
        cechoLink("<red> 0 color suggestions, click to see available options.", function() showColors(4)end, "Click to see colors in display", true)
      end
    end
  elseif matches[2] == "tar" or matches[2] == "targossas" or matches[2] == "Targossas" then
    local city = Legacy.Settings.NDB.Config.targossas
     if table.contains(_G.color_table, matches[3]) then
      city.color = matches[3]
      Legacy.echo("<white>You have changed <gold>Targossas' <white>color to: <"..city.color..">"..city.color:title())
    else
      Legacy.echo("That is not an option, did you mean: ")
      local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(matches[3]:lower()) or k:match(matches[3]:title()) then
          colorCount = colorCount + 1
          cechoLink("\n<"..k..">"..k, function() expandAlias("ndbs targossas "..k) end, "click to set Targossas' color to "..k, true)
        end
      end
      if colorCount == 0 then
        cechoLink("<red> 0 color suggestions, click to see available options.", function() showColors(4)end, "Click to see colors in display", true)
      end
    end
  elseif matches[2] == "cy" or matches[2] == "cyrene" or matches[2] == "Cyrene" then
    local city = Legacy.Settings.NDB.Config.cyrene
     if table.contains(_G.color_table, matches[3]) then
      city.color = matches[3]
      Legacy.echo("<white>You have changed <gold>Cyrene <white>color to: <"..city.color..">"..city.color:title())
    else
      Legacy.echo("That is not an option, did you mean: ")
      local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(matches[3]:lower()) or k:match(matches[3]:title()) then
          colorCount = colorCount + 1
          cechoLink("\n<"..k..">"..k, function() expandAlias("ndbs cyrene "..k) end, "click to set Cyrene' color to "..k, true)
        end
      end
      if colorCount == 0 then
        cechoLink("<red> 0 color suggestions, click to see available options.", function() showColors(4)end, "Click to see colors in display", true)
      end
    end
  elseif matches[2] == "hash" or matches[2] == "hashan" or matches[2] == "Hashan" then
    local city = Legacy.Settings.NDB.Config.hashan
     if table.contains(_G.color_table, matches[3]) then
      city.color = matches[3]
      Legacy.echo("<white>You have changed <gold>Hashan <white>color to: <"..city.color..">"..city.color:title())
    else
      Legacy.echo("That is not an option, did you mean: ")
      local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(matches[3]:lower()) or k:match(matches[3]:title()) then
          colorCount = colorCount + 1
          cechoLink("\n<"..k..">"..k, function() expandAlias("ndbs hashan "..k) end, "click to set Hashan color to "..k, true)
        end
      end
      if colorCount == 0 then
        cechoLink("<red> 0 color suggestions, click to see available options.", function() showColors(4)end, "Click to see colors in display", true)
      end
    end  
  elseif matches[2] == "hash" or matches[2] == "hashan" or matches[2] == "Hashan" then
    local city = Legacy.Settings.NDB.Config.hashan
    city.color = matches[3]
    Legacy.echo("<white>You have changed Hashan's color to: <"..city.color..">"..city.color:title())
  elseif matches[2] == "targ" or matches[2] == "targossas" or matches[2] == "Targossas" then
    local city = Legacy.Settings.NDB.Config.targossas
    city.color = matches[3]
    Legacy.echo("<white>You have changed Targossas' color to: <"..city.color..">"..city.color:title())
  elseif matches[2] == "cy" or matches[2] == "cyrene" or matches[2] == "Cyrene" then
    local city = Legacy.Settings.NDB.Config.cyrene
    city.color = matches[3]
    Legacy.echo("<white>You have changed Cyrene's color to: <"..city.color..">"..city.color:title())
  elseif matches[2] == "gods" or matches[2] == "divine" or matches[2] == "Gods" then
    local city = Legacy.Settings.NDB.Config.divine
    city.color = matches[3]
    Legacy.echo("<white>You have changed the God's color to: <"..city.color..">"..city.color:title())
  elseif matches[2] == "cityless" or matches[2] == "rogues" or matches[2] == "Rogues" or matches[2] == "Cityless" then
    local city = Legacy.Settings.NDB.Config["(none)"]
    city.color = matches[3]
    Legacy.echo("<white>You have changed the Cityless color to: <"..city.color..">"..city.color:title())    
  elseif matches[2] == "hidden" or matches[2] == "sneakybitches" or matches[2] == "cowards" or matches[2] == "Hidden" then
    local city = Legacy.Settings.NDB.Config["(hidden)"]
    city.color = matches[3]
    Legacy.echo("<white>You have changed the Hidden color to: <"..city.color..">"..city.color:title())
  elseif table.contains(Legacy.Settings.NDB.Config, matches[2]) then
   local city = Legacy.Settings.NDB.Config[matches[2]]
    city.color = matches[3]
    Legacy.echo("<white>You have changed the "..matches[2]:title().." color to: <"..city.color..">"..city.color:title())  
  elseif Legacy.NDB.db[matches[2]:title()] then
    Legacy.NDB.db[matches[2]:title()].color = matches[3]
    Legacy.echo("<white>You have changed the color for "..matches[2]:title()..": <"..Legacy.NDB.db[matches[2]:title()].color..">"..Legacy.NDB.db[matches[2]:title()].color:title())    
  end
end