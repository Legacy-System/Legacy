--Sends QW for the corresponding city and enemies those listed.

if matches[2] == "ash" or matches[2] == "ashtan" then
enableTrigger("quick enemy")
send("qw ashtan")
elseif matches[2] == "mdor" or matches[2] == "mhaldor" then
enableTrigger("quick enemy")
send("qw mhaldor")
elseif matches[2] == "ele" or matches[2] == "eleusis" then
enableTrigger("quick enemy")
send("qw eleusis")
elseif matches[2] == "hash" or matches[2] == "hashan" then
enableTrigger("quick enemy")
send("qw hashan")
elseif matches[2] == "targ" or matches[2] == "targossas" then
enableTrigger("quick enemy")
send("qw targossas")
elseif matches[2] == "cy" or matches[2] == "cyrene" then
enableTrigger("quick enemy")
send("qw cyrene")
else
send("enemy "..matches[2])
end