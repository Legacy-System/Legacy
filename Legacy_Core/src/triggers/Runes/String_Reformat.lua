if Legacy then
local r = {
  ["like an open eye"] = {
    rune = "Wunjo", effect = "Cure blind"},
  ["that looks like a stick man"] = {
    rune = "Inguz", effect = "Paralysis"},
  ["shaped like a butterfly"] = {
    rune = "Nairat", effect = "Entangle"},
  ["like a closed eye"] = {
    rune = "Fehu", effect = function()
      if not fehu or fehu == 3 then fehu = 1 return "Strip insomnia"
      elseif fehu == 1 then fehu = 2 return "Sleep"
      elseif fehu == 2 then fehu = 3 return "Strip kola" end
    end
  },
  ["resembling a bell"] = {
    rune = "Mannaz", effect = "Cure deaf"},
  ["that looks like a nail"] = {
    rune = "Sowulu", effect = "Damage"},
  ["that looks like something out of your nightmares"] = {
    rune = "Kena", effect = "Fear"},
  ["shaped like a viper"] = {
    rune = "Sleizak", effect = "Voyria"},
  ["resembling an apple core"] = {
    rune = "Loshre", effect = "Anorexia"},
  ["resembling a square box"] = {
    rune = "Pithakhan", effect = "Drain mana"},
  ["like a lightning bolt"] = {
    rune = "Uruz", effect = "Heal"},
  ["resembling a leech"] = {
    rune = "Nauthiz", effect = "Hunger"},
  ["like an upward-pointing arrow"] = {
    rune = "Tiwaz", effect = "Defence strip"},
  ["shaped like a mighty oak"] = {
    rune = "Jera", effect = "+1 con and str"},
  ["resembling an elk"] = {
    rune = "Algiz", effect = "10% dmg reduction"},
  ["like a lion"] = {
    rune = "Berkana", effect = "lvl1 health regen"},
  ["resembling a horse"] = {
    rune = "Raido", effect = "Return location"},
  ["like a flurry of lightning bolts"] = {
    rune = "Isaz", effect = "Throws off balance"},
  ["like a rising sun"] = {
    rune = "Dagaz", effect = "Heals affs"},
  ["shaped like a yew"] = {
    rune = "Eihwaz", effect = "Removes vibes"},
  ["resembling a volcano"] = {
    rune = "Thurisaz", effect = "Hits a person"},
  ["resembling a mountain range"] = {
    rune = "Othala", effect = "Damage over time"},
}


for i = 1, #matches, 2 do
  local rune = matches[i+1]
  local line = matches[i]

  local pos = selectString(line, 1)
  moveCursor("main", pos+#line-1, getLineNumber())
  if r[rune] then
    if table.contains(Legacy.Runes.smudgelist, r[rune].rune) then
      --nothing
    else
      table.insert(Legacy.Runes.smudgelist, r[rune].rune)
    end
      Legacy.Runes.where = "ground"
      cinsertText(string.format(" <DimGrey>(<ansi_white>%s:<cyan> %s<DimGrey>)",
      r[rune].rune, type(r[rune].effect) == "function" and r[rune].effect() or r[rune].effect)) 
  else
    cinsertText(" <royal_blue>(<ansi_yellow>unknown!<royal_blue>)")
  end
end



deselect()
resetFormat()
moveCursorEnd()
end