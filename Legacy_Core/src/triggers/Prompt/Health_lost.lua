if Legacy.Settings.Prompt.vitalsChange ~= true then return end
if tonumber(matches[2]) < 100 then return end
table.insert(Legacy.Settings.Prompt.damageTracking, matches[2]..' '..matches[3])
enableTrigger('Health Lost Gate')