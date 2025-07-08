deleteFull()
local str = matches[2].." "..matches[3]
local name_table = string.split(str, ", ")

--clearing the lust list
Legacy.Curing.Lust.whiteList = {}
  
  --building the list off of the trigger
  for _,v in pairs(name_table) do
    table.insert(Legacy.Curing.Lust.whiteList, v)
  end
  
  --printing the list with colors
  cecho('\n<green><b>People in your Lust Whitelist:\n')
  for k,v in pairs(Legacy.Curing.Lust.whiteList) do
    cecho("\n<DimGrey>-- "..Legacy.NDB.color(v)..v)
  end