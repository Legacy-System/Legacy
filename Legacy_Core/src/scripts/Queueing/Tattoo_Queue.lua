function Tats()
  tatQ = tatQ or {}
  if #tatQ > 0 then
    if inking == false then
      send("ink "..tatQ[1].." on me")
      inking = true
      table.remove(tatQ, 1)
    end
  end
end