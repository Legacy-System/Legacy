function Feedback(message)

  local msg = message 
  
  local httpdone = registerAnonymousEventHandler('sysPostHttpDone', 
    function(event, rurl, response)
      if rurl == url then display(r) else return true end
    end, true)

  local httperror = registerAnonymousEventHandler('sysPostHttpError', 
    function(event, response, rurl)
      if rurl == url then display(r) else return true end
    end, true)
   
  
  
  
  local url1 = "https://discord.com/api/webhooks/1342713339179958342/"
  local url2 = "FZTj3SZnXzRNUja-vxoa5yIYGx5j7NhV9oTiBKNSkVKGags5Pwo8C20-qKKi3pt0B2i3"
  local url  = url1..url2
  local data = {
    username = "Feedback",    
    content  = "``"..gmcp.Char.Status.name..": "..msg.."``\n" 
  }
  local header = {
    ["Content-Type"] = "application/json",
    --["Content-Length"] = data:len()
  }  
  postHTTP(yajl.to_string(data), url, header)
  
  killAnonymousEventHandler(httpdone)
  killAnonymousEventHandler(httperror)
end

