function ChatBoxMessages()
if Legacy == nil then return end
if Legacy.Settings.UI.Chatbox.ignoreMobs and Legacy.NDB.db[gmcp.Comm.Channel.Text.talker:title()] == nil  and gmcp.Comm.Channel.Text.talker:title() ~= "You" then return end
local msg = ansi2decho(gmcp.Comm.Channel.Text.text) 
--gmcp.Comm.Channel.Text.text:gsub("%\27%[[%dl;]+m", "")
local channel = gmcp.Comm.Channel.Text.channel
  
  if msg:match("says to you") then
    Legacy.UI.Chatbox.Direct:decho(msg.."\n")
  end
  
  if channel:match("clt") then
    Legacy.UI.Chatbox.All:decho(msg.."\n")
    Legacy.UI.Chatbox.Clans:decho(msg.."\n")
    Legacy.UI.Chatbox.Clanstab:flash(1)
    tempTimer(2, [[Legacy.UI.Chatbox.Clanstab:flash(1)]])
    tempTimer(4, [[Legacy.UI.Chatbox.Clanstab:flash(1)]])
  elseif channel == "says" then
   Legacy.UI.Chatbox.All:decho(msg.."\n")
   Legacy.UI.Chatbox.Says:decho(msg.."\n")
   Legacy.UI.Chatbox.Saystab:flash(1)
   tempTimer(2, [[Legacy.UI.Chatbox.Saystab:flash(1)]])
   tempTimer(4, [[Legacy.UI.Chatbox.Saystab:flash(1)]])
  elseif channel == "party" then
    Legacy.UI.Chatbox.All:decho(msg.."\n")
    Legacy.UI.Chatbox.Party:decho(msg.."\n")
  elseif channel:match("tell") then
    if channel == "armytell" then
      Legacy.UI.Chatbox.All:decho(msg.."\n")
    else
      Legacy.UI.Chatbox.Tells:decho(msg.."\n")
      Legacy.UI.Chatbox.All:decho(msg.."\n")
      Legacy.UI.Chatbox.Tellstab:flash(1)
      tempTimer(2, [[Legacy.UI.Chatbox.Tellstab:flash(1)]])
      tempTimer(4, [[Legacy.UI.Chatbox.Tellstab:flash(1)]])
    end
  elseif channel == "ct" then
    Legacy.UI.Chatbox.City:decho(msg.."\n")
    Legacy.UI.Chatbox.All:decho(msg.."\n")
    Legacy.UI.Chatbox.Citytab:flash(1)
    tempTimer(2, [[Legacy.UI.Chatbox.Citytab:flash(1)]])
    tempTimer(4, [[Legacy.UI.Chatbox.Citytab:flash(1)]])
  elseif channel == "market" then
    Legacy.UI.Chatbox.Market:decho(msg.."\n")
    Legacy.UI.Chatbox.Markettab:flash(1)
    tempTimer(2, [[Legacy.UI.Chatbox.Markettab:flash(1)]])
    tempTimer(4, [[Legacy.UI.Chatbox.Markettab:flash(1)]])
    Legacy.UI.Chatbox.All:decho(msg.."\n")

  elseif channel == "ht" or channel == "hts" or channel == "hnt" then
    Legacy.UI.Chatbox.House:decho(msg.."\n")
    Legacy.UI.Chatbox.All:decho(msg.."\n")
    Legacy.UI.Chatbox.Housetab:flash(1)
    tempTimer(2, [[Legacy.UI.Chatbox.Housetab:flash(1)]])
    tempTimer(4, [[Legacy.UI.Chatbox.Housetab:flash(1)]])

  elseif channel == "newbie" then
    Legacy.UI.Chatbox.Newbie:decho(msg.."\n")
    Legacy.UI.Chatbox.All:decho(msg.."\n")
    Legacy.UI.Chatbox.Newbietab:flash(1)
    tempTimer(2, [[Legacy.UI.Chatbox.Newbietab:flash(1)]])
    tempTimer(4, [[Legacy.UI.Chatbox.Newbietab:flash(1)]])
  else
    Legacy.UI.Chatbox.All:decho(msg.."\n")
  end    
end
registerAnonymousEventHandler("gmcp.Comm.Channel.Text", "ChatBoxMessages")