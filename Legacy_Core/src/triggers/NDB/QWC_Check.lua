local str = matches[2].." "..matches[3]
local name_table = string.split(str, ", ")
Legacy.NDB.awake = {}

for _,v in pairs(name_table) do
  table.insert(Legacy.NDB.awake, v)
  if Legacy.NDB.db[v] == nil then
    Legacy.NDB.lookup(v)
  end
end
disableTrigger("QWC Check")