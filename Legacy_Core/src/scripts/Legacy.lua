function Legacy_Load()
    if not (gmcp.Char and gmcp.Room ) then
        tempTimer(2, [[Legacy_Load()]])
      return
    end
  if io.exists(getMudletHomeDir().."/Legacy/Legacy.lua") then
    Legacy = Legacy or {}
    Legacy[gmcp.Char.Status.name] = {}
    Legacy.Rift = Legacy.Rift or {}
    Legacy.CT = Legacy.CT or {}
    Legacy.CT.timers = {}
    Legacy.Curing = Legacy.Curing or {}
    Legacy.NDB = Legacy.NDB or {}
    Legacy.NDB.Hidden = {}
    Legacy.Runes = Legacy.Runes or {}
    Legacy.Runes.smudgelist = Legacy.Runes.smudgelist or {}
    Legacy.Room = Legacy.Room or {}
    Legacy.Q = Legacy.Q or {}
    Legacy.Curing.Prios = Legacy.Curing.Prios or {}
    Legacy.Curing.Affs = {}
    Legacy.Curing.Defs = Legacy.Curing.Defs or {}
    Legacy.Curing.Defs.tracking = {}
    Legacy.Curing.Defs.current = {}
    Legacy.CT.Enemies = Legacy.CT.Enemies or {}
    Legacy.CT.StaticAllies = Legacy.CT.StaticAllies or {}
    Legacy.CT.StaticEnemies = Legacy.CT.StaticEnemies or {}
    Legacy.CT.timers = {}
    --NDB
    Legacy.NDB.db = Legacy.NDB.db or {}
    Legacy.NDB.Enemies = Legacy.NDB.Enemies or {}
    Legacy.NDB.qwhom = Legacy.NDB.qwhom or {}
    Legacy.Settings = Legacy.Settings or {}
    Legacy.Settings.Curing = Legacy.Settings.Curing or {}
    Legacy.Settings.Curing.SS = Legacy.Settings.Curing.SS or {}
    Legacy.Settings.NDB = Legacy.Settings.NDB or {}
    lfs.mkdir(getMudletHomeDir().. "/Legacy")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB/Characters")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/Downloads")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/ClassTrack")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/Fight Logs")

    --Curing
    Legacy.Settings.Curing.precacheCount = 1 -- number of curatives to remove on eat
    Legacy.Settings.Curing.SS.Settings = Legacy.Settings.Curing.SS.Settings or {}
    Legacy.Curing.Lust = Legacy.Curing.Lust or {}
    Legacy.Curing.Defs.currentset = Legacy.Curing.Defs.currentset or "legacy"
    tempTimer(6,[[cecho("\n<white>[<gold>Legacy<white>]:<white> Welcome back "..gmcp.Char.Status.name.."!")]])
    table.load(getMudletHomeDir().."/Legacy/Legacy.lua", Legacy)
    Legacy.Settings.NDB.tempHL = {}
    raiseEvent("LegacyLoaded")
  else
    Legacy = Legacy or {}
    Legacy.Vinfo = {Version = "", msg = "", link = ""}
    Legacy.Version = "0.8"
    Legacy.Extras = Legacy.Extras or {}
    Legacy[gmcp.Char.Status.name] = {}
    Legacy.Rift = Legacy.Rift or {}
    Legacy.CT = Legacy.CT or {}
    Legacy.Curing = Legacy.Curing or {}
    Legacy.NDB = Legacy.NDB or {}
    Legacy.NDB.Hidden = {}
    Legacy.Runes = Legacy.Runes or {}
    Legacy.Runes.smudgelist = Legacy.Runes.smudgelist or {}
    Legacy.Room = Legacy.Room or {}
    Legacy.Q = Legacy.Q or {}
    Legacy.Curing.Prios = Legacy.Curing.Prios or {}
    Legacy.Curing.Affs = {}
    Legacy.Curing.Defs = Legacy.Curing.Defs or {}
    Legacy.CT.Enemies = Legacy.CT.Enemies or {}
    Legacy.CT.StaticAllies = Legacy.CT.StaticAllies or {}
    Legacy.CT.StaticEnemies = Legacy.CT.StaticEnemies or {}
    Legacy.CT.timers = {}
    --NDB
    Legacy.NDB.db = Legacy.NDB.db or {}
    Legacy.NDB.Enemies = Legacy.NDB.Enemies or {}
    Legacy.NDB.qwhom = Legacy.NDB.qwhom or {}
    Legacy.Curing.Defs.currentset = Legacy.Curing.Defs.currentset or "legacy"
    Legacy.Curing.Defs.tracking = {}
    Legacy.Curing.Defs.current = {}
    Legacy.Settings = Legacy.Settings or {}
    Legacy.Settings.Curing = Legacy.Settings.Curing or {}
    Legacy.Settings.Curing.SS = Legacy.Settings.Curing.SS or {}
    Legacy.Settings.NDB = Legacy.Settings.NDB or {}
    --Curing
    Legacy.Settings.Curing.precacheCount = 1 -- number of curatives to remove on eat
    Legacy.Settings.Curing.SS.Settings = Legacy.Settings.Curing.SS.Settings or {}
    Legacy.Curing.Lust = Legacy.Curing.Lust or {}
    lfs.mkdir(getMudletHomeDir().. "/Legacy")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/NDB/Characters")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/Downloads")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/ClassTrack")
    lfs.mkdir(getMudletHomeDir().. "/Legacy/Fight Logs")
    tempTimer(5, [[cecho("\n<red>Failed to Load Legacy Settings.")]])
    tempTimer(6 ,[[cecho("\n<green>Legacy Files Created At: \n<white>"..getMudletHomeDir().."/Legacy")]])
    table.save(getMudletHomeDir().."/Legacy/Legacy.lua", Legacy)
    sendAll("Curingset new legacy", "curingset switch legacy")
    raiseEvent("LegacyLoaded")
    Download("Fresh")
  end
end

registerAnonymousEventHandler("LoggedIn", "Legacy_Load")


