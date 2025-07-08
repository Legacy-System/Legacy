function isTrueCall(where, who, what)


local text = gmcp.Comm.Channel.Text.text or ""
local caller = gmcp.Comm.Channel.Text.talker or ""
local channel = gmcp.Comm.Channel.Text.channel or ""

  if text == nil then 
    return false 
  elseif text ~= nil then
    if who == caller and where == channel and text:match(what) then
    return true
    end
  end
end
