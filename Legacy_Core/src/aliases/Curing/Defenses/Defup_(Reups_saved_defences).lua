  local allList = "curing priority defense "
  local ignoreddefs = {"ironform", "insufflate", "incandescence", "hyperfocus", "heads", "haste", "frenzied", "firefly", "extispicy", "enhancedform", "eavesdropping", "eaglelegend",
                      "dustform", "demonfury", "deliverance", "chameleon", "brains", "blunder", "blocking", "blessingofthegods", "blackboarlegend", "battlesong", "arctar", "amamaalierlegend",
                      "alligatorlegend", "aiming", "agithtailegend", "lifebond", "lifegiver", "lifesteal", "maticlegend", "morph", "nicatorlegend", "phased", "preachblessing", "prismatic", 
                      "promosurcoat", "scholasticism", "seasonelegend", "setweapon", "shikudoform", "shinrejoinder", "spinning", "spiritwalk", "starburst", "sympathy", "tekurastance", "tongues",
                      "tumors", "twoartsstance", "unnamablepresence", "venomsacks", "viridian", "weakvigour", "wolflegend", "xporb"}

Defup()


  send("remove armour")
  send("queue add free wear "..Armour())
  if (table.contains(Legacy.Curing.Defs[Legacy.Curing.Defs.currentset].defences, "starburst") or table.contains(Legacy.Curing.Defs[Legacy.Curing.Defs.currentset].keepup, "starburst")) and not table.contains(Legacy.Curing.Defs.current, "starburst") then
    send("curing off")
    send("queue add free ink starburst on me")
  end
  Legacy.echo("Restored '<gold>"..Legacy.Curing.Defs.currentset.."<white>' Defense Prios.") 