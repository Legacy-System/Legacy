function Defup()
  if not Legacy then return end
    local warriors = {"Paladin", "Runewarden", "Unnamable", "Infernal"}
  
    
     if Legacy.Curing.Defs[Legacy.Curing.Defs.currentset] == nil then
      Dset(Legacy.Curing.Defs.currentset)
      return
     end
     
     
     
    
      --checking weapon spec
    if Legacy.Curing.Defs[gmcp.Char.Status.class:title()..Legacy[gmcp.Char.Status.name].wepspec] and table.contains(warriors, gmcp.Char.Status.class) then
      if (Legacy.Curing.Defs[gmcp.Char.Status.class:title()..Legacy[gmcp.Char.Status.name].wepspec] and Legacy[gmcp.Char.Status.name].wepspec ~= "") then
        Dset(gmcp.Char.Status.class:title()..Legacy[gmcp.Char.Status.name].wepspec)
      end
      --checking weapon spec if it doesn't exist
    elseif not Legacy.Curing.Defs[gmcp.Char.Status.class:title()..Legacy[gmcp.Char.Status.name].wepspec] and Legacy[gmcp.Char.Status.name].wepspec ~= "NA" then
      Legacy.bigEcho("This is the First time you are using this Weapon Spec!", "SeaGreen" ,"red") 
      Legacy.bigEcho("Please use 'keepup' to set up your defences", "SeaGreen", "red")
      Legacy.Curing.Defs[gmcp.Char.Status.class:title()..Legacy[gmcp.Char.Status.name].wepspec] = (table.deepcopy(Legacy.Curing.Defs[gmcp.Char.Status.class:title()]) or table.deepcopy(Legacy.Curing.Defs.legacy))
      Dset(gmcp.Char.Status.class:title()..Legacy[gmcp.Char.Status.name].wepspec)
    elseif Legacy.Curing.Defs[gmcp.Char.Status.class:title()] and not gmcp.Char.Status.class:match("Dragon") then  
      Dset(gmcp.Char.Status.class:title())
    elseif Legacy.Curing.Defs["Dragon"] and gmcp.Char.Status.class:match("Dragon") then
      Dset('Dragon')
    elseif gmcp.Char.Status.class:match("Dragon") and not Legacy.Curing.Defs["Dragon"] then
      Legacy.bigEcho("This is the First time you are using Dragon!", "SeaGreen" ,"red") 
      Legacy.bigEcho("Please use 'keepup' to set up your defences", "SeaGreen", "red")
      Legacy.Curing.Defs["Dragon"] = table.deepcopy(Legacy.Curing.Defs.legacy)
      Dset('Dragon')
    elseif Legacy.Curing.Defs.currentset == "legacy" then
      Legacy.bigEcho("This is the First time you are using this Class!", "SeaGreen" ,"red") 
      Legacy.bigEcho("Please use 'keepup' to set up your defences", "SeaGreen", "red")
      Legacy.Curing.Defs[gmcp.Char.Status.class:title()] = table.deepcopy(Legacy.Curing.Defs.legacy)
      Dset(gmcp.Char.Status.class:title())
    elseif not Legacy.Curing.Defs[gmcp.Char.Status.class] then
      Legacy.bigEcho("This is the First time you are using this Class!", "SeaGreen" ,"red") 
      Legacy.bigEcho("Please use 'keepup' to set up your defences", "SeaGreen", "red")
      Legacy.Curing.Defs[gmcp.Char.Status.class:title()] = table.deepcopy(Legacy.Curing.Defs.legacy)
      Dset(gmcp.Char.Status.class:title())
    end
end
registerAnonymousEventHandler("LegacyLoaded", "Defup")