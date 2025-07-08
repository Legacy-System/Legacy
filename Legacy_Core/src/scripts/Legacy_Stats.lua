function Legacy_Stats()
  if Legacy and gmcp.Char.Vitals then
    if Legacy[gmcp.Char.Status.name] == nil then
      Legacy[gmcp.Char.Status.name] = {}
    end
    local Profile = Legacy[gmcp.Char.Status.name]
    local bleed = string.gsub(gmcp.Char.Vitals.charstats[1], "Bleed: ", "")
    
    local warriors = {"Paladin", "Runewarden", "Unnamable", "Infernal"}
    if table.contains(warriors, gmcp.Char.Status.class) and Profile then
      for _,v in pairs(gmcp.Char.Vitals.charstats) do
        if v:match("Spec:") then
          local wepspec = string.gsub(gmcp.Char.Vitals.charstats[_], "Spec: ", "")
          if wepspec == "Sword and Shield" then
            Profile.wepspec = "SnB"
          elseif wepspec == "Dual Cutting" then
            Profile.wepspec = "DwC"        
          elseif wepspec == "Dual Blunt" then
            Profile.wepspec = "DwB"      
          elseif wepspec == "Two Handed" then
            Profile.wepspec = "2H"
          elseif wepspec == "None" then
            Profile.wepspec = "None"      
          end
        end
      end
    else
      Profile.wepspec = "NA"
    end
    
    Profile.class = gmcp.Char.Status.class:title()
    if tonumber(gmcp.Char.Vitals.hp) == nil then
      Profile.Vitals = {
          ["Health"] = 0,
          ["Mana"] = 0,
          ["Willpower"] = 0,
          ["Endurance"] = 0,
          ["MaxHP"] = 0,
          ["MaxMP"] = 0,
          ["MaxEP"] = 0,
          ["MaxWP"] = 0,
          ["hpPer"] = 0,
          ["mpPer"] = 0,
          ["wpPer"] = 0,
          ["epPer"] = 0,
          ["bleed"] = 0,
        }
    else
      Profile.Vitals =
        {
          ["Health"] = tonumber(gmcp.Char.Vitals.hp),
          ["Mana"] = tonumber(gmcp.Char.Vitals.mp),
          ["Willpower"] = tonumber(gmcp.Char.Vitals.wp),
          ["Endurance"] = tonumber(gmcp.Char.Vitals.ep),
          ["MaxHP"] = tonumber(gmcp.Char.Vitals.maxhp),
          ["MaxMP"] = tonumber(gmcp.Char.Vitals.maxmp),
          ["MaxEP"] = tonumber(gmcp.Char.Vitals.maxep),
          ["MaxWP"] = tonumber(gmcp.Char.Vitals.maxwp),
          ["hpPer"] = math.floor(gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp * 100),
          ["mpPer"] = math.floor(gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp * 100),
          ["wpPer"] = math.floor(gmcp.Char.Vitals.wp / gmcp.Char.Vitals.maxwp * 100),
          ["epPer"] = math.floor(gmcp.Char.Vitals.ep / gmcp.Char.Vitals.maxep * 100),
          ["bleed"] = tonumber(bleed),
        }
      end
      
    
    for _,v in pairs(gmcp.Char.Vitals.charstats) do
      if v:match("Karma:") then
        Profile.karma = string.gsub(gmcp.Char.Vitals.charstats[_], "Karma: ", "")
      elseif v:match("Anathema:") then
        Profile.anathema = string.gsub(gmcp.Char.Vitals.charstats[_], "Anathema: ", "")
      elseif v:match("Manifestation:") then
        Profile.manifestation = string.gsub(gmcp.Char.Vitals.charstats[_], "Manifestation: ", "")
      elseif v:match("Rage:") then
        Profile.rage = string.gsub(gmcp.Char.Vitals.charstats[_], "Rage: ", "")
        Profile.rage = tonumber(Profile.rage)
      elseif v:match("Morph:") then
        Profile.morph = string.gsub(gmcp.Char.Vitals.charstats[_], "Morph: ", "")
      elseif v:match("Voice:") then
        Profile.voice = string.gsub(gmcp.Char.Vitals.charstats[_], "Voice: ", "")
      elseif v:match("Age:") then
        Profile.age = string.gsub(gmcp.Char.Vitals.charstats[_], "Age: ", "")
      elseif v:match("Word:") then
        Profile.word = string.gsub(gmcp.Char.Vitals.charstats[_], "Word: ", "")
      elseif v:match("Stance:") then
        Profile.stance = string.gsub(gmcp.Char.Vitals.charstats[_], "Stance: ", "")
      elseif v:match("Kai:") then
        Profile.kai = string.gsub(gmcp.Char.Vitals.charstats[_], "Kai: ", "")
      elseif v:match("Kata:") then
        Profile.kata = string.gsub(gmcp.Char.Vitals.charstats[_], "Kata: ", "")
      elseif v:match("Angelpower:") then
        Profile.angelpower = string.gsub(gmcp.Char.Vitals.charstats[_], "Angelpower: ", "")
      elseif v:match("Devotion:") then
        Profile.devotion = string.gsub(gmcp.Char.Vitals.charstats[_], "Devotion: ", "")
      elseif v:match("conviction:") then
        Profile.conviction = string.gsub(gmcp.Char.Vitals.charstats[_], "conviction: ", "")
      elseif v:match("prayer_length:") then
        Profile.prayerlength = string.gsub(gmcp.Char.Vitals.charstats[_], "prayer_length: ", "")
      elseif v:match("Prayer:") then
        Profile.prayer = string.gsub(gmcp.Char.Vitals.charstats[_], "Prayer: ", "")
      elseif v:match("Wrath:") then
        Profile.wrath = string.gsub(gmcp.Char.Vitals.charstats[_], "Wrath: ", "")
      elseif v:match("wrathbal:") then
        Profile.wrathbal = string.gsub(gmcp.Char.Vitals.charstats[_], "wrathbal: ", "")
      elseif v:match("Channels:") then
        Profile.channels = string.gsub(gmcp.Char.Vitals.charstats[_], "Channels: ", "")
      elseif v:match("Shin:") then
        Profile.shin = string.gsub(gmcp.Char.Vitals.charstats[_], "Shin: ", "")
      elseif v:match("Essence:") then
        Profile.essence = string.gsub(gmcp.Char.Vitals.charstats[_], "Essence: ", "")
      elseif v:match("Spirits:") then
        Profile.spirits = string.gsub(gmcp.Char.Vitals.charstats[_], "Spirits: ", "")
      elseif v:match("epitaph_length:") then
        Profile.epitaph = string.gsub(gmcp.Char.Vitals.charstats[_], "epitaph_length: ", "")
      elseif v:match("Entity:") then
        Profile.entity = string.gsub(gmcp.Char.Vitals.charstats[_], "Entity: ", "")
      elseif v:match("empower:") then
        Profile.empower = string.gsub(gmcp.Char.Vitals.charstats[_], "empower: ", "")
      elseif v:match("Venom:") then
        Profile.venom = string.gsub(gmcp.Char.Vitals.charstats[_], "Venom: ", "")
       elseif v:match("Form:") then
        Profile.form = string.gsub(gmcp.Char.Vitals.charstats[_], "Form: ", "")   
       elseif v:match("Kata:") then
        Profile.kata = string.gsub(gmcp.Char.Vitals.charstats[_], "Kata: ", "")    
      end
    end
    
    if Profile.Vitals.Health == 0 then
      raiseEvent("Dead")
    end
  end
end

registerAnonymousEventHandler("gmcp.Char", "Legacy_Stats")
