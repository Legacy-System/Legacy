function LInit()
  Legacy = Legacy or {}
  Legacy.Settings = Legacy.Settings or {}
  Legacy.Settings.ignoreUpdates = Legacy.Settings.ignoreUpdates or false
  Legacy.Vinfo = {Version = "", msg = "", link = ""}
  Legacy.Version = "2.1"
  Legacy.Extras = Legacy.Extras or {}
  Legacy.Announcement = Legacy.Announcement or {}
  Legacy.Announcement.msg = Legacy.Announcement.msg or {}
  Legacy.Announcement.newMsg = {""}
  Legacy.Announcement.ignore = Legacy.Announcement.ignore or false
  Legacy[gmcp.Char.Status.name] = {}
  Legacy[gmcp.Char.Status.name].oldHealth = 0
  Legacy[gmcp.Char.Status.name].newHealth = 0
  Legacy[gmcp.Char.Status.name].oldMana = 0
  Legacy[gmcp.Char.Status.name].newMana = 0
  Legacy.Rift = Legacy.Rift or {}
  Legacy.CT = Legacy.CT or {}
  Legacy.UI = Legacy.UI or {}
  Legacy.Curing = Legacy.Curing or {}
  Legacy.CT.timers = {} 
  Legacy.NDB = Legacy.NDB or {}
  Legacy.NDB.Hidden = {}
  Legacy.Runes = Legacy.Runes or {}
  Legacy.Runes.smudgelist = Legacy.Runes.smudgelist or {}
  Legacy.Q = Legacy.Q or {}
  Legacy.Sailing = {}
  Legacy.Settings.Dor = {}
  enClass = ""
  inking = false
  Legacy.Curing.Dragonform = Legacy.Curing.Dragonform or {}
  Legacy.Curing.limbTable = {"left leg", "right leg"}
  
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
      ["damageType"]       = true,
      ["display"]           = "rawper",
      ["limbtracker"]       = false,
      ["showClassStats"]    = false,
      }
      
  Legacy.Settings.Prompt.damageTracking = {}
  
  function Legacy.Settings.Prompt.healthLost()
    if Legacy.Settings.Prompt.damageType ~= true then return '' end
    local ret = table.concat(Legacy.Settings.Prompt.damageTracking, ', ')
    
    local shortnames = {
      ["physical"] = '',
      ["cutting"]  = 'cut',
      ["electricity"] = "elec",
      ["asphyxiation"] = 'asph',
      ["  "] = " "
      
      }
    
    
    for k,v in pairs(shortnames) do
    
      if ret:match(k) then
        ret = ret:gsub(k, v)
      end
    end
      
      return ret
  end
  
  
  Legacy.Sailing.onShip = function()
    if gmcp.Room.Info.area == "" and gmcp.Room.Info.environment == "Vessel" then
      return true
    else
      return false
    end
  end
  
  function Legacy_Save()
    table.save(getMudletHomeDir().."/Legacy/Legacy.lua", Legacy)
  end
   registerAnonymousEventHandler("sysExitEvent", "Legacy_Save")

  if Legacy.Curing.prioset == nil then
    Legacy.Curing.prioset = "legacy"
  else
    Legacy.Curing.prioset = Legacy.Curing.prioset
  end
  Legacy.Q.eq = function(arg)
    send("cq all")
    send("queue add eq setalias attk "..arg)
    send("queue add eq attk")
  end
  Legacy.Q.free = function(arg)
    send("cq all")
    send("queue add free setalias attk "..arg)
    send("queue add free attk")
  end
  Legacy.Q.class = function(arg)
    send("cq all")
    send("queue add class setalias attk "..arg)
    send("queue add class attk")
  end
  Legacy.Q.para = function(arg)
    send("cq all")
    send("queue add p setalias attk "..arg)
    send("queue add p attk")
  end
  
  
  function Legacy.Dor(...)
if (gmcp.Char.Vitals.eq or gmcp.Char.Vitals.bal) == "0" or Legacy.Settings.Dor.status ~= true then return end
if Legacy.Settings.Dor.status ~= true then killtimer(Legacy.Settings.Dor.timer) Legacy.Settings.Dor.timer = nil return end
local arg = {...}
  if arg[1] == "clear" then
    Legacy.Settings.Dor.status = false
    Legacy.Settings.Dor.queue = {}
    Legacy.echo("<b><red>Cleared your DOR Queue.")
  elseif (arg ~= nil and table.size(arg) > 0 )then
    Legacy.Settings.Dor.queue = Legacy.Settings.Dor.queue or {}
    for k,v in pairs(arg) do
      table.insert(Legacy.Settings.Dor.queue, v)
    end
    Legacy.Dor()
  else
    for k,v in pairs(Legacy.Settings.Dor.queue) do
      send("queue add free "..v)
    end
    if Legacy.Settings.Dor.timer then
      killTimer(Legacy.Settings.Dor.timer)
      Legacy.Settings.Dor.timer = tempTimer(1, [[Legacy.Dor()]], true)
    else
      Legacy.Settings.Dor.timer = tempTimer(1, [[Legacy.Dor()]], true)
    end
  end
end

  Legacy.Room = Legacy.Room or {}
  Legacy.Room.directionTable = {
    n = "north",
    s = "south",
    e = "east",
    w = "west",
    nw = "northwest",
    ne = "northeast",
    sw = "southwest",
    se = "southeast",
    ["in"] = "in",
    ["out"] = "out",
    u = "up",
    d = "down",
    ["down"] = "d",
    ["up"] = "u",
    ["southeast"] = "se",
    ["southwest"] = "sw",
    ["northeast"] = "ne",
    ["northwest"] = "nw",
    ["west"]      = "w",
    ["east"]      = "e",
    ["south"]     = "s",
    ["north"]     = "n",  
    }
  Legacy.Room.Walls = {["Thorn"] = {}, ["Fire"] = {}, ["Ice"] = {}, ["Stone"] = {}}
  function Legacy.Room.ResetWalls()
    Legacy.Room.Walls = {["Thorn"] = {}, ["Fire"] = {}, ["Ice"] = {}, ["Stone"] = {}}
  end
  
  Legacy.Room = Legacy.Room or {}
  function Legacy.Room.People()
  Legacy.Room.players = {}
  for k,v in pairs(gmcp.Room.Players) do
    Legacy.Room.players[v.name] = true
  end
  raiseEvent("UI Update")
end

function Legacy.Room.Items()
  Legacy.Room.items = {}
  for k,v in pairs(gmcp.Char.Items.List.items) do
    if v.attrib == "t" or v.icon == "shrine" or v.icon == "container" or v.attrib == nil then
      Legacy.Room.items[v.id] = v.name
    end
  end
    raiseEvent("UI Update")
end

