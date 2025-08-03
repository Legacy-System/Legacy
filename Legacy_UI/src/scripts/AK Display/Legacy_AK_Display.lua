function Legacy_AK_Draw()
if Legacy then
if not ak then return end
Legacy.UI.AK = Adjustable.Container:new({
  name = "Aff Tracking",
  x = 0, y = 0,
  width = 300, height = 300

})

Legacy.UI.AK.Label = Geyser.Label:new({
    name = "Ak Label",
    x=0,y=0,
    width = "100%", height = "100%"
}, Legacy.UI.AK)

Legacy.UI.AK.Label:setStyleSheet([[
    background-color: black;
    border-width: 3px;
    border-style: solid;
    border-color: ]]..Legacy.UI.borderColor..[[;
    border-radius: 10px;
  ]]
  )

Legacy.UI.AK.TargetLabel = Geyser.Label:new({
    name = "Target Label",
    x = 3, y = 3,
    width = "100%-6", height = "20%"

}, Legacy.UI.AK.Label)

Legacy.UI.AK.TargetLabel:setStyleSheet([[
    background-color: black;
    border-width: 3px;
    border-style: solid;
    border-color: ]]..Legacy.UI.borderColor..[[;
    border-radius: 10px;
  ]]
  )
  Legacy.UI.AK.TargetConsole = Geyser.MiniConsole:new({
      name = "Target Console",
      x = 4, y = 4,
      width = "100%-8", height = "100%-9",
      color='black',
      fontSize = 10,
      scrollbar = false,
      font = "Bitstream Vera Sans Mono",
      autoWrap = false
  }, Legacy.UI.AK.TargetLabel)
  
Legacy.UI.AK.Console = Geyser.MiniConsole:new({
      name = "Aff Console",
      x = 4, y = "22%",
      width = "100%-8", height = "80%-15",
      color='Black',
      fontSize = 10,
      scrollbar = false,
      font = "Bitstream Vera Sans Mono",
      autoWrap = false
  }, Legacy.UI.AK.Label)


function Legacy.UI.AK.Update()

  if Legacy.NDB.db[target:title()] == nil then return end
  if target == nil or target == "None" or target == "none" then return end
  if Legacy.Settings.Basher.status == true then return end
  
  Legacy.UI.AK.Console:clear()
  Legacy.UI.AK.TargetConsole:clear()
  ak.healthpercent = math.floor((ak.currenthealth/ak.maxhealth)*100)
  ak.manapercent   = math.floor((ak.currentmana/ak.maxmana)*100)
  
  Legacy.UI.AK.TargetConsole:cecho("<gold>Target: <"..Legacy.Settings.NDB.Config[Legacy.NDB.db[target:title()].city:lower()].color..">"..target:title().."\n")
  Legacy.UI.AK.TargetConsole:cecho("<ansi_white>Health: <forest_green>"..ak.healthpercent.."%      <ansi_white>Mana: <cyan>"..ak.manapercent.."%\n")
  Legacy.UI.AK.TargetConsole:cecho("<gold>Rebounding: ")
  if ak.defs.rebounding == true then
    Legacy.UI.AK.TargetConsole:cecho("<green>YES")
  else
    Legacy.UI.AK.TargetConsole:cecho("<red>NO")
  end
  Legacy.UI.AK.TargetConsole:cecho("   <gold>Shield: ")
  if ak.defs.shield == true then
    Legacy.UI.AK.TargetConsole:cecho("<green>YES")
  else
    Legacy.UI.AK.TargetConsole:cecho("<red>NO")
  end
  local lockaffs = {"impatience", "paralysis", "asthma", "slickness", "anorexia"}
  Legacy.UI.AK.Console:cecho("<orange>Limbs: "..lb.prompt().."\n")
  for k,v in pairs(affstrack.score) do
  
    if v > 0 then
      if table.contains(lockaffs, k) then
        Legacy.UI.AK.Console:cecho("\n<red>"..tostring(k):title().." "..math.floor(v))
      else
        Legacy.UI.AK.Console:cecho("\n<green>"..tostring(k):title().." "..math.floor(v))
      end
    end
  end
end
registerAnonymousEventHandler("LPrompt", "Legacy.UI.AK.Update")
else
tempTimer(5, [[Legacy_AK_Draw()]])
end
end

registerAnonymousEventHandler("LegacyLoaded", "Legacy_AK_Draw")