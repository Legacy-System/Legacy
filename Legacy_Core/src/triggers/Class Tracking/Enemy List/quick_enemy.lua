local str = matches[2].." "..matches[3]

local name_table = string.split(str, ", ")
send("unenemy all")
for _,v in pairs(name_table) do
  send("enemy "..v)
end

disableTrigger("quick enemy")