function Legacy.Room.Mobs()
  Legacy.Room.mobs = {}
    for k,v in pairs(gmcp.Char.Items.List.items) do
    if v.attrib == "m" or v.attrib == "mx" then
      Legacy.Room.mobs[v.id] = v.name
    end
  end
  raiseEvent("UI Update")
end

function Legacy.Room.addPeople()
  Legacy.Room.players[gmcp.Room.AddPlayer.name] = true
  raiseEvent("UI Update")
end

function Legacy.Room.addItems()
  if gmcp.Char.Items.Add.item.attrib == "t" or gmcp.Char.Items.Add.item.icon == "shrine" then
    Legacy.Room.items[gmcp.Char.Items.Add.item.id] = gmcp.Char.Items.Add.item.name
  end
  raiseEvent("UI Update")
end

function Legacy.Room.addMobs()
  if gmcp.Char.Items.Add.item.attrib == "m" or gmcp.Char.Items.Add.item.attrib == "mx" then
    Legacy.Room.mobs[gmcp.Char.Items.Add.item.id] = gmcp.Char.Items.Add.item.name
  end
  raiseEvent("UI Update")
end

function Legacy.Room.removePeople()
  Legacy.Room.players[gmcp.Room.RemovePlayer] = nil
  raiseEvent("UI Update")
end

function Legacy.Room.removeItems()
    if gmcp.Char.Items.Remove.item.attrib == "t" then
      Legacy.Room.items[gmcp.Char.Items.Remove.item.id] = nil
    end
  raiseEvent("UI Update")
end

function Legacy.Room.removeMobs()
    Legacy.Room.mobs[gmcp.Char.Items.Remove.item.id] = nil
    raiseEvent("UI Update")
end

registerAnonymousEventHandler("gmcp.Room.RemovePlayer", "Legacy.Room.removePeople")
registerAnonymousEventHandler("gmcp.Room.AddPlayer", "Legacy.Room.addPeople")
registerAnonymousEventHandler("gmcp.Room.Players", "Legacy.Room.People")

registerAnonymousEventHandler("gmcp.Char.Items.List", "Legacy.Room.Items")
registerAnonymousEventHandler("gmcp.Char.Items.Add", "Legacy.Room.addItems")
registerAnonymousEventHandler("gmcp.Char.Items.Remove", "Legacy.Room.removeItems")

registerAnonymousEventHandler("gmcp.Char.Items.List", "Legacy.Room.Mobs")
registerAnonymousEventHandler("gmcp.Char.Items.Add", "Legacy.Room.addMobs")
registerAnonymousEventHandler("gmcp.Char.Items.Remove", "Legacy.Room.removeMobs")
registerAnonymousEventHandler("gmcp.Room.Info", "Legacy.Room.ResetWalls")
registerAnonymousEventHandler("gmcp.Char.Items.List", "Legacy.Room.ResetWalls")

  --Curing
  Legacy.Curing.Prios = Legacy.Curing.Prios or {}
  Legacy.Curing.Affs = {}
  Legacy.Curing.Defs = Legacy.Curing.Defs or {}
  Legacy.Curing.Defs.currentset = Legacy.Curing.Defs.currentset or gmcp.Char.Status.class:title()
  Legacy.Curing.Defs.Burst = Legacy.Curing.Defs.Burst or {defences = {}, keepup = {},}
  Legacy.Curing.Defs.legacy = {
    defences = {
    },
    keepup = {
    },
  
  }
  
  function Legacy.Curing.levelsTracking()
  local Aff = Legacy.Curing.Affs
  local currentLevel = 0
  --table for very quick check of the affliction  you are currently seeing if it's a level based affliction
  local levelTypes = {["unweavingbody"] = true,
                      ["unweavingmind"] = true,
                      ["unweavingspirit"] = true,
                      ["melancholic"] = true,
                      ["choleric"] = true,
                      ["phlegmatic"] = true,
                      ["sanguine"] = true,
                      ["horror"] = true,
                      ["pyre"] = true,
                      ["burning"] = true,
                      ["torntendons"] = true,
                      ["skullfracture"] = true,
                      ["wristfracture"] = true,
                      ["crackedribs"] = true,
                      ["pressure"] = true,
                      ["crescendo"] = true,
                      }
  
  --reset counts back to zero so if no aff found, don't need to track at that point that you needed to do a resets.
  Legacy.Curing.Levels = { ["unweavingbody"] = 0,
                    ["unweavingmind"] = 0,
                    ["unweavingspirit"] = 0,
                    ["melancholic"] = 0,
                    ["choleric"] = 0,
                    ["phlegmatic"] = 0,
                    ["sanguine"] = 0,
                    ["horror"] = 0,
                    ["pyre"] = 0,
                    ["burning"] = 0,
                    ["torntendon"] = 0,
                    ["skullfracture"] = 0,
                    ["wristfracture"] = 0,
                    ["crackedrib"] = 0,
                    ["pressure"] = 0,
                    ["crescendo"] = 0,
                    }
  --loop through the current afflictions you have, check if the aff you are looking at is on the list of level based ones
  for k, v in pairs(Aff) do
    local baseAffName = k:cut(-5) ----cut(-5) removes the bracketed number from level based affs if present: unweavingbody (3)
    if levelTypes[baseAffName] then 
      currentLevel = string.gsub(k, baseAffName.." %((%d)%)", "%1") --capture the number from the aff word 
      Legacy.Curing.Levels[baseAffName] = tonumber(currentLevel)           --store it
    end    
  end 
