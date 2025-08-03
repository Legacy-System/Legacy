function UI_Setup()
--if not Legacy then return end

  Legacy.UI = Legacy.UI or {}
  Legacy.UI.borderColor = Legacy.UI.borderColor or "DimGrey"
  Legacy.Settings.UI = Legacy.Settings.UI or {}
  Legacy.Settings.UI.Chatbox = Legacy.Settings.UI.Chatbox or {}
  Legacy.Settings.UI.Chatbox.ignoreMobs = Legacy.Settings.UI.Chatbox.ignoreMobs or false
  Legacy.Settings.UI.whoInfo = Legacy.Settings.UI.whoInfo or "class"
  Legacy.UI[gmcp.Char.Status.name] = Legacy.UI[gmcp.Char.Status.name] or {}
  
  
  --COLOR MOBS HERE
  Legacy.UI.ThingsIWantColored = {
     ["a shipmate"] = "green",
     ["a Naxian mistweaver"] = "<purple>",
     ["a Blackstone swordsman"] = "<gold>",
     ["a Shornwall defender"]   = "<pink>",
     ["a Riverwall bow-maiden"] = "<cornflower_blue>",
     ["Sensha, a brown bear cub"] = "<green>",
     ["Vesyra, a golden leopard"] = "<HotPink>",
     ["Jaydus"] = "<red>",
     
     }
  
  

  --Build the Containers/Labels/Consoles

--Where Here
  Legacy.UI.WhoHereContainer = Adjustable.Container:new({
    name = "WhoHere",
    x=0, y="-35%",                 
    width = 300, height= 300, 
  })

  WhoLabel = Geyser.Label:new({
    name = "WhoLabel",
    x = "0%", y = "0%",
    width = "100%", height = "100%",
  },Legacy.UI.WhoHereContainer)

  WhoLabel:setStyleSheet([[
    background-color: black;
    border-width: 3px;
    border-style: solid;
    border-color: ]]..Legacy.UI.borderColor..[[;
    border-radius: 10px;
  ]])

Who = Geyser.MiniConsole:new({
  name='Who',
  color='black',
  x='7', y='7',
  width = '100%-10', height = '100%-10',
  fontSize = 10,
  font = "Bitstream Vera Sans Mono",
  autoWrap = true
}, WhoLabel)


--Map

Legacy.UI.Map = Adjustable.Container:new({
  name = "Map",
  x = "30%", y = "30%",
  width = 400, height = 300,
})

wilderness_map_container = Adjustable.Container:new({
  name = "Wilderness Map",
  x = "50%", y = "30%",
  width = 400, height = 300,
}) 

MapLabel = Geyser.Label:new({
    name = "MapLabel",
    x=0, y=0,
    width = "100%", height = "100%"

}, Legacy.UI.Map)

MapLabel:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
  qproperty-wordWrap: false;
]])


Map = Geyser.Mapper:new({
  name = "Map",
  x = 3, y = 3,
  width = "100%-8", height = "100%-10",
}, Legacy.UI.Map)

Wilderness = Geyser.MiniConsole:new({
  name='Wilderness',
  color='black',
  x=3, y=3,
  width = '100%-10', height = '100%-10',
  fontSize = 10,
  scrollbar = true,
  font = "Bitstream Vera Sans Mono",
  autoWrap = false
}, wilderness_map_container)

Ocean = Geyser.MiniConsole:new({
  name='Ocean',
  color='black',
  x=3, y=3,
  width = '100%-18', height = '100%-10',
  fontSize = 10,
  scrollbar = true,
  font = "Bitstream Vera Sans Mono",
  autoWrap = false
}, wilderness_map_container)

Ocean:hide()
Wilderness:hide()
Map:show()


--Mobs
Legacy.UI.Denizens = Adjustable.Container:new({
  name = "left_container_top",
  x=0, y=0,                     
  width = 300, height="33%",
})              

MobLabel = Geyser.Label:new({
  name = "MobLabel",
  x = "0%", y = "0%",
  width = "100%", height = "100%"
}, Legacy.UI.Denizens)



MobLabel:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
]])

Mobs = Geyser.MiniConsole:new({
  name='Mobs',
  color='black',
  x='7', y='7',
  width = '100%-10', height = '100%-10',
  fontSize = 10,
  font = "Bitstream Vera Sans Mono",
  autoWrap = false
}, MobLabel)

MobTitle = Geyser.Label:new({
  name = "MobTitle",
  x = "0%", y = "0%",
  width = "100%", height = 25,
  fgColor = "Gold",
  message = [[<center>DENIZENS</center>]]
}, MobLabel)

MobTitle:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
]])



--Items
Legacy.UI.Item = Adjustable.Container:new({
  name = "Items",
  x=0, y="31.5%",                     -- this container occupies the top, so it starts top-left as well
  width = 300, height= 300, -- but only uses up half of the height
})              -- this is the important bit - it says that left_container_top should be inside left_container

ItemLabel = Geyser.Label:new({
  name = "ItemLabel",
  x = "0%", y = "0%",
  width = "100%", height = "100%"
}, Legacy.UI.Item)



ItemLabel:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
  qproperty-wordWrap: false;
]])

Items = Geyser.MiniConsole:new({
  name='Items',
  color='black',
  x='7', y='7',
  width = '100%-10', height = '100%-10',
  fontSize = 10,
  scrollbar = true,
  font = "Bitstream Vera Sans Mono",
  autoWrap = false
}, ItemLabel)

ItemTitle = Geyser.Label:new({
  name = "ItemTitle",
  x = "0%", y = "0%",
  width = "100%", height = 25,
  fgColor = "Gold",
  message = [[<center>ITEMS</center>]]
}, ItemLabel)

ItemTitle:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
]])

--Chatbox
Legacy.UI.Chatbox = {
  tabs = {"All", "Direct", "Tells", "Says", "Party", "City", "Clans", "Market", "House", "Newbie"},
  height = "30%",
  width  = "30%",
  current = "All",
  color1  = Legacy.UI.borderColor,
  color2  = "black",
}

Legacy.UI.Chatbox.current = Legacy.UI.Chatbox.current or Chatbox.tabs[1]

Legacy.UI.Chatbox.container = Adjustable.Container:new({
  name = "Chatbox",
  x = "69%", y = "-30%",
  width = Legacy.UI.Chatbox.width,
  height = Legacy.UI.Chatbox.height,
})

Legacy.UI.Chatbox.header = Geyser.HBox:new({
  name = "Chatbox.header",
  x = 0, y = 0,
  width = "100%",
  height = "10%",
},Legacy.UI.Chatbox.container)

Legacy.UI.Chatbox.footer = Geyser.Label:new({
  name = "Chatbox.footer",
  x = 0, y = "10%",
  width = "100%",
  height = "90%",
},Legacy.UI.Chatbox.container)


Legacy.UI.Chatbox.center = Geyser.Label:new({
  name = "Chatbox.center",
  x = 0, y = 0,
  width = "100%",
  height = "100%",
},Legacy.UI.Chatbox.footer)

