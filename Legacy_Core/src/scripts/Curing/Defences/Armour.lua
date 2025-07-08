function Armour()
local Cloth      = {"Dragon", "Magi", "Psion", "Pariah"}
local Leather    = {"Bard", "Monk"}
local Ringmail   = {"Alchemist", "Apostate"}
local Scalemail  = {"Serpent", "Jester", "Shaman", "Occultist", "Depthswalker", "Blademaster"}
local Chainmail  = {"Druid", "Sentinel", "Sylvan", "Classless"}
local Splintmail = {"Priest"}
local Fullplate  = {"Paladin", "Infernal", "Runewarden", "Unnamable"}

  if gmcp.Char.Status.class:match("Dragon") then
    return "clotharmour"
  elseif gmcp.Char.Status.class:match("Elemental") then
    return "clotharmour"
  elseif gmcp.Char.Status.race == "Horkval" then
    return "clotharmour"
  elseif table.contains(Fullplate, gmcp.Char.Status.class) then
    return "fullplate"
  elseif table.contains(Splintmail, gmcp.Char.Status.class) then
    return "splintmail"
  elseif table.contains(Chainmail, gmcp.Char.Status.class) then
    return "chainmail"
  elseif table.contains(Scalemail, gmcp.Char.Status.class) then
    return "scalemail"
  elseif table.contains(Ringmail, gmcp.Char.Status.class) then
    return "ringmail"
  elseif table.contains(Leather, gmcp.Char.Status.class) then
    return "leather"
  elseif table.contains(Cloth, gmcp.Char.Status.class) then
    return "clotharmour"
  end
  
end