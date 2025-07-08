function Legacy_Downloads()

    Legacy.Vinfo = {Version = "", msg = ""}
    Legacy.Extras = Legacy.Extras or {}
    downloadFile(getMudletHomeDir().."/Legacy/Downloads/Legacy_Version_Info.lua", "https://github.com/AranosBanazir/Legacy/raw/main/Legacy_Version_Info.lua")
    downloadFile(getMudletHomeDir().."/Legacy/Downloads/Legacy_Extras.lua", "https://github.com/AranosBanazir/Legacy/raw/main/Legacy_Extras.lua")
    downloadFile(getMudletHomeDir().."/Legacy/Downloads/Announcement.lua", "https://github.com/AranosBanazir/Legacy/raw/main/Announcement.lua")
end
registerAnonymousEventHandler("CheckForUpdates", "Legacy_Downloads")
registerAnonymousEventHandler("LegacyLoaded", "Legacy_Downloads")

function Download(var)
  if var == "Fresh" then
    downloadmsg = "Has downloaded Legacy V"..Legacy.Version.." for the first time."
  elseif var == "Update" then
    downloadmsg = "Has updated to Legacy V"..Legacy.Version.."!"
  end 
  
  local httpdone = registerAnonymousEventHandler('sysPostHttpDone', 
    function(event, rurl, response)
      if rurl == url then display(r) else return true end
    end, true)

  local httperror = registerAnonymousEventHandler('sysPostHttpError', 
    function(event, response, rurl)
      if rurl == url then display(r) else return true end
    end, true)
   
  
  
  
  local url1  = "https://discord.com/api/webhooks/1342716549970264075"
  local url2 = "/tgBAvNIlK144DrAm920N26R_vRO64JnPZyvLKJUQH9VGBtrpsgl8YTZ7hg0JCuinFd08"
  local url  = url1..url2
  local data = {
    username = "Legacy",    
    content  = "``"..gmcp.Char.Status.name.." "..downloadmsg.."``\n" 
  }
  local header = {
    ["Content-Type"] = "application/json",
    --["Content-Length"] = data:len()
  }  
  postHTTP(yajl.to_string(data), url, header)
  
  killAnonymousEventHandler(httpdone)
  killAnonymousEventHandler(httperror)
  downloadmsg = nil
end