Legacy.NDB.qwhom = {}

if not matches[2] then
restrictSearch = nil 
elseif string.len(matches[2]) > 1 then
restrictSearch = string.title(matches[2])
else 
restrictSearch = nil
end

enableTrigger("Catchall Names")
enableTrigger("Qwhom Display")
send("config pagelength 250")
send("queue add free who b", false)