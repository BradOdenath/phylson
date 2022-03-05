lua_functions = {
  table,
  string,
  coroutine
}

lua_functions = function()
  for _ in pairs(lua_functions) do
    for i,v in pairs(table) do
      print(i,v)
    end
  end
end

