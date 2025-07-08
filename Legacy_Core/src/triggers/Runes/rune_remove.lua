if Legacy then
if table.contains(Legacy.Runes.smudgelist, matches[2]:title()) then
  table.remove(Legacy.Runes.smudgelist, table.index_of(Legacy.Runes.smudgelist, matches[2]:title()))
end
end