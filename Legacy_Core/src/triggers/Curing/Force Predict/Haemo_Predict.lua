if failedClotCount == nil then
  failedClotCount = 1
end
  failedClotCount = failedClotCount + 1
  
  if failedClotCount >=3 then
    send("curing predict haemophilia")
    failedClotCount = 0
  end
  
deleteFull()