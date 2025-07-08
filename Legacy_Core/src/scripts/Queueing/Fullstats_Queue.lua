function fullstats(arg)

  if arg ~= nil then
   Legacy.Settings.Curing.SS.savedHealthPercent = Legacy.Settings.Curing.SS.Settings.sipHealth
   Legacy.Settings.Curing.SS.savedManaPercent   = Legacy.Settings.Curing.SS.Settings.sipMana
    --Make a table of stats
    statsQueue = statsQueue or {}
    --Push argument into this table
    table.insert(statsQueue, arg)
      send("curing sipmana 99")
      send("curing siphealth 99")
      fullstats()
  else

    if Legacy[gmcp.Char.Status.name].Vitals.hpPer >= 100 and Legacy[gmcp.Char.Status.name].Vitals.mpPer >= 100 then
      send("queue addclear free " .. statsQueue[1])
      
      tempTimer(4, function() send("curing sipmana "..Legacy.Settings.Curing.SS.savedManaPercent)
      send("curing siphealth "..Legacy.Settings.Curing.SS.savedHealthPercent)end)
      table.remove(statsQueue, 1)
    else
      if Legacy[gmcp.Char.Status.name].Vitals.mpPer == 99 and Legacy.Curing.bal.sip then
        send("sip mana")
      elseif Legacy[gmcp.Char.Status.name].Vitals.hpPer == 99 and Legacy.Curing.bal.sip then
        send("sip health")
      end
      tempTimer(1, [[fullstats()]])
    end
  end
end