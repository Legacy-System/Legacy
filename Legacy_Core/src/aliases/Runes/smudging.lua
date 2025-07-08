if Legacy[gmcp.Char.Status.name].class == "Runewarden" or Legacy[gmcp.Char.Status.name].class == "Shaman" then
  if table.size(Legacy.Runes.smudgelist) > 0 then
    if Legacy.Runes.where == "Totem" then
      send("queue addclear free smudge totem ")
    else
      send("queue addclear free smudge ground "..Legacy.Runes.smudgelist[1])
    end
  end
end