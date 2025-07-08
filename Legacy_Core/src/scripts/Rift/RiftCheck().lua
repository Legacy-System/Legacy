function RiftCheck()
if not Legacy then return end
if gmcp.IRE.Rift.List and table.size(gmcp.IRE.Rift.List) > 0 then
  Legacy.Rift = {}
  Legacy.Rift.Elist = {}
  Legacy.Rift.Vlist = {}
  Legacy.Rift.Elixirs      = Legacy.Rift.Elixers or {}
  Legacy.Rift.Salves       = Legacy.Rift.Salves or {}
  Legacy.Rift.Venoms       = Legacy.Rift.Venoms or {}
  Legacy.Rift.Herbs        = Legacy.Rift.Herbs or {}
  Legacy.Rift.Minerals     = Legacy.Rift.Minerals or {}
  Legacy.Rift.Reagents     = Legacy.Rift.Reagents or {}
  Legacy.Rift.Inks         = Legacy.Rift.Inks or {}
  Legacy.Rift.Elist        = Legacy.Rift.Elist or {}
  Legacy.Rift.Commodities = Legacy.Rift.Commodities or {}
  Legacy.Rift.Ingredients  = Legacy.Rift.Ingredients or {}
  Legacy.Rift.Shipcomms    = Legacy.Rift.Shipcomms or {}
  Legacy.Rift.Crystals     = Legacy.Rift.Crystals or {}
  
  local Elixirs      = {"frost", "levitation", "health", "mana", "immunity", "speed", "venom", "levitation"}
  local Salves       = {"caloric", "mending", "restoration", "epidermal", "mass"}
  local Venoms       = {"aconite", "curare", "darkshade", "xentio", "oleander", "eurypteria", "kalmia", "digitalis", "darkshade", "epteth", "prefarar", "monkshood", "euphorbia", "colocasia", "oculus", "vernalius", "epseth", "larkspur", "slike", "voyria", "delphinium", "vardrax", "loki", "selarnia", "gecko"}
  local Herbs        = {"ginseng","ash", "echinacea", "ginger", "burdock", "myrrh", "bellwort", "bloodroot", "hawthorn", "kuzu", "skullcap", "slipper", "goldenseal", "valerian", "bayberry", "cohosh", "lobelia", "pear", "moss", "sileris", "kelp", "kola", "elm"}
  local Minerals     = {"ferrum", "stannum", "dolomite", "antimony", "bisemutum", "cuprum", "magnesium", "calamine", "malachite", "azurite", "plumbum", "realgar", "arsenic", "gypsum", "argentum", "calcite", "potash", "quicksilver", "aurum", "quartz", "cinnabar"}
  local Reagents     = {"buffalo horn", "ink bladder", "red chitin", "yellow chitin", "fish scales", "red clay", "wyrm tongue", "lumic moss", "shark tooth", "gold flakes"}
  local Inks         = {"redink", "greenink", "blueink", "goldink", "purpleink", "blackink", "yellowink" }
  local Commodities =  {"steel", "stone", "wood", "ice", "rope", "dust", "cloth", "ironore", "fibre", "coal", "platinum", "bone", "goldbar", "gems", "carbon", "silver", "rawbone", "leather", "rawstone", "obsidian", "rawobsidian", "rawgems", "goldore", "silverore", "platinumore", "impureice", "horn"  }
  local Ingredients  = {}
  local Shipcomms    = {}
  local Crystals     = {}
  
  
  for k,v in pairs(gmcp.IRE.Rift.List) do
    if table.contains(Elixirs, v.name) then
      Legacy.Rift.Elixirs[v.name] = tonumber(v.amount)
    elseif table.contains(Salves, v.name) then
      Legacy.Rift.Salves[v.name] = tonumber(v.amount)
    elseif table.contains(Venoms, v.name) then
      Legacy.Rift.Venoms[v.name] = tonumber(v.amount)
    elseif table.contains(Herbs, v.name) then
      Legacy.Rift.Herbs[v.name] = tonumber(v.amount)
    elseif table.contains(Minerals, v.name) then
      Legacy.Rift.Minerals[v.name] = tonumber(v.amount)
    elseif table.contains(Reagents, v.name) then
      if v.name == "lumic moss" then
        Legacy.Rift.Reagents["lumic"] = tonumber(v.amount)
      else
        Legacy.Rift.Reagents[v.name] = tonumber(v.amount)
      end
    elseif table.contains(Inks, v.name) then
      Legacy.Rift.Inks[v.name] = tonumber(v.amount)
    elseif table.contains(Commodities, v.name) then
      Legacy.Rift.Commodities[v.name] = tonumber(v.amount)
    end
  end
  
else
end
end
registerAnonymousEventHandler("gmcp.IRE.Rift", "RiftCheck")