Legacy.UI.Chatbox.center:setStyleSheet([[
  background-color: ]]..Legacy.UI.Chatbox.color2..[[;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
]])



for k,v in pairs(Legacy.UI.Chatbox.tabs) do
--echo(v.."\n")
Legacy.UI.Chatbox[v.."tab"] = Geyser.Label:new({
    name = "Chatbox."..v.."tab",
  },Legacy.UI.Chatbox.header)
  
  Legacy.UI.Chatbox[v.."tab"]:setStyleSheet([[
    background-color: ]]..Legacy.UI.Chatbox.color1..[[;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    margin-right: 1px;
    margin-left: 1px;
  ]])
  Legacy.UI.Chatbox[v] = Geyser.MiniConsole:new({
    name = "Chatbox."..v,
    x = 7, y = 0,
    width = "99%",
    height = "99%",
    autoWrap = true,
    color = "black",
    scrollBar = true,
    fontSize = 10,
  },Legacy.UI.Chatbox.footer)

Legacy.UI.Chatbox[v.."tab"]:echo("<center>"..v)
Legacy.UI.Chatbox[v.."tab"]:setClickCallback("Legacy.Settings.UI.tabs", v)
Legacy.UI.Chatbox[v]:hide()
Legacy.UI.Chatbox.All:show()
end

  function Legacy.Settings.UI.tabs(tab)
   Legacy.UI.Chatbox[Legacy.UI.Chatbox.current]:hide()
    Legacy.UI.Chatbox[Legacy.UI.Chatbox.current.."tab"]:setStyleSheet([[
    background-color: ]]..Legacy.UI.Chatbox.color1..[[;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    margin-right: 1px;
    margin-left: 1px;
    ]])
    Legacy.UI.Chatbox.current = tab
    Legacy.UI.Chatbox[tab.."tab"]:setStyleSheet([[
    background-color: black;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    margin-right: 1px;
    margin-left: 1px;
  ]])
    Legacy.UI.Chatbox[Legacy.UI.Chatbox.current]:show()
  end
  
  
  --Player Info Card
  Legacy.UI.PlayerInfo = Adjustable.Container:new({
  name = "PlayerInfo",
  x = "30%", y = "30%",
  width = 550, height = 200,
})

PlayerLabel = Geyser.Label:new({
    name = "PlayerLabel",
    x = 0, y = 0,
    width = "100%", height = "100%",
}, Legacy.UI.PlayerInfo)

PlayerLabel:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
]])

