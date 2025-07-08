if inking == false then return end
inking = false
tatQ = tatQ or {}
local tats2ignore = {"talon", "shield", "crystal", "tree", "chameleon", "hammer", "firefly", "tentacle", "web", "hourglass", "brazier" } 
--I hate that the list of ones you probably want to touch is shorter...and that I realized that now
if matches[2] then
if not table.contains(tats2ignore, matches[2]) then
  send("touch "..matches[2])
end
if #tatQ > 0 then
  Tats()
else
  send("curing on")
end
else
send("curing on")
end