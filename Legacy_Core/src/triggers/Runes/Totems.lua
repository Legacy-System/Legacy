if Legacy then
local rune = multimatches[2][2]
Legacy.Runes = Legacy.Runes or {}
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
    rune = "Tiwaz", effect = "Defence strip"}
}



echo(string.rep(" ", 60-#multimatches[2][1]))
deleteFull()
if r[rune] then
  if table.contains(Legacy.Runes.smudgelist, r[rune].rune) and r[rune].rune ~= "Fehu" then
      --nothing
    else
      table.insert(Legacy.Runes.smudgelist, r[rune].rune)
    end
  local slot = multimatches[2][3]
  cechoLink("\nSlot:<white>(<cyan>"..multimatches[2][3].."<white>) ", function() send("queue addclear free smudge totem slot "..slot) end, "Smudge the rune",true ) 
  cecho(string.format("<white>(<gold>%s: <cyan>%s<white>)",
    r[rune].rune, type(r[rune].effect) == "function" and r[rune].effect() or r[rune].effect))
else
  cecho(" <red>(<ansi_yellow>unknown!<red)")
end
end