PlayerTitleLabel = Geyser.Label:new({
  name = "PlayerTitle",
  x = 3, y = 3,
  width = math.floor((#gmcp.Char.Status.fullname)*6), height = 25,
}, PlayerLabel)

PlayerMsgsLabel = Geyser.Label:new({
  name = "PlayerMsgs",
  x = math.floor((#gmcp.Char.Status.fullname*6) + 2), y = 3,
  width = "100%-"..math.floor((#gmcp.Char.Status.fullname*6) + 5), height = 25,
}, PlayerLabel)

PlayerTitleLabel:setStyleSheet([[
  background-color: rgb(32,32,32);
  border-width: 1px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 1px;
]])

PlayerMsgsLabel:setStyleSheet([[
  background-color: rgb(32,32,32);
  border-width: 1px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 1px;
]])


PlayerStatusConsole = Geyser.MiniConsole:new({
  name = "PlayerConsole",
  color='black',
  x=5, y= 28,
  width = '100%-9', height = '100%-32',
  fontSize = 10,
  scrollbar = true,
  font = "Bitstream Vera Sans Mono",
  autoWrap = false
    
}, PlayerLabel)

function TitleCard()
PlayerTitleLabel = Geyser.Label:new({
  name = "PlayerTitle",
  x = 3, y = 3,
  width = math.floor((#gmcp.Char.Status.fullname)*6), height = 25,
}, PlayerLabel)

PlayerMsgsLabel = Geyser.Label:new({
  name = "PlayerMsgs",
  x = math.floor((#gmcp.Char.Status.fullname*6) + 2), y = 3,
  width = "100%-"..math.floor((#gmcp.Char.Status.fullname*6) + 5), height = 25,
}, PlayerLabel)
PlayerStatusConsole:clear()
PlayerTitleLabel:cecho("<gold>"..gmcp.Char.Status.fullname)
PlayerMsgsLabel:cecho("<gold>Msgs: <white>"..gmcp.Char.Status.unread_msgs.."     <gold>News: <white>"..gmcp.Char.Status.unread_news.."  <gold>Gold: <white>"..gmcp.Char.Status.gold.."  <gold>Banked:<white> "..gmcp.Char.Status.bank)
PlayerStatusConsole:cecho("\n<gold>Level: <white>"..gmcp.Char.Status.level)
PlayerStatusConsole:cecho("     <gold>Class: <white>"..gmcp.Char.Status.class)
PlayerStatusConsole:cecho("\n\n<gold>Race: <white>"..gmcp.Char.Status.gender:title().." "..gmcp.Char.Status.race.." "..gmcp.Char.Status.specialisation)
PlayerStatusConsole:cecho("\n\n<gold>Endurance: <magenta>"..math.floor((tonumber(gmcp.Char.Vitals.ep)/tonumber(gmcp.Char.Vitals.maxep))* 100).."%".."  <gold>Willpower: <yellow>"..math.floor((tonumber(gmcp.Char.Vitals.wp)/tonumber(gmcp.Char.Vitals.maxwp))* 100).."%")
end
registerAnonymousEventHandler("gmcp.Char.Vitals", "TitleCard")
  


--Bars
function Build_Bars()
  if not gmcp.Char or not gmcp.Room then
    tempTimer(3, [[Build_Bars()]])
    return
  end
  HPContainer = HPContainer or Adjustable.Container:new({
    name = "HPContainer",
    x = "30%", y = "30%",
    width = 400, height = 100
  })


  HPBarBack = Geyser.Label:new({
    name = "HPBack",
    x= 0, y=0,
    width = "100%", height = "100%",
  }, HPContainer)

  HPBarBack:setStyleSheet([[
    background-color: black;
    border-width: 3px;
    border-style: solid;
    border-color: ]]..Legacy.UI.borderColor..[[;
    border-radius: 10px;
  ]])

HPBar = Geyser.Gauge:new({
  name="HPBar",
  x=3, y=3,
  width="100%-7", height="100%-7",
}, HPBarBack)


HPBar.front:setStyleSheet([[background-color: green;
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 7;
    padding: 3px;
]])
HPBar.back:setStyleSheet([[background-color: DimGrey;
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 7;
    padding: 3px;
]])


HPBar:setValue(tonumber(gmcp.Char.Vitals.maxhp) ,tonumber(gmcp.Char.Vitals.maxhp))

MPContainer = Adjustable.Container:new({
  name = "MPContainer",
  x = "30%", y = "30%",
  width = 400, height = 100
})


MPBarBack = Geyser.Label:new({
  name = "MPBack",
  x= 0, y=0,
  width = "100%", height = "100%",
}, MPContainer)

MPBarBack:setStyleSheet([[
  background-color: black;
  border-width: 3px;
  border-style: solid;
  border-color: ]]..Legacy.UI.borderColor..[[;
  border-radius: 10px;
]])

MPBar = Geyser.Gauge:new({
  name="MPBar",
  x=3, y=3,
  width="100%-7", height="100%-7",
}, MPBarBack)


MPBar.front:setStyleSheet([[background-color: DeepSkyBlue;
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 7;
    padding: 3px;
]])

MPBar.back:setStyleSheet([[background-color: pink;
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 7;
    padding: 3px;
]])


MPBar:setValue(tonumber(gmcp.Char.Vitals.maxmp) ,tonumber(gmcp.Char.Vitals.maxmp))
end
registerAnonymousEventHandler("LegacyLoaded", "Build_Bars")
Build_Bars() 

  
  function Legacy.UI.WhoHere()
    Who:clear()
    if gmcp.Room.Info.area == "" and gmcp.Room.Info.num == -2 and gmcp.Room.Info.environment == "Vessel" then
      Who:cecho("<gold>Area<white>: <ansi_white>A Ship!\n")
      Who:cecho("<gold>Room<white>: <ansi_white>"..gmcp.Room.Info.name.."\n") 
    else
      Who:cecho("<gold>Area<white>: <ansi_white>"..gmcp.Room.Info.area.."\n")
      Who:cecho("<gold>Room<white>: <ansi_white>"..gmcp.Room.Info.name.." <DimGrey>(<gold>"..gmcp.Room.Info.num.."<DimGrey>)\n") 
    end
    
    Who:cecho("\n<OrangeRed>Who Here: <OrangeRed>(<white>"..math.floor(table.size(Legacy.Room.players) - 1).."<OrangeRed>)\n")
    
     Legacy.UI.isDead = {}
    for k,v in pairs(Legacy.Room.players) do
      if table.contains(gmcp.Room.Players, "the soul of "..k) then
       table.insert(Legacy.UI.isDead, k)
      end
    end

  for k, v in pairs(Legacy.Room.players) do
    local info = Legacy.Settings.UI.whoInfo
    if Legacy.NDB.db[tostring(k)] == nil then
      Legacy.NDB.lookup(tostring(k))
    elseif Legacy.NDB.db[tostring(k)].city:lower() == nil then
    elseif Legacy.NDB.db[tostring(k)].city:lower() == Legacy.NDB.db[gmcp.Char.Status.name].city:lower() and tostring(k) == gmcp.Char.Status.name then
    elseif Legacy.NDB.db[tostring(k)].city then
      if table.contains(Legacy.UI.isDead, tostring(k)) then
        Who:cechoLink("<"..Legacy.Settings.NDB.Config[Legacy.NDB.db[tostring(k)].city:lower()].color..">"..tostring(k).." <DimGrey>(<red><b>DEAD</b><DimGrey>)", function() expandAlias("ndb "..tostring(k)) end, "Click to show NDB Info.", true) if info ~= "none" then Who:cecho(" <DimGrey>(") Who:cechoPopup(Legacy.NDB.db[tostring(k)][info], {function() Legacy.Settings.UI.whoInfo = "class" raiseEvent("UI Update") end, function() Legacy.Settings.UI.whoInfo = "level" raiseEvent("UI Update") end, function() Legacy.Settings.UI.whoInfo = "ArmyRank" raiseEvent("UI Update") end}, {"Click to show class.", "Click to show level.", "Click to show Army Rank"}, true) Who:cecho("<DimGrey>)") end Who:echo("\n")
      else
        Who:cechoLink("<"..Legacy.Settings.NDB.Config[Legacy.NDB.db[tostring(k)].city:lower()].color..">"..tostring(k), function() expandAlias("ndb "..tostring(k)) end, "Click to show NDB Info.", true) if info ~= "none" then Who:cecho(" <DimGrey>(") Who:cechoPopup(Legacy.NDB.db[tostring(k)][info], {function() Legacy.Settings.UI.whoInfo = "class" raiseEvent("UI Update") end, function() Legacy.Settings.UI.whoInfo = "level" raiseEvent("UI Update") end, function() Legacy.Settings.UI.whoInfo = "ArmyRank" raiseEvent("UI Update") end}, {"Click to show class.", "Click to show level.", "Click to show Army Rank"}, true) Who:cecho("<DimGrey>)") end Who:echo("\n")
      end 
    elseif not city then
      Who:cecho("<orange>"..tostring(k).."\n")
    else
      Who:cecho("<orange>"..tostring(k).."\n")
    end
   end
  Who:echo("\n")
  end
registerAnonymousEventHandler("gmcp.Room.Players", "Legacy.UI.WhoHere")
  
  
 --[[ 
  function Legacy.UI.Mobs()
    Mobs:clear()
    Mobs:echo("\n\n")
      for k,v in pairs(Legacy.Room.mobs) do
        local thing = v
        local id = k
        if Legacy.Basher then
          if Legacy.Settings.Basher.status == true then
            if Legacy.Settings.Basher.currentTar == k then
              Mobs:cecho("<ansi_white>[<SeaGreen>T<ansi_white>] ")
            end
            if table.contains(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower()) then
              Mobs:cechoPopup("<ansi_red>"..v, {function() 
                if not table.contains(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower()) then
                  table.insert(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower())
                  Legacy.echo("Added '<gold>"..v.."<white>' to hunting targets in <gold>"..gmcp.Room.Info.area)
                  send("ql")
                  PrioUpdate()
                end
              end, function() send("attack "..id) end,}, {"Add "..thing.." to hunting targets in "..gmcp.Room.Info.area, "Attack "..thing}, true) Mobs:echo("\n")
            elseif table.contains(Legacy.Settings.Basher.Ignore, v:lower()) then
              Mobs:cechoPopup("<ansi_green>"..v, {function() 
                if not table.contains(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower()) then
                  table.insert(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower())
                  Legacy.echo("Added '<gold>"..v.."<white>' to hunting targets in <gold>"..gmcp.Room.Info.area)
                  send("ql")
                  PrioUpdate()
                end
            end, function() send("attack "..id) end,}, {"Add "..thing.." to hunting targets in "..gmcp.Room.Info.area, "Attack "..thing}, true) Mobs:echo("\n")
            else
              Mobs:cechoPopup("<ansi_light_yellow>"..v, {function() 
                if not table.contains(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower()) then
                  table.insert(Legacy.Basher.Targets[gmcp.Room.Info.area], v:lower())
                  Legacy.echo("Added '<gold>"..v.."<white>' to hunting targets in <gold>"..gmcp.Room.Info.area)
                  send("ql")
                  PrioUpdate()
                end
            end, function() send("attack "..id) end,}, {"Add "..thing.." to hunting targets in "..gmcp.Room.Info.area, "Attack "..thing}, true) Mobs:echo("\n")
          end
          else
            Mobs:cechoPopup("<ansi_white>"..v, {function() send("greet "..id) end, function() send("attack "..id) end, function() send("get "..id) end}, {"Greet "..thing, "Attack "..thing, "Get "..thing}, true) Mobs:echo("\n")
          end
        else
            Mobs:cechoPopup("<ansi_white>"..v, {function() send("greet "..id) end, function() send("attack "..id) end, function() send("get "..id) end}, {"Greet "..thing, "Attack "..thing, "Get "..thing}, true) Mobs:echo("\n")
        end
      end
  end
]]

 function Legacy.UI.Mobs()
    Mobs:clear()
    Mobs:echo("\n\n")

     MobCountTable = {} 
      for k,v in pairs(Legacy.Room.mobs) do
        if MobCountTable[v] == nil then
          MobCountTable[v] = {}
          MobCountTable[v].count = 1
        else
          MobCountTable[v].count = MobCountTable[v].count + 1
        end
        
        
      end
      table.sort(MobCountTable)
      for k,v in pairs(MobCountTable) do
          if MobCountTable[k].count > 1 then
            Mobs:cecho((Legacy.UI.ThingsIWantColored[k] or "<white>")..k.." <white>x"..MobCountTable[k].count.."\n")
          else
            Mobs:cecho((Legacy.UI.ThingsIWantColored[k] or "<white>")..k.."\n")
          end
        end
     end
registerAnonymousEventHandler("gmcp.Char.Items", "Legacy.UI.Mobs")
  
  function Legacy.UI.Items()
    Items:clear()
    Items:echo("\n\n")
    for k,v in pairs(Legacy.Room.items) do
      if v == "a large wall of ice" then
        Items:cecho("<DeepSkyBlue>"..v.."\n")
      elseif v == "a scorching wall of fire" then
        Items:cecho("<firebrick>"..v.."\n")
      elseif v == "a large wall of stone" then
        Items:cecho("<DimGrey>"..v.."\n")
      elseif v == "a ballista" then
        Items:cecho("<DarkViolet>"..v.."\n")
      elseif v == "an onager" then
        Items:cecho("<steel_blue>"..v.."\n")
      elseif v:match("the corpse of ") then
        local person = v:gsub("the corpse of ", "")
        Items:cecho("<DimGrey>the corpse of <"..(Legacy.Settings.NDB.Config[Legacy.NDB.db[person].city:lower()].color or "white")..">"..person.."\n")
      elseif v == "a tall stone beacon" then
        Items:cecho("<ansiLightMagenta>"..v.."\n")
      elseif v == "an Arcanian arm thrower" then
        Items:cecho("<DarkOrange>"..v.."\n")
      elseif v:match("a shrine of ") then
        Items:cechoPopup("<green>"..v, {function() send("queue add freestand get "..k) end, function() send("queue add freestand generosity") send("queue add freestand offer corpses") send("queue add freestand selfishness") end}, {"Probe "..v, "Offer corpses to "..v:gsub("a shrine of ", "")}, true) Items:echo("\n")
      elseif v:match("a metal tank") then
        Items:cechoPopup("<red>"..v, {function() send("queue add freestand curing off") send("queue add freestand dissarm "..k) end, function() send("queue add freestand curing off") send("queue add freestand capture "..k) end}, {"Dissarm tank", "Capture Tank"}, true) Items:echo("\n")
      elseif v:match("a sewer grate") then
        Items:cechoPopup("<yellow>"..v, {function() send("queue add freestand enter "..k) end, }, {"Enter "..v}, true) Items:echo("\n")
      elseif v:match("a group of") then
        Items:cechoPopup("<white>"..v, {function() send("queue add freestand get group "..k) end, function() send("queue add freestand probe "..k) end}, {"Get "..v, "Probe "..v}, true) Items:echo("\n")
      elseif v:match("sigil") then
        Items:cechoPopup("<cyan>"..v, {function() send("queue add freestand get "..k) end, function() send("queue add freestand probe "..k) end, function() send("attatch flame to "..k) end}, {"Get "..v,"Probe "..v, "Attatch a flame to "..v}, true) Items:echo("\n")
      elseif v:match("chest") then
        Items:cechoPopup("<magenta>"..v, {function() send("queue add freestand probe "..k) end, function() send("queue add freestand open "..k) end, function() send("queue add freestand close "..k) end}, {"Probe "..v, "Open "..v, "Close "..v}, true) Items:echo("\n")
      elseif v:match("a runic totem") then
        Items:cechoPopup("<forest_green>"..v, {function() send("queue add freestand probe "..k) end, function() send("queue add freestand smudge "..k) end}, {"Probe "..v, "Smudge "..v}, true) Items:echo("\n")
      else
        Items:cechoPopup("<white>"..v, {function() send("queue add freestand get "..k) end, function() send("queue add freestand probe "..k) end}, {"Get "..v, "Probe "..v}, true) Items:echo("\n")
      end
    end
  end
registerAnonymousEventHandler("gmcp.Char.Vitals", "Legacy.UI.Items")


function Legacy.UI.Bars()

  if HPBar == nil then return end
  if MPBar == nil then return end
    
    if tonumber(gmcp.Char.Vitals.hp) > tonumber(gmcp.Char.Vitals.maxhp) then
      HPBar:setValue(tonumber(gmcp.Char.Vitals.maxhp) ,tonumber(gmcp.Char.Vitals.maxhp))
      HPBar:setColor("orange")
      HPBar:setBold(true)
      HPBar:setFontSize("13")
      HPBar:setFgColor("black")
      HPBar:setText("<center>Health "..gmcp.Char.Vitals.hp.."/"..gmcp.Char.Vitals.maxhp)
    elseif math.floor((tonumber(gmcp.Char.Vitals.hp)/tonumber(gmcp.Char.Vitals.maxhp)* 100)) < 50 then
      HPBar:setColor("red")
      HPBar:setValue(tonumber(gmcp.Char.Vitals.hp) ,tonumber(gmcp.Char.Vitals.maxhp))
      HPBar:setBold(true)
      HPBar:setFontSize("13")
      HPBar:setFgColor("black")
      HPBar:setText("<center>Health "..gmcp.Char.Vitals.hp.."/"..gmcp.Char.Vitals.maxhp.." "..math.floor((tonumber(gmcp.Char.Vitals.hp)/tonumber(gmcp.Char.Vitals.maxhp)* 100)).."%")
    else
      HPBar:setValue(tonumber(gmcp.Char.Vitals.hp) ,tonumber(gmcp.Char.Vitals.maxhp))
      HPBar:setColor("forest_green")
      HPBar:setBold(true)
      HPBar:setFontSize("13")
      HPBar:setFgColor("black")
      HPBar:setText("<center>Health "..gmcp.Char.Vitals.hp.."/"..gmcp.Char.Vitals.maxhp.." "..math.floor((tonumber(gmcp.Char.Vitals.hp)/tonumber(gmcp.Char.Vitals.maxhp)* 100)).."%")
    end
    
    if tonumber(gmcp.Char.Vitals.mp) > tonumber(gmcp.Char.Vitals.maxmp) then
      MPBar:setValue(tonumber(gmcp.Char.Vitals.maxmp) ,tonumber(gmcp.Char.Vitals.maxmp))
      MPBar:setBold(true)
      MPBar:setFontSize("13")
      MPBar:setFgColor("black")
      MPBar:setText("<center>Mana "..gmcp.Char.Vitals.mp.."/"..gmcp.Char.Vitals.maxmp)
    else
      MPBar:setValue(tonumber(gmcp.Char.Vitals.mp) ,tonumber(gmcp.Char.Vitals.maxmp))
      MPBar:setBold(true)
      MPBar:setFontSize("13")
      MPBar:setFgColor("black")
      MPBar:setText("<center>Mana "..gmcp.Char.Vitals.mp.."/"..gmcp.Char.Vitals.maxmp.." "..math.floor((tonumber(gmcp.Char.Vitals.mp)/tonumber(gmcp.Char.Vitals.maxmp)* 100)).."%")
    end
  end
   registerAnonymousEventHandler("gmcp.Char.Vitals", "Legacy.UI.Bars")
   
   
   
   
   
   singlePrompt = Adjustable.Container:new({
    name = "singlePrompt",
    x=0, y="-35%",                 -- this container starts halfway down the first one
    width = 100, height= 200, -- and has the same half height of the original container
  })

  PromptLabel = Geyser.Label:new({
    name = "PromptLabel",
    x = "0%", y = "0%",
    width = "100%", height = "100%",
  }, singlePrompt)

  PromptLabel:setStyleSheet([[
    background-color: black;
    border-width: 1px;
    border-style: solid;
    border-color: ]]..Legacy.UI.borderColor..[[;
    border-radius: 10px;
  ]])

Prompt = Geyser.MiniConsole:new({
  name='Prompt',
  color= 'black',
  x='4', y='5',
  width = '100%-10', height = '100%-10',
  fontSize = 12,
  font = "Bitstream Vera Sans Mono",
  autoWrap = true
}, PromptLabel)








function Single_Prompt()
Prompt:clear()
if Legacy then
if gmcp.IRE == nil then
  gmcp.IRE = {}
  gmcp.IRE.Target = {}
  gmcp.IRE.Target.Info = {}
  gmcp.IRE.Target.Info.hpperc = "-1"
end
if gmcp.Char then
deleteLine()
if target == nil then
  target = gmcp.Char.Status.name
end

if gmcp.IRE then
  if gmcp.IRE.Target then
    if gmcp.IRE.Target.Info.hpperc == nil then
      tarHealth = "100%"
    else
      tarHealth = gmcp.IRE.Target.Info.hpperc:gsub("%%", "")
    end
  end
end
local vitals = Legacy[gmcp.Char.Status.name].Vitals
local stats = Legacy[gmcp.Char.Status.name]

Legacy.Settings.Prompt = Legacy.Settings.Prompt or {

["showHealth"]        = true,
["showMana"]          = true,
["showWillpower"]     = false,
["showTarget"]        = true,
["showEndurance"]     = false,
["gameDate"]          = false,
["xp"]                = false,
["rage"]              = false,
["exits"]             = true,
["defs"]              = false,
["seasons"]           = false,
["timestamps"]        = true,
["vitalsChange"]      = true,
["display"]           = "rawper",
["limbtracker"]       = false,
["showClassStats"]    = false,
}

if Legacy.Settings.usePrompt and not DelLPrompt then
  --deleteFull()
  --Set HP Colors by %
  if vitals.hpPer < 30 then
    healthColor = "red"
  elseif vitals.hpPer < 75 then
    healthColor = "yellow"
  elseif vitals.hpPer > 100 then
    healthColor = "orange"
  else
    healthColor = "forest_green"
  end
  
  --Set Mana Colors by %
  if vitals.mpPer < 30 then
    manaColor = "red"
  elseif vitals.mpPer < 75 then
    manaColor = "yellow"
  elseif vitals.mpPer > 100 then
    manaColor = "orange"
  else
    manaColor = "forest_green"
  end
  
  --Set Endurance Colors by %
  if vitals.epPer < 30 then
    endColor = "red"
  elseif vitals.epPer < 75 then
    endColor = "yellow"
  elseif vitals.epPer > 100 then
    endColor = "orange"
  else
    endColor = "forest_green"
  end
  
  --Set Willpower Colors by %
  if vitals.wpPer < 30 then
    willColor = "red"
  elseif vitals.wpPer < 75 then
    willColor = "yellow"
  elseif vitals.wpPer > 100 then
    willColor = "orange"
  else
    willColor = "forest_green"
  end
  
  --Set Target HP% by color
  if gmcp.IRE.Target then
    if gmcp.IRE.Target.Info.hpperc ~= "-1" then
      if tonumber(tarHealth) < 30 then
        tarColor = "red"
      elseif tonumber(tarHealth) < 75 then
        tarColor = "yellow"
      elseif tonumber(tarHealth) > 100 then
        tarColor = "orange"
      else
        tarColor = "forest_green"
      end
    end
  end
  
  
  
  --Move the table Show X order around to change where it will appear in your prompt
  --handling Alertness from mapper (Auto disabled from the actual mapper folder)
mmp.firstAlert = false
-- handle alertness
if mmp.alertness and next(mmp.alertness) then
  
  local dirs = {}
  for direction, _ in pairs(mmp.alertness) do dirs[#dirs+1] = direction end
  local people = select(2, next(mmp.alertness)) or {}
  --coloring people
  for _,v in pairs(people) do
    if Legacy.NDB.db[v:title()] then
      table.remove(people, table.index_of(people, v))
      table.insert(people, "<"..Legacy.Settings.NDB.Config[Legacy.NDB.db[v].city:lower()].color..">"..v)
    end
  end
  
   Prompt:cecho("\n<red>[<cyan>" .. dirs[table.size(dirs)].. " <red>-".." <white>" .. table.concat(people, ', ').. "<cyan> ("..#people..")<red>]")
   mmp.alertness = nil

  raiseEvent("mmapper updated pdb")
end
  --Prompt:echo("\n")
  
  if Legacy.Settings.Prompt.gameDate == true then
    Prompt:cecho("<ansi_yellow>(<ansi_white>"..Legacy.Settings.IGDate.monthabrev[Legacy.Settings.IGDate.month].."<ansi_yellow> <ansi_white>"..Legacy.Settings.IGDate.day.."<ansi_yellow>, <ansi_white>"..Legacy.Settings.IGDate.year.."<ansi_yellow>)")
  end
  
  if Legacy.Settings.Prompt.seasons == true then
    if Legacy.Settings.IGDate.season == "fall" then
      Prompt:echo("ðŸ?? ")
    elseif Legacy.Settings.IGDate.season == "winter" then
      Prompt:echo("â›„ ")
    elseif Legacy.Settings.IGDate.season == "spring" then
      Prompt:echo("ðŸ?€ ")
    elseif Legacy.Settings.IGDate.season == "summer" then
      Prompt:echo("ðŸŒ» ")
    else
      Prompt:echo("ðŸŒ» ")
    end
  end
  
  --Show Health
  if Legacy.Settings.Prompt.showHealth == true then
    if Legacy.Curing.Affs.blackout then
      Prompt:cecho("<green>H:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        Prompt:cecho("<green>H:<"..healthColor..">"..vitals.Health.."<white>|<"..healthColor..">"..vitals.hpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        Prompt:cecho("<green>H:<"..healthColor..">"..vitals.hpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        Prompt:cecho("<green>H:<"..healthColor..">"..vitals.Health.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        Prompt:cecho("<green>H:<"..healthColor..">"..vitals.Health.."<white>|<"..healthColor..">"..vitals.MaxHP.." ")
      end
    end
  end
  
  --Show Mana
  if Legacy.Settings.Prompt.showMana == true then
    if Legacy.Curing.Affs.blackout then
      Prompt:cecho("<cyan>M:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        Prompt:cecho("<cyan>M:<"..manaColor..">"..vitals.Mana.."<white>|<"..manaColor..">"..vitals.mpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        Prompt:cecho("<cyan>M:<"..manaColor..">"..vitals.mpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        Prompt:cecho("<cyan>M:<"..manaColor..">"..vitals.Mana.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        Prompt:cecho("<cyan>M:<"..manaColor..">"..vitals.Mana.."<white>|<"..manaColor..">"..vitals.MaxMP.." ")
      end
    end
  end
  
  --Show Endurance
  if Legacy.Settings.Prompt.showEndurance == true then
    if Legacy.Curing.Affs.blackout then
      Prompt:cecho("<purple>E:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        Prompt:cecho("<purple>E:<"..endColor..">"..vitals.Endurance.."<white>|<"..endColor..">"..vitals.epPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        Prompt:cecho("<purple>E:<"..endColor..">"..vitals.epPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        Prompt:cecho("<purple>E:<"..endColor..">"..vitals.Endurance.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        Prompt:cecho("<purple>E:<"..endColor..">"..vitals.Endurance.."<white>|<"..endColor..">"..vitals.MaxEP.." ")
      end
    end
  end
  
  --Show Willpower
  if Legacy.Settings.Prompt.showWillpower == true then
    if Legacy.Curing.Affs.blackout then
      Prompt:cecho("<yellow>W:<gold>BLACKOUT<white>|<gold>BLACKOUT ")
    else
      if Legacy.Settings.Prompt.display == "rawper" then
        Prompt:cecho("<yellow>W:<"..willColor..">"..vitals.Willpower.."<white>|<"..willColor..">"..vitals.wpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "per" then
        Prompt:cecho("<yellow>W:<"..willColor..">"..vitals.wpPer.."% ")
      elseif Legacy.Settings.Prompt.display == "raw" then
        Prompt:cecho("<yellow>W:<"..willColor..">"..vitals.Willpower.." ")
      elseif Legacy.Settings.Prompt.display == "rawmax" then
        Prompt:cecho("<yellow>W:<"..willColor..">"..vitals.Willpower.."<white>|<"..willColor..">"..vitals.MaxWP.." ")
      end    
    end
  end
  
  if Legacy.Settings.Prompt.exits == true and gmcp.Room then
    local dirtab = table.deepcopy(Legacy.Room.directionTable)
    
    Prompt:cecho("<ansi_yellow>[<cyan>")
    local exits = {}
    local exitcount = 0
    for k,v in pairs(gmcp.Room.Info.exits) do
      exitcount = exitcount + 1
      if exitcount < table.size(gmcp.Room.Info.exits) then
        if table.contains(Legacy.Room.Walls.Ice, tostring(k)) then
          Prompt:cechoLink("<cyan>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Fire, tostring(k)) then
          Prompt:cechoLink("<red>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Stone, tostring(k)) then
          Prompt:cechoLink("<grey>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Thorn, tostring(k)) then
          Prompt:cechoLink("<forest_green>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        else
          Prompt:cechoLink("<white>"..k:upper().."<DimGrey>|", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        end
      else
        if table.contains(Legacy.Room.Walls.Ice, tostring(k)) then
          Prompt:cechoLink("<cyan>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Fire, tostring(k)) then
          Prompt:cechoLink("<red>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Stone, tostring(k)) then
          Prompt:cechoLink("<grey>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        elseif table.contains(Legacy.Room.Walls.Thorn, tostring(k)) then
          Prompt:cechoLink("<forest_green>"..k:upper(), function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        else
          Prompt:cechoLink("<white>"..k:upper().."<DimGrey>", function() send("queue addclear free go "..dirtab[k]) end, "Click to go "..dirtab[k], true)
        end
      end
    end
    Prompt:cecho("<ansi_yellow>]")
  end
  
  
  if Legacy.Settings.Prompt.xp == true then
    Prompt:cecho(" <gold>"..gmcp.Char.Status.level)
  end
  
  
  if Legacy.Settings.Prompt.rage == true then
    Prompt:cecho(" <ansi_yellow>Rage:<white>"..Legacy[gmcp.Char.Status.name].rage)
  end
  
  
  
  
  if Legacy.Settings.Prompt.timestamps == true then
    Prompt:echo(" "..getTime(true, "hh:mm:ss").." ")
  end
  
  if Legacy.Settings.Prompt.defs == true then
    Prompt:echo("-")
    
    if gmcp.Char.Vitals.eq  == "1" then
      Prompt:cecho("<red>e")
    end
    if gmcp.Char.Vitals.bal == "1" then
      Prompt:cecho("<red>x")
    end
    if table.contains(Legacy.Curing.Defs.current, "cloak") then
      Prompt:cecho("<green>c")
    end
    if table.contains(Legacy.Curing.Defs.current, "kola") then
      Prompt:cecho("<green>k")
    end
    if table.contains(Legacy.Curing.Defs.current, "blindness") then
      Prompt:cecho("<green>b")
    end
    if table.contains(Legacy.Curing.Defs.current, "deafness") then
      Prompt:cecho("<green>d")
    end
     Prompt:echo("-")
  end
  
  --Show Class Specifics
  --Reference Legacy.{your character name}.Vitals for the variables
  
  if Legacy.Settings.Prompt.showClassStats == true then
    if gmcp.Char.Status.class == "Apostate" then
      Prompt:cecho(" <ansi_yellow>Essence: <white>"..stats.essence)
    elseif gmcp.Char.Status.class == "Bard" then
      Prompt:cecho(" <ansi_yellow>Voice "..stats.voice)
      Prompt:cecho(" <ansi_yellow>Stance "..stats.stance)
    elseif gmcp.Char.Status.class == "Blademaster" then
      Prompt:cecho(" <ansi_yellow>Shin: "..stats.shin)
      Prompt:cecho(" <ansi_yellow>Stance: "..stats.stance)
    elseif gmcp.Char.Status.class == "Depthswalker" then
      Prompt:cecho(" <ansi_yellow>Word : "..stats.word)
      Prompt:cecho(" <ansi_yellow>Age: "..stats.age)
    elseif gmcp.Char.Status.class == "Druid" then
      Prompt:cecho(" <ansi_yellow>Morph: "..stats.morph)
    elseif gmcp.Char.Status.class == "Infernal" then
      Prompt:cecho(" <ansi_yellow>Essence: "..stats.essence)
    elseif gmcp.Char.Status.class == "Magi" then
      Prompt:cecho(" <ansi_yellow>Channels: "..stats.channels)
    elseif gmcp.Char.Status.class == "Monk" then
      
      if stats.stance == nil then else Prompt:cecho(" <ansi_yellow>Stance: "..stats.stance) end
      if stats.form == nil then else Prompt:cecho(" <ansi_yellow>Form: "..stats.form) end
      if stats.kata == nil then else Prompt:cecho(" <ansi_yellow>Kata: "..stats.kata) end
      Prompt:cecho(" <ansi_yellow>Kai: "..stats.kai)
    elseif gmcp.Char.Status.class == "Occultist" then
      Prompt:cecho(" <ansi_yellow>Karma: <white>"..stats.karma)
      Prompt:cecho(" <ansi_yellow>Entity: "..stats.entity)
    elseif gmcp.Char.Status.class == "Paladin" then
      Prompt:cecho(" <ansi_yellow>Wrath: "..stats.wrath)
      Prompt:cecho(" <ansi_yellow>Wrath?: "..stats.wrathbal)
    elseif gmcp.Char.Status.class == "Pariah" then
      Prompt:cecho(" <ansi_yellow>Epitaph: "..stats.epitaphlength)
    elseif gmcp.Char.Status.class == "Priest" then
      Prompt:cecho(" <ansi_yellow>Conviction: "..stats.conviction)
      Prompt:cecho(" <ansi_yellow>Prayer#: "..stats.prayerlength)
      Prompt:cecho(" <ansi_yellow>Prayer?: "..stats.prayer)
      Prompt:cecho(" <ansi_yellow>Angelpower: "..stats.angelpower)
      Prompt:cecho(" <ansi_yellow>Devotion: "..stats.devotion)
    elseif gmcp.Char.Status.class == "Runewarden" then
      Prompt:cecho(" <ansi_yellow>Empower: "..stats.empower)
    elseif gmcp.Char.Status.class == "Sentinel" then
      Prompt:cecho(" <ansi_yellow>Morph: "..stats.morph)
    elseif gmcp.Char.Status.class == "Serpent" then
      Prompt:cecho(" <ansi_yellow>Venom: "..stats.venom)
    elseif gmcp.Char.Status.class == "Shaman" then
      Prompt:cecho(" <ansi_yellow>Spirits: "..stats.spirits)
    elseif gmcp.Char.Status.class == "Sylvan" then
      Prompt:cecho(" <ansi_yellow>Channels: "..stats.channels)
    elseif gmcp.Char.Status.class == "Unnamable" then
      Prompt:cecho(" <ansi_yellow>Karma: <white>"..stats.karma)
      Prompt:cecho(" <ansi_yellow>Anathema: "..stats.anathema)
      Prompt:cecho(" <ansi_yellow>Manifestation: "..stats.manifestation)
    end
  end
  
  
  --Show Target
  if Legacy.Settings.Prompt.showTarget == true then
    if gmcp.IRE.Target then
      if gmcp.IRE.Target.Info.id == "-1" then
        if Legacy.NDB.db[target] then
          local city = Legacy.NDB.db[target].city:lower()
          local citycolor = Legacy.Settings.NDB.Config[city].color
          if Legacy.Settings.lockPrompt == true then
            Prompt:cecho(" <DimGray>[ <"..citycolor..">"..target.." <DimGray>]")
          elseif Legacy.Settings.lockPrompt == false then
            Prompt:cechoLink(" <DimGray>[ <cyan>"..target.." <DimGray>]", [[expandAlias("ndb "..target)]], "click for information", true)
          end
        else
        Prompt:cecho(" <DimGray>[ <orange>"..target.." <DimGray>]")
        end
      else
        if table.contains(gmcp.Char.Items.List.items, gmcp.IRE.Target.Set) then
          Prompt:cecho("<DimGray> [ <cyan>"..gmcp.IRE.Target.Info.id.." <DimGray>] <ansi_white>-<"..tarColor..">"..gmcp.IRE.Target.Info.hpperc.."<ansi_white>-")
        end
      end
    end
  end
  
  if Legacy.Settings.Prompt.limbtracker == true and lb then
    Prompt:cecho(lb.prompt())
  end
  
  
  if Legacy.Settings.Prompt.vitalsChange == true then
      Legacy[gmcp.Char.Status.name].newHealth = tonumber(gmcp.Char.Vitals.hp)
      Legacy[gmcp.Char.Status.name].newMana = tonumber(gmcp.Char.Vitals.mp)
      
      if (Legacy[gmcp.Char.Status.name].newHealth == Legacy[gmcp.Char.Status.name].oldHealth) and (Legacy[gmcp.Char.Status.name].newMana == Legacy[gmcp.Char.Status.name].oldMana) then
        --nothing
      elseif math.floor((Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) / gmcp.Char.Vitals.maxhp * 100) == 100 or math.floor((Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) / gmcp.Char.Vitals.maxhp * 100) == 100 or math.floor((Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) / gmcp.Char.Vitals.maxmp * 100) == 100 or math.floor((Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) / gmcp.Char.Vitals.maxmp * 100) == 100 then
        --stops from seeing everytime the prompt breaks out of blackout
      elseif math.floor(Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) > 150 or math.floor(Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) > 150 or math.floor(Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) > 150 or math.floor(Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) > 150  then 
        Prompt:cecho(" <DimGrey>( ")
        if Legacy[gmcp.Char.Status.name].oldHealth > Legacy[gmcp.Char.Status.name].newHealth and math.floor(Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) > 150 then
          Prompt:cecho("<ansiRed>-<red>"..math.floor(Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth).."h ")
          if math.floor((Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) / gmcp.Char.Vitals.maxhp * 100) > 0 then
            Prompt:cecho("<ansiRed>"..math.floor((Legacy[gmcp.Char.Status.name].oldHealth - Legacy[gmcp.Char.Status.name].newHealth) / gmcp.Char.Vitals.maxhp * 100).."% ")
          end
        elseif Legacy[gmcp.Char.Status.name].oldHealth < Legacy[gmcp.Char.Status.name].newHealth and math.floor(Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) > 150 then
          Prompt:cecho("<forest_green>+<green>"..math.floor(Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth).."h ")
          if math.floor((Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) / gmcp.Char.Vitals.maxhp * 100) > 0 then
            Prompt:cecho("<forest_green>"..math.floor((Legacy[gmcp.Char.Status.name].newHealth - Legacy[gmcp.Char.Status.name].oldHealth) / gmcp.Char.Vitals.maxhp * 100).."% ")
          end
        end
        
        if Legacy[gmcp.Char.Status.name].oldMana > Legacy[gmcp.Char.Status.name].newMana and math.floor(Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) > 150 then
          Prompt:cecho("<ansiRed>-<red>"..math.floor(Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana).."m ")
          if math.floor((Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) / gmcp.Char.Vitals.maxmp * 100) > 0 then
            Prompt:cecho("<ansiRed>"..math.floor((Legacy[gmcp.Char.Status.name].oldMana - Legacy[gmcp.Char.Status.name].newMana) / gmcp.Char.Vitals.maxmp * 100).."% ")
          end
        elseif Legacy[gmcp.Char.Status.name].oldMana < Legacy[gmcp.Char.Status.name].newMana and math.floor(Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) > 150 then
          Prompt:cecho("<forest_green>+<green>"..math.floor(Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana).."m ")
          if math.floor((Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) / gmcp.Char.Vitals.maxmp * 100) > 0 then
            Prompt:cecho("<forest_green>"..math.floor((Legacy[gmcp.Char.Status.name].newMana - Legacy[gmcp.Char.Status.name].oldMana) / gmcp.Char.Vitals.maxmp * 100).."% ")
          end
        end
        Prompt:cecho("<DimGrey>)")
        
        if Legacy[gmcp.Char.Status.name].Vitals.bleed > 100 then
          Prompt:cecho(" <DimGrey>(<ansiRed>"..Legacy[gmcp.Char.Status.name].Vitals.bleed.."B<DimGrey>)")
        end
      end
      
      Legacy[gmcp.Char.Status.name].oldHealth = tonumber(gmcp.Char.Vitals.hp)
      Legacy[gmcp.Char.Status.name].oldMana = tonumber(gmcp.Char.Vitals.mp)

  end
  if Legacy.Settings.Curing.affPrompt ~= nil and Legacy.Settings.Curing.affPrompt then
    Prompt:cecho(LegacyAffPrompt())
  end
  if Legacy.Settings.Curing.status ~=  nil and Legacy.Settings.Curing.status == true then
    --nothing
  else
    Prompt:cecho(" <red>(<dim_grey>PP<red>)")
  end
  if Legacy.Settings.lockPrompt == false then
  Prompt:cechoPopup("*", 
  {  
  function() Legacy.echo("Right clicking might work better.") end, 
  function() if Legacy.Settings.Prompt.showHealth == true then Legacy.Settings.Prompt.showHealth = false Legacy.echo("Removed Health from the Legacy Prompt") else Legacy.Settings.Prompt.showHealth = true Legacy.echo("Added Health to the Legacy Prompt")end send("ql") end, 
  function() if Legacy.Settings.Prompt.showMana == true then Legacy.Settings.Prompt.showMana = false Legacy.echo("Removed Mana from the Legacy Prompt") else Legacy.Settings.Prompt.showMana = true Legacy.echo("Added Mana to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showTarget == true then Legacy.Settings.Prompt.showTarget = false Legacy.echo("Removed Target from the Legacy Prompt") else Legacy.Settings.Prompt.showTarget = true Legacy.echo("Added Target to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showEndurance == true then Legacy.Settings.Prompt.showEndurance = false Legacy.echo("Remoed Endurance from the Legacy Prompt") else Legacy.Settings.Prompt.showEndurance = true Legacy.echo("Added Endurance to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showWillpower == true then Legacy.Settings.Prompt.showWillpower = false Legacy.echo("Removed Willpower from the Legacy Prompt") else Legacy.Settings.Prompt.showWillpower = true Legacy.echo("Added Willpower to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.gameDate == true then Legacy.Settings.Prompt.gameDate = false Legacy.echo("Removed Game Date from the Legacy Prompt") else Legacy.Settings.Prompt.gameDate = true Legacy.echo("Added Game Date to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.exits == true then Legacy.Settings.Prompt.exits = false Legacy.echo("Removed Exits from the Legacy Prompt") else Legacy.Settings.Prompt.exits = true Legacy.echo("Added Exits to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.defs == true then Legacy.Settings.Prompt.defs = false Legacy.echo("Removed Defs from the Legacy Prompt") else Legacy.Settings.Prompt.defs = true Legacy.echo("Added Defs to the Legacy Prompt")end send("ql") end,
  function() if Legacy.Settings.Prompt.seasons == true then Legacy.Settings.Prompt.seasons = false Legacy.echo("Removed Seasons from the Legacy Prompt") else Legacy.Settings.Prompt.seasons = true Legacy.echo("Added Seasons to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.timestamps == true then Legacy.Settings.Prompt.timestamps = false Legacy.echo("Removed Timestamps from the Legacy Prompt") else Legacy.Settings.Prompt.timestamps = true Legacy.echo("Added Timestamps to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.vitalsChange == true then Legacy.Settings.Prompt.vitalsChange = false Legacy.echo("Removed Vitals Changes from the Legacy Prompt") else Legacy.Settings.Prompt.vitalsChange = true Legacy.echo("Added Vitals Changes to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.limbtracker == true then Legacy.Settings.Prompt.limbtracker = false Legacy.echo("Removed Limb Tracker from the Legacy Prompt") else Legacy.Settings.Prompt.limbtracker = true Legacy.echo("Added Limb Tracker to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.showClassStats == true then Legacy.Settings.Prompt.showClassStats = false Legacy.echo("Removed Class Stats from the Legacy Prompt") else Legacy.Settings.Prompt.showClassStats = true Legacy.echo("Added Class Stats to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.rage == true then Legacy.Settings.Prompt.rage = false Legacy.echo("Removed Rage from the Legacy Prompt") else Legacy.Settings.Prompt.rage = true Legacy.echo("Added Rage to the Legacy Prompt") end send("ql") end,
  function() if Legacy.Settings.Prompt.xp == true then Legacy.Settings.Prompt.xp = false Legacy.echo("Removed Experience from the Legacy Prompt") else Legacy.Settings.Prompt.xp = true Legacy.echo("Added Experience to the Legacy Prompt") end send("ql") end,
  },
  
  {
  "Click Below to Toggle Prompt Settings",
  "Toggle Health", 
  "Toggle Mana",
  "Toggle Target",
  "Toggle Endurance",
  "Toggle Willpower",
  "Toggle Game Date",
  "Toggle Exits",
  "Toggle Defences",
  "Toggle Seasons",
  "Toggle Timestamps",
  "Toggle Vitals Changes",
  "Toggle Limb Tracker",
  "Toggle Class Stats",
  "Toggle Rage",
  "Toggle XP",
  }, true)
  end
  end
end
end
end

registerAnonymousEventHandler("LPrompt", "Single_Prompt")
   
   
   
   
  function Legacy.UI.Update()
    --setBorderLeft(310)
    --setWindowWrap(100)
    Legacy.UI.WhoHere()
    Legacy.UI.Items()
    Legacy.UI.Mobs()
    Legacy.UI.Bars()
  end
  registerAnonymousEventHandler("UI Update", "Legacy.UI.Update")
end
registerAnonymousEventHandler("LegacyLoaded", "UI_Setup")
