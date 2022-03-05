lua_language = {
  table,
  string,
  coroutine
}

lua_functions = function()
  for __, _ in pairs(lua_language) do
    for i, v in pairs(_) do
      print(tostring(_),i,v)
    end
  end
end

main = function() lua_functions() end main()