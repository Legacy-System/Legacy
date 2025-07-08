local date = matches[2]
local name = matches[3]
local crime = matches[4]
local fine = matches[5]
local term = matches[6]


IHateMathSoIWroteThis.fines = tonumber(IHateMathSoIWroteThis.fines) + tonumber(fine)

if tonumber(date) == IHateMathSoIWroteThis.newestDate then
  IHateMathSoIWroteThis.term = tonumber(IHateMathSoIWroteThis.term) + tonumber(term)
else
  IHateMathSoIWroteThis.term = tonumber(term)
end
IHateMathSoIWroteThis.newestDate = tonumber(date)
