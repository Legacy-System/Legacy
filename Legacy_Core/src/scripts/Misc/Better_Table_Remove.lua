function table.bremove(tbl, what)
  if table.contains(tbl, what) then
    table.remove(tbl, table.index_of(tbl, what))
  end
end