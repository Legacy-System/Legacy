function LegacyAffPrompt()
if Legacy then
if DelLPrompt then return "" end
--*******************************************
--| Credit for these Tables goes to Romaen  |
--*******************************************


Legacy.Settings.Curing.IgnoredAffs = {"blindness", "deafness", "insomnia"}

Legacy.Curing.cures = {
  kelp = {"asthma", "clumsiness", "hypochondria", "sensitivity", "weariness", "healthleech", "parasite", "rebbies"},
  lobelia = {"agoraphobia", "guilt", "spiritburn", "tenderskin", "claustrophobia", "loneliness", "masochism", "recklessness", "vertigo"},
  ash = {"confusion", "dementia", "hallucinations", "hypersomnia", "paranoia"},
  bellwort = {"retribution","timeloop", "peace","justice","lovers"},
  goldenseal = {"dizziness", "epilepsy", "impatience", "shyness", "stupidity", "depression", "shadowmadness", "mycalium", "sandfever", "horror"},
  bloodroot = {"paralysis", "slickness", "pyramides"},
  ginseng = {"addiction", "darkshade", "haemophilia", "lethargy", "nausea", "scytherus", "flushings"},
  pear = {"pressure"},
}

Legacy.Curing.abbreviations = {
  ensorcelled = "<medium_blue>ENS",
  sandfever = "SAND",
  mycalium = "myc",
  flushings = "fls",
  rebbies = "reb",
  pyramides = "PYR",
  addiction = "ADD",
  aeon = "AEON",
  agoraphobia = "ago",
  airfisted = "airf",
  amnesia = "amns",
  anorexia = "ANO",
  asphyxiating = "asph",
  asthma = "AST",
  blackout = "BLCK",
  blindness = "blnd",
  blistered = "blst",
  bloodfire = "bldfr",
  bound = "bnd",
  brokenleftarm = "la1",
  brokenleftleg = "ll1",
  brokenrightarm = "ra1",
  brokenrightleg = "rl1",
  bruisedribs = "Bribs",
  burning = "ablaze",
  cadmuscurse = "cadmus",
  calcifiedskull = "CAL-SKLL",
  calcifiedtorso = "CAL-TT",
  claustrophobia = "claus",
  clumsiness = "clum",
  coldfate = "cfate",
  concussion = "conc",
  conflagration = "cnflg",
  confusion = "conf",
  corruption = "corr",
  crackedribs = "crr",
  cremated = "crem",
  crushedthroat = "CRTHROAT",
  daeggerimpale = "DAEG-IMP",
  damagedhead = "H2",
  damagedleftarm = "LA2",
  damagedleftleg = "LL2",
  damagedrightarm = "RA2",
  damagedrightleg = "RL2",
  darkshade = "DARK",
  dazed = "daze",
  dazzled = "dazz",
  deadening = "ddn",
  deafness = "deaf",
  deepsleep = "dsleep",
  degenerate = "dgen",
  dehydrated = "dhydr",
  dementia = "dem",
  demonstain = "dstain",
  depression = "depr",
  deteriorate = "det",
  disloyalty = "disl",
  disrupted = "<turquoise>DISR",
  dissonance = "diss",
  dizziness = "dizz",
  enlightenment = "<red>ENL",
  enmesh = "enms",
  entangled = "entg",
  entropy = "entr",
  epilepsy = "epi",
  fear = "fear",
  flamefisted = "ffst",
  frozen = "froz",
  generosity = "gene",
  grievouswounds = "gwnd",
  guilt = "GUI",
  haemophilia = "haem",
  hallucinations = "hall",
  hamstrung = "HAMS",
  hatred = "hatr",
  healthleech = "hlch",
  heartseed = "HSEED",
  hecatecurse = "HECATE",
  hellsight = "HELL",
  hindered = "hind",
  homunculusmercury = "hmrc",
  horror = "hor",
  hypersomnia = "hsomn",
  hypochondria = "hchon",
  hypothermia = "hthm",
  icefisted = "icef",
  impaled = "IMPALED",
  impatience = "IMP",
  indifference = "ind",
  inquisition = "INQ",
  insomnia = "inso",
  internalbleeding = "IBLD",
  isolation = "isol",
  itching = "itch",
  justice = "just",
  kaisurge = "ksrg",
  kkractlebrand = "kkbr",
  laceratedthroat = "lthr",
  lapsingconsciousness = "lconsc",
  latched = "LATCH",
  lethargy = "leth",
  lightbind = "lbind",
  loneliness = "lone",
  lovers = "lovers",
  manaleech = "mleech",
  mangledhead = "H3",
  mangledleftarm = "LA3",
  mangledleftleg = "LL3",
  mangledrightarm = "RA3",
  mangledrightleg = "RL3",
  masochism = "maso",
  mildtrauma = "tt1",
  mindclamp = "mclamp",
  mindravaged = "mrav",
  muddled = "mudd",
  nausea = "naus",
  numbedleftarm = "num-la",
  numbedrightarm = "num-ra",
  pacified = "PACI",
  palpatarfeed = "ppfd",
  paralysis = "PAR",
  paranoia = "prna",
  parasite = "prst",
  peace = "PEACE",
  penitence = "ptc",
  petrified = "ptri",
  phlogisticated = "phlog",
  pinshot = "PSHOT",
  pressure = "pres",
  prone = "prone",
  recklessness = "rek",
  retardation  = "RET",
  retribution = "retr",
  revealed = "rev",
  scalded = "scal",
  scrambledbrains = "sbrain",
  scytherus = "SCYT",
  selarnia = "sela",
  sensitivity = "SENS",
  serioustrauma = "TT2",
  shadowmadness = "SMAD",
  shivering = "shiv",
  shyness = "shy",
  silenced = "silnt",
  silver = "silv",
  skullfractures = "sfrac",
  slashedthroat = "sthrt",
  sleeping = "asleep",
  slickness = "SLCK",
  slimeobscure = "sbs",
  solarburn = "solb",
  spiritburn = "sbn",
  stupidity = "STUP",
  stuttering = "stut",
  temperedcholeric = "tchol",
  temperedmelancholic = "tmel",
  temperedphlegmatic = "tphleg",
  temperedsanguine = "tsang",
  tenderskin = "tsn",
  tension = "tens",
  timeflux = "tflux",
  timeloop = "TLOOP",
  tonguetied = "ttied",
  torntendons = "tend",
  transfixation = "TFIX",
  trueblind = "TBLND",
  unconsciousness = "unconc",
  unweavingbody = "UwBody",
  unweavingmind = "UwMind",
  unweavingspirit = "UwSPIR",
  vertigo = "vert",
  vinewreathed = "vwrth",
  vitiated = "viti",
  vitrified = "vitri",
  voidfisted = "vfist",
  voyria = "VOYR",
  waterbonds = "wbond",
  weakenedmind = "wmind",
  weariness = "wear",
  webbed = "webbed",
  whisperingmadness = "wmad",
  wristfractures = "WFRAC",
  pacifism = 'PEACE',
  prone = '<hot_pink>PR',
  
  --locks
  softlocked = "<magenta>SOFTLOCKED",
  truelocked = "<magenta>TRUELOCKED",
}

