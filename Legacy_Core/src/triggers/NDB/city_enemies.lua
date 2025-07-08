local gained = false
Legacy.NDB.cityEnemyCount = Legacy.NDB.cityEnemyCount or 0
if multimatches[2][1]:find("Enemies of") and (multimatches[2][1]:find("of Targossas") or multimatches[2][1]:find("of Mhaldor") or multimatches[2][1]:find("of Hashan") or multimatches[2][1]:find("of Cyrene") or multimatches[2][1]:find("of Ashtan") or multimatches[2][1]:find("of Eleusis")) then
  Legacy.NDB.Enemies = {}
  for _, n in pairs(string.split(multimatches[4][1], ",")) do
    Legacy.NDB.Enemies[n:trim()] = true
  end
  if Legacy.NDB.cityEnemyCount then
    if tonumber(multimatches[6][2]) > Legacy.NDB.cityEnemyCount then
        gained = true
       enemydiff = math.abs(tonumber(Legacy.NDB.cityEnemyCount) - tonumber(multimatches[6][2]))
    else
      gained = false
       enemydiff = math.abs(tonumber(multimatches[6][2])- tonumber(Legacy.NDB.cityEnemyCount))
    end
  end
  Legacy.NDB.cityEnemyCount = tonumber(multimatches[6][2])
  echo("\n")
  
  if enemydiff then
    cecho("<white>[<gold>Legacy<white>]: City Enemies Updated. ")
    if gained == true and enemydiff ~= 0 then 
      cecho("<DimGray>(<orange>+"..enemydiff.."<DimGray>)") 
    elseif gained == false and enemydiff ~= 0 then
       local unenemied = {}
      for k,v in pairs(Legacy.NDB.oldEnemies) do
        if not table.contains(Legacy.NDB.Enemies, k) then
          table.insert(unenemied, "<orange>"..k)
        end
      end
      cecho("<DimGray>(<orange>-"..enemydiff.."<DimGray>)")
      Legacy.echo("Unenemied: "..table.concat(unenemied, "<white>, ")..".")
      --Legacy.NDB.oldEnemies = nil
    else
      cecho("<orange>No new Enemies.")
   end
    Legacy.NDB.oldEnemies = table.deepcopy(Legacy.NDB.Enemies)
  end
end