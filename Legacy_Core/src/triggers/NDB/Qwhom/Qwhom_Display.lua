deleteLine()


-- Function to convert associative array to indexed array for sorting
local function associativeToIndexed(tbl)
  local indexedTable = {}
  for k in pairs(tbl) do
    table.insert(indexedTable, k)
  end
  table.sort(indexedTable)
  return indexedTable
end

local sortedAreaKeys = associativeToIndexed(Legacy.NDB.qwhom)

for _, area in ipairs(sortedAreaKeys) do
  local areaData = Legacy.NDB.qwhom[area]
  if table.size(areaData) > 0 then
    if restrictSearch ~= nil then
      restrictSearch = string.title(restrictSearch)
      if string.match(area, restrictSearch) then
        cecho("\n<ansi_yellow>[<DodgerBlue>"..area.."<ansi_yellow>]: ")

        local sortedWhereKeys = associativeToIndexed(areaData)
        for _, where in ipairs(sortedWhereKeys) do
          local whereData = areaData[where]
          cecho("\n\t<ansi_yellow>[<linen>"..where.."<ansi_yellow>] (<white>"..table.size(whereData).."<ansi_yellow>): "..table.concat(whereData, "<white>,<ansi_yellow> "))

          -- Add a link to the 'where' location
          if where ~= "Gemmed" then
            mmp.locateAndEchoSide(where)
          end
        end
      end
    else
      if area ~= "Unknown" then
        cecho("\n<ansi_yellow>[<DodgerBlue>"..area.."<ansi_yellow>]: ")

        local sortedWhereKeys = associativeToIndexed(areaData)
        for _, where in ipairs(sortedWhereKeys) do
          local whereData = areaData[where]
          cecho("\n\t<ansi_yellow>[<linen>"..where.."<ansi_yellow>] (<white>"..table.size(whereData).."<ansi_yellow>): "..table.concat(whereData, "<white>,<ansi_yellow> "))

          -- Add a link to the 'where' location
          if where ~= "Gemmed" then
            mmp.locateAndEchoSide(where, who, area)
          end
        end
      end
    end
  end
end

  disableTrigger("Catchall Names")
  disableTrigger("Qwhom Prompt Gate")
  disableTrigger("Qwhom Display")

send("config pagelength 40")