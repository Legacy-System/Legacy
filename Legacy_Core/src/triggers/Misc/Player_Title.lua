
for k, v in pairs(Legacy.NDB.db) do
  if v.title == matches[2] then
  local start = math.floor(15 - #k)
  local i = 0
    deleteLine()
    cecho("\n"..Legacy.NDB.color(k)..k.." ")
    while i < start do
      echo(" ")
      i = i + 1
    end
    cecho("<DimGrey>(<gold>"..v.class.."<DimGrey>)")
  end
end