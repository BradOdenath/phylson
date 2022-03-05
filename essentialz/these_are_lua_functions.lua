lua_language = {
  table = table;
  string = string;
  coroutine = coroutine
}


lua_functions = function()
  for __, _ in pairs(lua_language) do
    for i, v in pairs(_) do
      print(__..'\t\t\t'..i..'\t\t\t'..v)
    end
  end
end

main = function() lua_functions() end main()