--Change these to color certain cures.
Legacy.Settings.Curing.colors = {
  kelp = 'forest_green',
  lobelia = 'light_slate_blue',
  ash = 'tan',
  bellwort = 'deep_sky_blue',
  goldenseal = 'gold',
  bloodroot = 'red',
  ginseng = 'orange',
  pear = 'medium_sea_green'
}

Legacy.Curing.stackables = {
  temperedsanguine = 'sangu',
  temperedcholeric = 'choler',
  temperedphlegmatic = 'phleg',
  temperedmelancholic = 'melan',
  unweavingbody = "uwBody",
  unweavingspirit = "uwSpirit",
  unweavingmind = "uwMind",
  torntendons = "ttend",
  wristfractures = "wfrac",
  skullfractures = "sfrac",
  crackedribs = "cribs",
  burning = "burn",
}
  
  local ret = {}
  local used = {}
  local x

  
  for a, _ in pairs(Legacy.Curing.Affs) do 
    if Legacy.Curing.abbreviations[a] and tonumber(Legacy.Curing.abbreviations[a]:sub(-1)) and not table.contains(Legacy.Settings.Curing.IgnoredAffs, a) then
      table.insert(ret, "<yellow>" .. Legacy.Curing.abbreviations[a])
      used[a] = true
    end
  end
  
  for a in pairs(Legacy.Curing.Affs) do
    if a:match("%a+ %(%d+%)") then
      table.insert(ret, "<tomato>" .. (Legacy.Curing.stackables[a:match("(%a+)")] or a:match("(%a+)")) .. "<orange>(" .. a:match("%((%d+)%)") .. ")")
      used[a] = true
    end
  end
  
  for c, t in pairs(Legacy.Curing.cures) do
    x = Legacy.Settings.Curing.colors[c] or "white"
    for _, a in pairs(t) do 
      if Legacy.Curing.Affs[a] and not used[a] then
        table.insert(ret, "<" .. x .. ">" .. (Legacy.Curing.abbreviations[a] or a))
        used[a] = true
      end
    end
  end
  
  for a in pairs(Legacy.Curing.Affs) do
    if not used[a] then
      table.insert(ret, "<white>" .. (Legacy.Curing.abbreviations[a] or a:sub(1, 4)))
      used[a] = true
    end
  end
  
  if #ret == 0 then
    return ""
  else
    return "<white>[" .. table.concat(ret, " ") .. "<white>] "
  end
end
end