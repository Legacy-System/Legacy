function multicmd(arg)
  if arg ~= nil then
    multiQ = multiQ or {}
    table.insert(multiQ, arg)
  else
    for k,v in pairs(multiQ) do
      send("queue add free "..v)
    end
    multiQ = {}
  end
end