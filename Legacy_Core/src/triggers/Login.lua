enableTimer("Double checking everything is loaded")
disableTrigger("Alertness (Achaea+Imperian)")
sendGMCP([[Core.Supports.Add ["Comm.Channel 1"]])
sendGMCP([[Core.Supports.Add ["IRE.Target 1"] ]])
sendGMCP([[Core.Supports.Add ["IRE.Rift 1"]   ]])
sendGMCP([[Core.Supports.Add ["IRE.Time 1"] ]])
leaving = false
send("curing off")
send("queue add freestand touch mindseye")
tempTimer(3, [[send("queue add freestand ql")]])
tempTimer(4, [[raiseEvent("LoggedIn")]])
tempTimer(8, [[send("queue add freestand curing on")]])
send("date")
--Sets default config options
sendAll(
"config screenwidth 0", 
"config showqueuealerts on", 
"config killwarning off",
"config AutoOpenDoors on",
"config advancedcuring on",
"config UniversalAfflictionMessages on")
delLprompt = false
Defup()