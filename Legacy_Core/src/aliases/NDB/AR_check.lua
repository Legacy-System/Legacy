--Tracks Army Rank from people that you have honoured, and displays people that are both online and are AR3 and above


local Ashtab = {}
local Cytab = {}
local Targtab = {}
local Mhaltab = {}
local Hashtab = {}
local Eletab = {}
local Config = Legacy.Settings.NDB.Config
for k,v in pairs(Legacy.NDB.db) do
  if v.ArmyRank ~= nil and v.ArmyRank > 2 and table.contains(Legacy.NDB.awake, k) then
    local city = Legacy.NDB.db[k].city:lower()
    
    if v.city == "Targossas" and not table.contains(Targtab, k) then
      table.insert(Targtab, "<"..Config[city].color..">"..k.." <DimGrey>(<cyan>"..v.ArmyRank.."<DimGrey>)")
    elseif v.city == "Hashan" and not table.contains(Hashtab, k) then
      table.insert(Hashtab,"<"..Config[city].color..">"..k.." <DimGrey>(<cyan>"..v.ArmyRank.."<DimGrey>)")
    elseif v.city == "Mhaldor" and not table.contains(Mhaltab, k) then
      table.insert(Mhaltab,"<"..Config[city].color..">"..k.." <DimGrey>(<cyan>"..v.ArmyRank.."<DimGrey>)")
    elseif v.city == "Eleusis" and not table.contains(Eletab, k) then
      table.insert(Eletab, "<"..Config[city].color..">"..k.." <DimGrey>(<cyan>"..v.ArmyRank.."<DimGrey>)")
    elseif v.city == "Ashtan" and not table.contains(Ashtab, k) then
      table.insert(Ashtab, "<"..Config[city].color..">"..k.." <DimGrey>(<cyan>"..v.ArmyRank.."<DimGrey>)")
    elseif v.city == "Cyrene" and not table.contains(Cytab, k) then
      table.insert(Cytab, "<"..Config[city].color..">"..k.." <DimGrey>(<cyan>"..v.ArmyRank.."<DimGrey>)")
    end
  end
end
cecho("\n<ansi_yellow>Army Ranks above 3 who are online:\n")
if matches[2] == "ash" or matches[2] == "ashtan" then
cecho("\n<"..Config["ashtan"].color..">Ashtan: "..table.concat(Ashtab, ", "))

elseif matches[2] == "mdor" or matches[2] == "mhaldor" then
cecho("\n<"..Config["mhaldor"].color..">Mhaldor: "..table.concat(Mhaltab, ", "))

elseif matches[2] == "ele" or matches[2] == "eleusis" then
cecho("\n<"..Config["eleusis"].color..">Eleusis: "..table.concat(Eletab, ", "))

elseif matches[2] == "hash" or matches[2] == "hashan" then
cecho("\n<"..Config["hashan"].color..">Hashan: "..table.concat(Hashtab, ", "))

elseif matches[2] == "targ" or matches[2] == "targossas" then
cecho("\n<"..Config["targossas"].color..">Targossas: "..table.concat(Targtab, ", "))

elseif matches[2] == "cy" or matches[2] == "cyrene" then
cecho("\n<"..Config["cyrene"].color..">Cyrene: "..table.concat(Cytab, ", "))
elseif matches[2] == "all" then
cecho("\n<"..Config["ashtan"].color..">Ashtan: "..table.concat(Ashtab, ", "))
echo("\n")
cecho("\n<"..Config["cyrene"].color..">Cyrene: "..table.concat(Cytab, ", "))
echo("\n")
cecho("\n<"..Config["eleusis"].color..">Eleusis: "..table.concat(Eletab, ", "))
echo("\n")
cecho("\n<"..Config["hashan"].color..">Hashan: "..table.concat(Hashtab, ", "))
echo("\n")
cecho("\n<"..Config["mhaldor"].color..">Mhaldor: "..table.concat(Mhaltab, ", "))
echo("\n")
cecho("\n<"..Config["targossas"].color..">Targossas: "..table.concat(Targtab, ", "))
end