end
  
  
  
  Legacy.Curing.needCuringSwap = false
  Legacy.Curing.prevailing = false
  Legacy.Curing.dragonforming = false
  Legacy.Curing.Defs.tracking = {}
  addedDefs = {}
  removedDefs = {}
  Legacy.Curing.Defs.current = {}
  Legacy.Curing.Defs.all   = {
    "Accursedresolve",
    "Acrobatics",
    "Affinity",
    "Agithtailegend",
    "Aiming",
    "Airpocket",
    "Alertness",
    "Alligatorlegend",
    "Amamaalierlegend",
    "Antiforce",
    "Arctar",
    "Aria",
    "Arrowcatching",
    "Astralform",
    "Astronomy",
    "Balancing",
    "Barkskin",
    "Basking",
    "Battlesong",
    "Bedevilaura",
    "Belltattoo",
    "Blackboarlegend",
    "Blackwind",
    "Bladefire",
    "Blademastery",
    "Blessingofthegods",
    "Blindness",
    "Blocking",
    "Bloodquell",
    "Bloodshield",
    "Blunder",
    "Blur",
    "Boartattoo",
    "Bodyaugment",
    "Bodyblock",
    "Boostedregeneration",
    "Brains",
    "Bulk",
    "Chameleon",
    "Chargeshield",
    "Circulate",
    "Clinging",
    "Cloak",
    "Cohesion",
    "Coldresist",
    "Consciousness",
    "Constitution",
    "Curseward",
    "Dawnhand",
    "Deafness",
    "Deathaura",
    "Deathsight",
    "Deflect",
    "Deliverance",
    "Demonarmour",
    "Demonfury",
    "Density",
    "Devilmark",
    "Devour",
    "Diamondskin",
    "Disassociate",
    "Disperse",
    "Distortedaura",
    "Dodging",
    "Dragonarmour",
    "Dragonbreath",
    "Drunkensailor",
    "Durability",
    "Dustform",
    "Eaglelegend",
    "Earthshield",
    "Eavesdropping",
    "Electricresist",
    "Elusiveness",
    "Enduranceblessing",
    "Endure",
    "Enhancedform",
    "Evadeblock",
    "Evasion",
    "Extispicy",
    "Extrusion",
    "Eyes",
    "Faith",
    "Fangbarrier",
    "Fervour",
    "Firefly",
    "Fireresist",
    "Fireshroud",
    "Firstaid",
    "Flailingstaff",
    "Fleetness",
    "Frenzied",
    "Frostshield",
    "Fury",
    "Ghost",
    "Golgothagrace",
    "Gripping",
    "Grookbubble",
    "Groundwatch",
    "Guidedstrike",
    "Harmony",
    "Haste",
    "Heads",
    "Heartsfury",
    "Heldbreath",
    "Heresy",
    "Hiding",
    "Hyperfocus",
    "Hypersense",
    "Hypersight",
    "Immunity",
    "Incandescence",
    "Indomitability",
    "Insomnia",
    "Inspiration",
    "Insufflate",
    "Insulation",
    "Ironform",
    "Ironwill",
    "Joints",
    "Kaiboost",
    "Kaitrance",
    "Kola",
    "Lament",
    "Lay",
    "Leechlogograph",
    "Levitating",
    "Lifebond",
    "Lifegiver",
    "Lifesteal",
    "Lifevision",
    "Lipreading",
    "Magicresist",
    "Maticlegend",
    "Megalithtattoo",
    "Mentalclarity",
    "Mercury",
    "Metawake",
    "Mindcloak",
    "Mindnet",
    "Mindseye",
    "Mindtelesense",
    "Mistral",
    "Moontattoo",
    "Morph",
    "Mosstattoo",
    "Mouths",
    "Nicatorlegend",
    "Nightsight",
    "Numbness",
    "Oxtattoo",
    "Pacing",
    "Painshift",
    "Panacea",
    "Phased",
    "Pinchblock",
    "Placement",
    "Poisonresist",  
    "Preachblessing",
    "Precision",
    "Prismatic",
    "Projectiles",
    "Promosurcoat",
    "Psibreakthrough",
    "Psicomprehend",
    "Psitranscend",
    "Psivanish",
    "Putrefaction",
    "Rebounding",
    "Reflections",
    "Reflexes",
    "Regeneration",
    "Resistance",
    "Retaliation",
    "Retribution",
    "Ruin",
    "Rupturesight",
    "Satiation",
    "Scales",
    "Scholasticism",
    "Scouting",
    "Seasonelegend",
    "Secondsight",
    "Secondskin",
    "Selfishness",
    "Setweapon",
    "Shadowveil",
    "Shield",
    "Shieldlogograph",
    "Shikudoform",
    "Shinbinding",
    "Shinclarity",
    "Shinperfection",
    "Shinrejoinder",
    "Shintrance",
    "Shipwarning",
    "Shroud",
    "Skysight",
    "Skywatch",
    "Slippery",
    "Softfocusing",
    "Songbird",
    "Soulcage",
    "Speed",
    "Spinning",
    "Spinningstaff",
    "Spiritbonded",
    "Spiritwalk",
    "Splitmind",
    "Standingfirm",
    "Starburst",
    "Stealth",
    "Stonefist",
    "Stoneskin",
    "Strata",
    "Sulphur",
    "Susurrating",
    "Swiftcurse",
    "Sympathy",
    "Tekurastance",
    "Telesense",
    "Temperance",
    "Tempest",
    "Tentacles",
    "Thermalshield",
    "Thirdeye",
    "Tin",
    "Tongues",
    "Toughness",
    "Treewatch",
    "Tremorsense",
    "Truestare",
    "Tumors",
    "Tune",
    "Twoartsstance",
    "Unbowed",
    "Unnamablepresence",
    "Vengeance",
    "Venomsacks",
    "Vigilance",
    "Vigour",
    "Viridian",
    "Vitality",
    "Ward",
    "Waterwalking",
    "Weakvigour",
    "Weathering",
    "Weaving",
    "Wildgrowth",
    "Willpowerblessing",
    "Wolflegend",
    "Xporb",  
  }
  
  --Setting up tracking
  for _,v in pairs(Legacy.Curing.Defs.all) do
    
    Legacy.Curing.Defs.tracking[v:lower()] = 0
  
  end
   
  Legacy.Curing.bal = {
    tree = true,
    eat  = true,
    sip  = true,
    apply = true,
    focus = true,
    active = true,
    smoke = true,
  }
  
  
  --Curing Sets

 Legacy.Curing.Prios.legacy = Legacy.Curing.Prios.legacy or {
        ["Addiction"] = 11,
    ["Aeon"] = 1,
    ["Agoraphobia"] = 15,
    ["Anorexia"] = 2,
    ["Asthma"] = 5,
    ["Bound"] = 6,
    ["Brokenleftarm"] = 8,
    ["Brokenleftleg"] = 8,
    ["Brokenrightarm"] = 7,
    ["Brokenrightleg"] = 7,
    ["Burning1"] = 18,
	  ["Burning2"] = 15,
	  ["Burning3"] = 10,
	  ["Burning4"] = 8,
	  ["Burning5"] = 4,
    ["Calcifiedskull"] = 3,
    ["Calcifiedtorso"] = 3,
    ["Claustrophobia"] = 14,
    ["Clumsiness"] = 7,
    ["Concussion"] = 11,
    ["Confusion"] = 8,
    ["Crackedribs"] = 10,
    ["Crescendo"]   = 25,
    ["Crescendo5"]   = 1,
    ["Crushedthroat"] = 5,
    ["Daeggerimpale"] = 6,
    ["Damagedhead"] = 11,
    ["Damagedleftarm"] = 8,
    ["Damagedleftleg"] = 7,
    ["Damagedrightarm"] = 8,
    ["Damagedrightleg"] = 7,
    ["Darkshade"] = 8,
    ["Dazed"] = 20,
    ["Deadening"] = 15,
    ["Dementia"] = 16,
    ["Depression"] = 6,
    ["Diminished"] = 12,
    ["Disloyalty"] = 14,
    ["Disrupted"] = 9,
    ["Dissonance"] = 14,
    ["Dizziness"] = 9,
    ["Earworm"]   = 8,
    ["Entangled"] = 6,
    ["Epilepsy"] = 9,
    ["Fear"] = 20,
    ["Flushings"] = 7,
    ["Frozen"] = 6,
    ["Generosity"] = 20,
    ["Grievouswounds"] = 3,
    ["Guilt"] = 3,
    ["Haemophilia"] = 11,
    ["Hallucinations"] = 8,
    ["Healthleech"] = 12,
    ["Heartseed"] = 3,
    ["Hellsight"] = 10,
    ["Horror1"] = 15,
    ["Horror2"] = 14,
    ["Horror3"] = 13,
    ["Horror4"] = 10,
    ["Horror5"] = 2,
    ["Hypersomnia"] = 8,
    ["Hypochondria"] = 5,
    ["Hypothermia"] = 4,
    ["Impaled"] = 6,
    ["Impatience"] = 4,
    ["Indifference"] = 10,
    ["Itching"] = 5,
    ["Justice"] = 15,
    ["Kkractlebrand"] = 5,
    ["Laceratedthroat"] = 18,
    ["Latched"] = 2,
    ["Lethargy"] = 11,
    ["Loneliness"] = 15,
    ["Lovers"] = 1,
    ["Manaleech"] = 13,
    ["Mangledhead"] = 9,
    ["Mangledleftarm"] = 14,
    ["Mangledleftleg"] = 14,
    ["Mangledrightarm"] = 14,
    ["Mangledrightleg"] = 14,
    ["Masochism"] = 18,
    ["Mildtrauma"] = 16,
    ["Mycalium"] = 4,
    ["Nausea"] = 11,
    ["Pacified"] = 5,
    ["Paralysis"] = 2,
    ["Paranoia"] = 16,
    ["Parasite"] = 8,
    ["Peace"] = 5,
    ["Pressure"] = 5,
    ["Prone"] = 9,
    ["Pyramides"] = 4,
    ["Pyre1"] = 15,
	  ["Pyre2"] = 12,
	  ["Pyre3"] = 10,
    ["Rebbies"] = 7,
    ["Recklessness"] = 12,
    ["Retribution"] = 6,
    ["Sandfever"] = 9,
    ["Scytherus"] = 5,
    ["Selarnia"] = 19,
    ["Sensitivity"] = 6,
    ["Serioustrauma"] = 16,
    ["Shadowmadness"] = 5,
    ["Shivering"] = 12,
    ["Shyness"] = 14,
    ["Skullfractures"] = 3,
    ["Slashedthroat"] = 18,
    ["Sleeping"] = 1,
    ["Slickness"] = 10,
    ["Spiritburn"] = 11,
    ["Stupidity"] = 9,
    ["Stuttering"] = 18,
    ["Temperedcholeric"] = 13,
    ["Temperedmelancholic"] = 13,
    ["Temperedphlegmatic"] = 13,
    ["Temperedsanguine"] = 13,
    ["Tenderskin"] = 11,
    ["Tension"] = 4,
    ["Timeloop"] = 3,
    ["Tonguetied"] = 8,
    ["Torntendons"] = 5,
    ["Transfixation"] = 6,
    ["Unweavingbody1"] = 7,
    ["Unweavingbody2"] = 6,
    ["Unweavingbody3"] = 5,
    ["Unweavingbody4"] = 4,
    ["Unweavingbody5"] = 2,
    ["Unweavingmind1"] = 7,
    ["Unweavingmind2"] = 6,
    ["Unweavingmind3"] = 5,
    ["Unweavingmind4"] = 4,
    ["Unweavingmind5"] = 2,
    ["Unweavingspirit1"] = 7,
    ["Unweavingspirit2"] = 6,
    ["Unweavingspirit3"] = 5,
    ["Unweavingspirit4"] = 4,
    ["Unweavingspirit5"] = 2,
    ["Vertigo"] = 15,
    ["Voyria"] = 9,
    ["Weariness"] = 6,
    ["Webbed"] = 6,
    ["Whisperingmadness"] = 11,
    ["Wristfractures"] = 10,
    }  
    
  Legacy.Curing.Prios.temp = Legacy.Curing.Prios.temp or {
    ["Addiction"] = 11,
    ["Aeon"] = 1,
    ["Agoraphobia"] = 15,
    ["Anorexia"] = 2,
    ["Asthma"] = 5,
    ["Bound"] = 6,
    ["Brokenleftarm"] = 7,
    ["Brokenleftleg"] = 7,
    ["Brokenrightarm"] = 8,
    ["Brokenrightleg"] = 8,
    ["Burning1"] = 18,
	  ["Burning2"] = 15,
	  ["Burning3"] = 10,
	  ["Burning4"] = 8,
	  ["Burning5"] = 4,
    ["Calcifiedskull"] = 3,
    ["Calcifiedtorso"] = 3,
    ["Claustrophobia"] = 14,
    ["Clumsiness"] = 7,
    ["Concussion"] = 11,
    ["Confusion"] = 8,
    ["Crackedribs"] = 10,
    ["Crushedthroat"] = 5,
    ["Daeggerimpale"] = 6,
    ["Damagedhead"] = 11,
    ["Damagedleftarm"] = 7,
    ["Damagedleftleg"] = 7,
    ["Damagedrightarm"] = 7,
    ["Damagedrightleg"] = 7,
    ["Darkshade"] = 8,
    ["Dazed"] = 20,
    ["Deadening"] = 15,
    ["Dementia"] = 16,
    ["Depression"] = 6,
    ["Disloyalty"] = 14,
    ["Disrupted"] = 9,
    ["Dissonance"] = 14,
    ["Dizziness"] = 9,
    ["Entangled"] = 6,
    ["Epilepsy"] = 9,
    ["Fear"] = 20,
    ["Flushings"] = 7,
    ["Frozen"] = 6,
    ["Generosity"] = 20,
    ["Grievouswounds"] = 3,
    ["Guilt"] = 3,
    ["Haemophilia"] = 11,
    ["Hallucinations"] = 8,
    ["Healthleech"] = 12,
    ["Heartseed"] = 3,
    ["Hellsight"] = 10,
    ["Horror1"] = 15,
    ["Horror2"] = 14,
    ["Horror3"] = 13,
    ["Horror4"] = 10,
    ["Horror5"] = 2,
    ["Hypersomnia"] = 8,
    ["Hypochondria"] = 5,
    ["Hypothermia"] = 4,
    ["Impaled"] = 6,
    ["Impatience"] = 4,
    ["Indifference"] = 10,
    ["Itching"] = 5,
    ["Justice"] = 15,
    ["Kkractlebrand"] = 5,
    ["Laceratedthroat"] = 18,
    ["Latched"] = 2,
    ["Lethargy"] = 11,
    ["Loneliness"] = 15,
    ["Lovers"] = 1,
    ["Manaleech"] = 13,
    ["Mangledhead"] = 9,
    ["Mangledleftarm"] = 14,
    ["Mangledleftleg"] = 14,
    ["Mangledrightarm"] = 14,
    ["Mangledrightleg"] = 14,
    ["Masochism"] = 18,
    ["Mildtrauma"] = 16,
    ["Mycalium"] = 4,
    ["Nausea"] = 11,
    ["Pacified"] = 5,
    ["Paralysis"] = 2,
    ["Paranoia"] = 16,
    ["Parasite"] = 8,
    ["Peace"] = 5,
    ["Pressure"] = 5,
    ["Prone"] = 9,
    ["Pyramides"] = 4,
    ["Pyre1"] = 15,
	  ["Pyre2"] = 12,
	  ["Pyre3"] = 10,
    ["Rebbies"] = 7,
    ["Recklessness"] = 12,
    ["Retribution"] = 6,
    ["Sandfever"] = 9,
    ["Scytherus"] = 5,
    ["Selarnia"] = 19,
    ["Sensitivity"] = 6,
    ["Serioustrauma"] = 16,
    ["Shadowmadness"] = 5,
    ["Shivering"] = 12,
    ["Shyness"] = 14,
    ["Skullfractures"] = 3,
    ["Slashedthroat"] = 18,
    ["Sleeping"] = 1,
    ["Slickness"] = 10,
    ["Spiritburn"] = 11,
    ["Stupidity"] = 9,
    ["Stuttering"] = 18,
    ["Temperedcholeric"] = 13,
    ["Temperedmelancholic"] = 13,
    ["Temperedphlegmatic"] = 13,
    ["Temperedsanguine"] = 13,
    ["Tenderskin"] = 11,
    ["Tension"] = 4,
    ["Timeloop"] = 3,
    ["Tonguetied"] = 8,
    ["Torntendons"] = 5,
    ["Transfixation"] = 6,
    ["Unweavingbody1"] = 7,
    ["Unweavingbody2"] = 6,
    ["Unweavingbody3"] = 5,
    ["Unweavingbody4"] = 4,
    ["Unweavingbody5"] = 2,
    ["Unweavingmind1"] = 7,
    ["Unweavingmind2"] = 6,
    ["Unweavingmind3"] = 5,
    ["Unweavingmind4"] = 4,
    ["Unweavingmind5"] = 2,
    ["Unweavingspirit1"] = 7,
    ["Unweavingspirit2"] = 6,
    ["Unweavingspirit3"] = 5,
    ["Unweavingspirit4"] = 4,
    ["Unweavingspirit5"] = 2,
    ["Vertigo"] = 15,
    ["Voyria"] = 9,
    ["Weariness"] = 6,
    ["Webbed"] = 6,
    ["Whisperingmadness"] = 11,
    ["Wristfractures"] = 10,
      }
  
  
  Legacy.Curing.Prios.nonCures = {
    Airfisted = "reset",
    Asphyxiating = "reset",
    Blackout = "reset",
    Blindness = "reset",
    Blistered = "reset",
    Bruisedribs = "reset",
    Coldfate = "reset",
    Condemned = "reset",
    Constricted = "reset",
    Corruption = "reset",
    Cremated = "reset",
    Dazzled = "reset",
    Deafness = "reset",
    Deathsickness = "reset",
    Degenerate = "reset",
    Dehydrated = "reset",
    Demonstain = "reset",
    Deteriorate = "reset",
    Empoweredloshre = "reset",
    Empoweredmannaz = "reset",
    Enmesh = "reset",
    Ensorcelled = "reset",
    Flamefisted = "reset",
    Hamstrung = "reset",
    Hatred = "reset",
    Hecatecurse = "reset",
    Hindered = "reset",
    Homunculusmercury = "reset",
    Icefisted = "reset",
    Inquisition = "reset",
    Insomnia = "reset",
    Internalbleeding = "reset",
    Kaisurge = "reset",
    Lapsingconsciousness = "reset",
    Lightbind = "reset",
    Mindravaged = "reset",
    Muddled = "reset",
    Numbedleftarm = "reset",
    Numbedrightarm = "reset",
    Palpatarfeed = "reset",
    Petrified = "reset",
    Phlogisticated = "reset",
    Pinshot = "reset",
    Revealed = "reset",
    Scalded = "reset",
    Scrambledbrains = "reset",
    Silenced = "reset",
    Silver = "reset",
    Slimeobscure = "reset",
    Solarburn = "reset",
    Timeflux = "reset",
    Trueblind = "reset",
    Unconsciousness = "reset",
    Vinewreathed = "reset",
    Vitiated = "reset",
    Vitrified = "reset",
    Voidfisted = "reset",
    Waterbonds = "reset"
}    

    Legacy.Curing.Lust = Legacy.Curing.Lust or {}
    Legacy.Curing.Lust.whiteList = Legacy.Curing.Lust.whiteList or {}
    Legacy.Curing.Lust.confirmed = Legacy.Curing.Lust.confirmed or false
  
  --Class Tracking
  Legacy.CT.Enemies = Legacy.CT.Enemies or {}
  Legacy.CT.StaticAllies = Legacy.CT.StaticAllies or {}
  Legacy.CT.StaticEnemies = Legacy.CT.StaticEnemies or {}
  
  --NDB
  Legacy.NDB.db = Legacy.NDB.db or {}
  Legacy.NDB.Enemies = Legacy.NDB.Enemies or {}
  Legacy.NDB.qwhom = Legacy.NDB.qwhom or {}
  
  
  
  --Created by: Grandue

