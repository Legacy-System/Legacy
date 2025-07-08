function Active_Cure()
if Legacy.Curing.bal.active == false then return end
local ClassActive = {
["Alchemist"] = "educe salt",
["Blademaster"] = "fitness",
["Druid"]       = "evoke panacea",
["Serpent"]     = "shrugging",
["Dragon"]      = "dragonheal",

}
if not table.contains(ClassActive, gmcp.Char.Status.class) then return end
local Aff = Legacy.Curing.Affs
--Used for Tracking the total count of Afflictions.
local affCount = table.size(Legacy.Curing.Affs)
--Shortening the Vitals subtable and standardizing it with Char name.



--[[ Put all of the Logic you want to have to use your active cure below here.


  if affCount >= 3 then
    send("queue addclear free "..ClassActive[gmcp.Char.Status.class])
  end
  
  
 ]] 
  
  
end
registerAnonymousEventHandler("gmcp.Char.Afflictions.Add", "Active_Cure")
registerAnonymousEventHandler("gmcp.Char.Afflictions.Remove", "Active_Cure")
