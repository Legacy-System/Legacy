function math.reint(i)
  return tostring(i):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end