function Legacy.NDB.qwc()

  city_online = {}
  local Config = Legacy.Settings.NDB.Config
  local tmp_city = ''
  
  for k,v in pairs(Legacy.NDB.db) do
    if table.contains(Legacy.NDB.awake, k) then
      tmp_city = v.city
      if tmp_city == '(none)' then
        tmp_city = "Rogue"
      end
      if not city_online[tmp_city] then
        city_online[tmp_city] = {}
      end
      table.insert(city_online[tmp_city], k)
    end
  end

--cecho("\n<ansiYellow>-------------------------------------------------------------------------------------------------------------------------------------")
  -- Store cities and their sizes
local city_list = {}
for k, v in pairs(city_online) do
  table.insert(city_list, { name = k, size = #v, players = v })
end

-- Sort cities by size in descending order
table.sort(city_list, function(a, b)
  return a.size > b.size
end)

-- Function to sort names alphabetically
local function sort_names(names)
  table.sort(names, function(a, b) return a:lower() < b:lower() end)
end

-- Display sorted results
for _, city in ipairs(city_list) do
  -- Sort names within the city alphabetically
  sort_names(city.players)

  -- Print the city name with color
  if Legacy.Settings.NDB.Config[city.name:lower()] then
    if city.name == "Ashtan" or city.name == "Hashan" or city.name == "Cyrene" then
      cecho("\n<"..Legacy.Settings.NDB.Config[city.name:lower()].color..">   "..city.name..": <grey>\(<white>"..#city.players.."<grey>\) ")
    elseif city.name == "Mhaldor" or city.name == "Eleusis" then
      cecho("\n<"..Legacy.Settings.NDB.Config[city.name:lower()].color..">  "..city.name..": <grey>\(<white>"..#city.players.."<grey>\) ")
    elseif city.name == "Targossas" then
      cecho("\n<"..Legacy.Settings.NDB.Config[city.name:lower()].color..">"..city.name..": <grey>\(<white>"..#city.players.."<grey>\) ")
    end
  else
    cecho("\n<"..Legacy.Settings.NDB.Config["(none)"].color..">    "..city.name..": <grey>\(<white>"..#city.players.."<grey>\) ")
  end

  -- Print sorted names with their colors
  for _, player in ipairs(city.players) do
    cecho(""..Legacy.NDB.color(player)..player.." ")
  end
end
--cecho("\n<ansiYellow>-------------------------------------------------------------------------------------------------------------------------------------")

end
  
function Legacy.Curing.preDraw()
if Legacy then
if Legacy.Settings.Curing.precache == true and (leaving == false or leaving == nil) then
  if Legacy.Settings.Curing.SS.Settings.fallback == true then
  local cache = {"kelp", "bloodroot", "ginseng", "goldenseal", "aurum", "magnesium", "ferrum", "plumbum"}
    for _,v in pairs(cache) do
      send("outr 5 "..v)
    end  
  elseif Legacy.Settings.Curing.SS.Settings.method == "Concoctions" then
    local cache = {"kelp", "bloodroot", "ginseng", "goldenseal"}
    for _,v in pairs(cache) do
      send("outr 5 "..v)
    end
  elseif Legacy.Settings.Curing.SS.Settings.method == "Transmutation" then
    local cache = {"aurum", "magnesium", "ferrum", "plumbum"}
    for _,v in pairs(cache) do
      send("outr 5 "..v)
    end
  end
end
end
end
  
  
  
  
  --Extra Stuff
  function Legacy.colorFix(color)
    if color == nil then color = "red" end
    local fixedcolor = "anis_white"
    if table.contains(_G.color_table, color) then
      return color
    else
    local colorCount = 0
      for k,v in pairs(_G.color_table) do
        if k:match(color:lower()) or k:match(color:title()) then
          colorCount = colorCount + 1
          fixedcolor = k
        end
      end
    end   
  return fixedcolor
  end
  
  
  --SETTINGS
  Legacy.Settings = Legacy.Settings or {}
  
  if Legacy.Settings.usePrompt ~= false or Legacy.Settings.usePrompt == nil then
    Legacy.Settings.usePrompt =  true
  else
    Legacy.Settings.usePrompt = false
  end
  Legacy.Settings.Curing = Legacy.Settings.Curing or {}
  Legacy.Settings.Curing.SS = Legacy.Settings.Curing.SS or {}
  if Legacy.Settings.Curing.affPrompt ~= false or Legacy.Settings.Curing.affPrompt == nil then
    Legacy.Settings.Curing.affPrompt =  true
  else
    Legacy.Settings.Curing.affPrompt = false
  end
  if Legacy.Settings.Curing.slowcure ~= true or Legacy.Settings.Curing.slowcure == nil then
    Legacy.Settings.Curing.slowcure = false
  else
    Legacy.Curing.slowcure = true
  end
  if Legacy.Settings.Curing.cureEchos ~= false or Legacy.Settings.Curing.cureEchos == nil then
    Legacy.Settings.Curing.cureEchos = true
  else
    Legacy.Settings.Curing.cureEchos = false
  end
  if Legacy.Settings.Curing.burstset ~= true or Legacy.Settings.Curing.burstset == nil then
    Legacy.Settings.Curing.burstset = false
  else
    Legacy.Settings.Curing.burstset = true
  end
  Legacy.Settings.NDB = Legacy.Settings.NDB or {}
  if Legacy.Settings.NDB.removeDormant ~= true or Legacy.Settings.NDB.removeDormant == nil then
    Legacy.Settings.NDB.removeDormant = false
  end

  
  
  --Curing
  Legacy.Settings.Curing.status = true
  if Legacy.Settings.Curing.precache ~= false or Legacy.Settings.Curing.precache == nil then
    Legacy.Settings.Curing.precache = true
  else
    Legacy.Settings.Curing.precache = false
  end
  Legacy.Settings.Curing.precacheCount = 1 -- number of curatives to remove on eat
  Legacy.Settings.Curing.SS.Settings = Legacy.Settings.Curing.SS.Settings or {}
  
  --NDB
  Legacy.Settings.NDB.tempHL = {}
  Legacy.Settings.NDB.cityList = {"Targossas", "Hashan", "Cyrene", "Mhaldor", "Eleusis", "Ashtan", "Underworld", "(none)"}
  Legacy.Settings.NDB.Config = Legacy.Settings.NDB.Config or {
    ["ashtan"] = {
      color = "purple",
      bold = false,
      underline = false,
      italics = false
    },
    ["cyrene"] = {
      color = "cornflower_blue",
      bold = false,
      underline = false,
      italics = false
    },
    ["eleusis"] = {
      color = "forest_green",
      bold = false,
      underline = false,
      italics = false    
    },
    ["hashan"] = {
      color = "yellow",
      bold = false,
      underline = false,
      italics = false    
    },
    ["mhaldor"] = {
      color = "red",
      bold = false,
      underline = false,
      italics = false    
    },
    ["targossas"] = {
      color = "white",
      bold = false,
      underline = false,
      italics = false    
    },
    
    ["(none)"] = {
      color = "orange",
      bold = false,
      underline = false,
      italics = false    
    },
    ["divine"] = {
      color = "pink",
      bold = true,
      underline = false,
      italics = true    
    },
    ["(hidden)"] = {
      color = "green",
      bold = true,
      underline = false,
      italics = true    
    },
    ["enemies"] = {
      bold = false,
      color = "",
      underline = true,
      italics = true    
    },
    ["underworld"] = {
      color = "DimGrey",
      bold = true,
      underline = false,
      italics = true    
    },
  }
  
  
  function Legacy.Ideas(msg)

  if #msg >= 200 then
    fixedmsg = "```"..msg.."```"
  else
    fixedmsg = "``"..msg.."``"
  end

  local httpdone = registerAnonymousEventHandler('sysPostHttpDone', 
    function(event, rurl, response)
      if rurl == url then display(r) else return true end
    end, true)

  local httperror = registerAnonymousEventHandler('sysPostHttpError', 
    function(event, response, rurl)
      if rurl == url then display(r) else return true end
    end, true)
   
  
  
  local url1 = "https://discord.com/api/webhooks/1342714265005588552/"
  local url2 = "1wisXVim1xszRvB0nI_Pd-tL7VGnf-SKtUFwn_iEAnXAYbA0_XjKQPheEcB6TxqSEZTn"
  local url  = url1..url2
  local data = {
    username = "Ideas",    
    content  = fixedmsg
  }
  local header = {
    ["Content-Type"] = "application/json",
    --["Content-Length"] = data:len()
  }  
  postHTTP(yajl.to_string(data), url, header)
  
    local url1 = "https://discord.com/api/webhooks/1342715019057561721"
    local url2 = "/QFmXgbcmD-VmCLJ53NaDhrDNVuAzg6L8w7cdhwgpM0TlZbmsazsbxWLndSnNvcGGak4b"
    local url  = url1..url2
    local data = {
      username = "Says",    
      content  = "``"..gmcp.Char.Status.name.."\n"..msg.."``"
    }
    local header = {
      ["Content-Type"] = "application/json",
      --["Content-Length"] = data:len()
    }
  postHTTP(yajl.to_string(data), url, header)  
  killAnonymousEventHandler(httpdone)
  killAnonymousEventHandler(httperror)
  
end
  
  
  Legacy.panic = function(msg)
    if msg == nil then
      cecho("\n<cyan>You broke something")
    else
      cecho("\n<red>You broke something...but left notes!\n<cyan>Notes: "..msg)
    end
  end
  
  Legacy.echo = function(msg)
  
      cecho("\n<white>[<gold>Legacy<white>]: "..msg)
  end
  
    Legacy.bigEcho = function(msg, color1, color2)
      local color1 = color1 or "SeaGreen"
      local color2 = color2 or "white"
      local width = getWindowWrap("main")

      local line = "\n<" .. color1 .. ">" .. string.rep("-", width)
      local pad = string.rep(" ", math.floor(width/2) - math.floor(#msg/2))

      cecho(line)
      cecho("\n<" .. color2 .. ">" .. pad .. msg .. pad)
      cecho(line)
  end 


  
  function Legacy.NDB.hiddenUpdate()
  if not (Legacy.NDB.Hidden.title and Legacy.NDB.Hidden.city) then return end
  for k, v in pairs(Legacy.NDB.db) do
    if v.title == Legacy.NDB.Hidden.title then
      Legacy.NDB.db[k].city = Legacy.NDB.Hidden.city:title()
      Legacy.NDB.db[k].ArmyRank = Legacy.NDB.Hidden.ar
      if Legacy.NDB.Hidden.mark ~= false then
        Legacy.NDB.db[k].mark = Legacy.NDB.Hidden.mark
      end
      Legacy.Settings.NDB.newHL(k)
    end
  end
  Legacy.NDB.Hidden = {}
end

  
  
  lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB")
  lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB/Characters")
  lfs.mkdir(getMudletHomeDir().. "/Legacy/ClassTrack")
  
  function Legacy.Settings.NDB.newHL(arg)
  local who = arg:title()
  if Legacy.NDB.db[who] then
    if not Legacy.Settings.NDB.tempHL[who] then
      Legacy.Settings.NDB.tempHL[who] = tempTrigger(who, [[Legacy.Settings.NDB.formatting("]] .. who .. [[")]])
    end
  end
end

  
  function Legacy.NDB.getOnline()
  downloadFile(getMudletHomeDir() .. "/Legacy/NDB/who.json", "http:\/\/api.achaea.com\/characters.json")
  end
  
  function Legacy.NDB.lookup(arg)
  local person = arg
  Legacy.NDB.db = Legacy.NDB.db or {}
  if io.exists(getMudletHomeDir().."/Legacy/NDB/Characters") then
    --nothing
  else
    lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB/Characters")
  end
  downloadFile(getMudletHomeDir().. "/Legacy/NDB/Characters/"..person..".json", "http://api.achaea.com/characters/"..person..".json")

tempTimer(3, function()
filepath = getMudletHomeDir().. "/Legacy/NDB/Characters/"..person..".json"
    
    local f, s = io.open(filepath)
    if f then s = f:read("*l"); io.close(f) end

	-- didn't get JSON data? 
	if s:find("Internal error", 1, true) or s:find("DOCTYPE html PUBLIC", 1, true) then
		cecho("\n<red>Data Acquisition Failed!") 
		return 
	end

	local t = yajl.to_value(s)
	local name = t.name
	local title = t.fullname
	local house = t.house:title()
	local xp_rank = tonumber(t.xp_rank)
	local city = t.city:title()
	local class = t.class:title()
	local level = tonumber(t.level)
  
    Legacy.NDB.db[name] = Legacy.NDB.db[name] or {}
    
    if city == "" then
      Legacy.NDB.db[name].city = "Divine"
    elseif (title == "Romeo, the Guide" or title == "Juliet, the Guide") and city == "(none)" then
      Legacy.NDB.db[name].city = "Divine"
    elseif city == "(hidden)" and Legacy.NDB.db[name].city ~= nil then
    elseif city:match("Underworld") then
      Legacy.NDB.db[name].city = "Underworld"
      
    
    else
     Legacy.NDB.db[name].city = city
    end
    
    
   
    if Legacy.NDB.db[name].title ~= title then
      Legacy.NDB.db[name].title =  title
    end
    if Legacy.NDB.db[name].house ~=  house then
      Legacy.NDB.db[name].house =  house
    end
    if Legacy.NDB.db[name].class ~=  class then
      Legacy.NDB.db[name].class =  class
    end
    if Legacy.NDB.db[name].level ~=  level then
      Legacy.NDB.db[name].level =  level
    end
   
    if Legacy.NDB.db[name].city == "Underworld" then
      Legacy.NDB.db[name].house = "The Profane Reaches of Demise"
      Legacy.NDB.db[name].class = Legacy.NDB.db[name].title:gsub(" "..name, "")
    end
    Legacy.Settings.NDB.newHL(name)
    
    if Legacy.CT.Enemies[name] then
      Legacy.CT.Enemies[name] = class
    end
    
     if xp_rank == 0 and Legacy.NDB.db[name].city ~= "Divine" and Legacy.Settings.NDB.removeDormant == true then
      Legacy.NDB.db[name] = nil
    else
      Legacy.NDB.db[name].xp_rank = xp_rank
    end
    
  end)
end
 
function Legacy.Settings.NDB.formatting(name)
  if Legacy.NDB.db[name] == nil then return end
  local home = Legacy.NDB.db[name:title()].city
  if not home then return end
  if home == "" then home = "divine" end
  local line = getCurrentLine()
  local i = 1
  while i > 0 do
    local p = selectString(name, i)
    if p > -1 then
      local x = line:sub(p + #name + 1, p + #name + 1) or "!"
      if x == "" or x:match("%A") then
       if Legacy.NDB.db[name:title()].color then
        fg(Legacy.NDB.db[name:title()].color)
       elseif Legacy.Settings.NDB.Config[home:lower()] then 
        fg(Legacy.Settings.NDB.Config[home:lower()].color)
        end
        
        if Legacy.NDB.db[name:title()].underline ~= nil then
          if Legacy.NDB.db[name:title()].underline or (Legacy.NDB.Enemies[name] and Legacy.NDB.db[name:title()].underline) then setUnderline(true) end
          if Legacy.NDB.db[name:title()].italics or (Legacy.NDB.Enemies[name] and Legacy.NDB.db[name:title()].italics) then setItalics(true) end
          if Legacy.NDB.db[name:title()].bold or (Legacy.NDB.Enemies[name] and Legacy.NDB.db[name:title()].bold) then  setBold(true) end
        else
          if Legacy.Settings.NDB.Config[home:lower()].underline or (Legacy.NDB.Enemies[name] and Legacy.Settings.NDB.Config.enemies.underline) then setUnderline(true) end
          if Legacy.Settings.NDB.Config[home:lower()].italics  or (Legacy.NDB.Enemies[name] and Legacy.Settings.NDB.Config.enemies.italics) then setItalics(true) end
          if Legacy.Settings.NDB.Config[home:lower()].bold or (Legacy.NDB.Enemies[name] and Legacy.Settings.NDB.Config.enemies.bold) then setBold(true) end
        end
        resetFormat()
      end
      deselect()
      i = i + 1
    else
      deselect()
      i = 0
    end
  end
end

function Legacy.NDB.color(person)
if Legacy.NDB.db[person] == nil then return "<DimGrey>"
else
return "<"..Legacy.Settings.NDB.Config[Legacy.NDB.db[person].city:lower()].color..">"
end
end


function Legacy.Settings.NDB.highlights()
  for k, v in pairs(Legacy.NDB.db) do
    local who = tostring(k):title()
    if not Legacy.Settings.NDB.tempHL[who] then
      Legacy.Settings.NDB.tempHL[who] = tempTrigger(who, [[Legacy.Settings.NDB.formatting("]] .. who .. [[")]])
    end
  end
end
  registerAnonymousEventHandler("LegacyLoaded", "Legacy.Settings.NDB.highlights")
  expandAlias("ndb")
  if Legacy.Settings.Curing.SS.Settings.batch == nil then  
    send("curing status")
  end
  if Legacy.Settings.Curing.status == false then
    send("curing on")
  end
  function downloaded_file(_, filename)
  -- is the file that downloaded ours?
  if filename:find("Legacy_Core.mpackage", 1, true) then
    Legacy.bigEcho("You just downloaded a new version of Legacy!\n Make sure you backup important files that will be overwritten. If you need a reminder of what these are please refer to the Legacy manual under UPDATING")
  end
  
  if filename:find("Announcement.lua", 1, true) then
  if Legacy.Announcement.ignore == true then return end
    if Legacy.Announcement.newMsg[1] == "" then
      tempTimer(10, [[Legacy.Announcement.display()]])
    end
    table.load(getMudletHomeDir().."/Legacy/Downloads/Announcement.lua", Legacy.Announcement.newMsg)
    tempTimer(5, [[os.remove(getMudletHomeDir().."/Legacy/Downloads/Announcement.lua")]])

    tempTimer(7, function() if Legacy.Announcement.newMsg[1] == Legacy.Announcement.msg[1] then else Legacy.Announcement.msg = table.deepcopy(Legacy.Announcement.newMsg) end end)

  end
  
  if filename:find("Legacy_Version_Info.lua", 1, true) then 
    table.load(getMudletHomeDir().."/Legacy/Downloads/Legacy_Version_Info.lua", Legacy.Vinfo)
    tempTimer(5, [[os.remove(getMudletHomeDir().."/Legacy/Downloads/Legacy_Version_Info.lua")]])
    local newestVersion = string.gsub(Legacy.Vinfo.Version, "%.", "")
    local currentVersion = string.gsub(Legacy.Version, "%.", "")
  
    if tonumber(newestVersion) > tonumber(currentVersion) and Legacy.Settings.ignoreUpdates == false then
      cechoLink("\n<white>[<gold>Legacy<white>]: "..Legacy.Vinfo.msg..Legacy.Vinfo.Version.."\n", function() installPackage(Legacy.Vinfo.link) Legacy.Version = Legacy.Vinfo.Version Download("Update") end, "Click here to Download AND install the newest version of Legacy!", true)
    end
  end
  
  if filename:find("Legacy_Extras.lua", 1, true) then
    Legacy.Extras = {}
    table.load(getMudletHomeDir().."/Legacy/Downloads/Legacy_Extras.lua", Legacy.Extras)
    tempTimer(5, [[os.remove(getMudletHomeDir().."/Legacy/Downloads/Legacy_Extras.lua")]])
  end
  
  if filename:find("Trades.mpackage", 1, true) then
    tempTimer(10, [[Trades_Setup()]])
  end
  
  if filename:find("Basher.mpackage", 1, true) then
    tempTimer(10, [[Basher_Setup()]])
  end
  
  if filename:find("Sailing.mpackage", 1, true) then
    tempTimer(10, [[Sailing_Setup()]])
  end
  
  if filename:find("Legacy UI.mpackage", 1, true) then
    tempTimer(10, [[UI_Setup()]])
  end
end


 function Legacy.Announcement.display()
  if Legacy.Announcement.ignore == true then return end
  if Legacy.Announcement.newMsg[1] == "" then return end
  cecho([[
  
  
  
  
  <gold>************************* <b><white>Legacy System Message</b><gold> *************************
  
  <ansi_white><b>]]..Legacy.Announcement.msg[1].."\n</b>"..[[
 
  <gold>************************* <b><white>Legacy System Message</b><gold> *************************
  
  
  
  
]])

 end




Legacy.Curing.preDraw()
-- register our function to run on the event that something was downloaded
registerAnonymousEventHandler("sysDownloadDone", "downloaded_file") 

Legacy_Downloads()
end

registerAnonymousEventHandler("LegacyLoaded", "LInit")
registerAnonymousEventHandler("update", "LInit")