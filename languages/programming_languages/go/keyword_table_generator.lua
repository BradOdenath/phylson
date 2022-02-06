

-- Put quotes arounds a string value
stringify = function(str)     
	if (str) then
		if (type(string.lower(str)) == string.lower('string')) then
			return tostring([["]]..str..[["]])
		else
			print('dif_value: essentials/stringify/arg/str: '..tostring(str))
		end
	else
		print('nil_value: essentials/stringify/arg/str')
	end
	return str
end

equalmyself = function(thing)
	return (thing..[[ : ]]..thing)
end
print(equalmyself(stringify('ayoo')))


luajson = function(file_name)

	if (file_name) then
		local file = io.open(file_name, "r")
		local outStr
		local outTable = {}
		
		if (file) then
			io.input(file)
			outStr = "{"
			for line in io.lines(file_name) do
				if (line) then
					table.insert(outTable, tostring(line))
				else
					print("err_value: keyword_table_generator/luajson/var/line: "..tostring(line))
				end
					
			end
			
			io.close(file)
			
			for i,v in pairs(outTable) do			
				local _os = v:gsub("\n","")
				print(_os)
				_os = stringify(_os)
				print(_os)
				local shouldequalitself = equalmyself(_os)
				print(tostring(shouldequalitself))
				outStr = (
					outStr
						..shouldequalitself
				)
			end

			outStr = (outStr.."\n}\n\n")
		else
			print("nil_value: keyword_table_generator/luajson/var/file")
		end
		return outStr
	else
		print("nil_value: keyword_table_generator/luajson/arg/file_name")
	end


end

keyword_list_generator = function(file_name)
	if (file_name) then
	
		local generated_keywords_table = luajson(file_name)
		
		if (generated_keywords_table) then
			local keyword_list_file = io.open("go_keyword_list.lua","w+")
			
			if (keyword_list_file) then
				io.input(keyword_list_file)
				
				io.output(keyword_list_file)
				
				io.write(generated_keywords_table)
				
				io.close(keyword_list_file)
			
			else
				print("nil_value: keyword_table_generator/keyword_list_generator/var/keyword_list_file: "..tostring(keyword_list_file))
			end
		else
			print("nil_value: keyword_table_generator/keyword_list_generator/var/generated_keywords_table: "..tostring(generated_keywords_table))
		end
	else
		print("nil_value: keyword_table_generator/keyword_list_generator/arg/file_name: "..tostring(file_name))
	end		
end

main = function()  keyword_list_generator("go_keywords.txt") end main()