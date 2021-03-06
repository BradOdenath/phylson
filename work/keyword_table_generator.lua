split_string = function(str, delimeter)
	if ((str) and (delimeter)) then
		local result = {}
		if (delimeter == nil) then 
			delimeter = '%a+'
		else
			_ = string.sub(str, #str-#delimeter)
			while (_ ~= delimeter) do
				str = (str..delimeter)
				print('der_value: keyword_table_generator/split_string/arg/delimeter: '..tostring(delimeter))
			end
		end
		status, response = pcall(function()
			local _
			for _match in (str):gsub(delimeter) do
				table.insert(result, _match)
				print(_match)
			end
			print(#result)
			return result
		end)
		if (status) then
			if (type(response) == "table") then
				return (response)
			end
		else
			local words = string.gmatch(str, delimeter)
			for word in words do
				table.insert(result, word)
			end
		end
	else
		if (str == nil) then
			print('nil_value: essentailz/string_split/arg/str')
		end
		if (delimeter == nil) then
			print('nil_value: essentailz/string_split/arg/delimeter')
		end
	end
end split_string('[[ayo]] "ayo" (ayo)', nil)

-- Put quotes arounds a string value
stringify = function(str)     
	if (str) then
		--str = split_string(str, ' ')[1]
		str = (string.sub(str,1,#str-1))
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
	thing = stringify(thing)
	return (
		"\t"
		..thing..[[ = ]]..thing
		..";"
		.."\n"
	)
end
print(equalmyself('ayoo'))

luajson = function(file_name)

	if (file_name) then
		local file = io.open(file_name, "r")
		local outStr
		local outTable = {}
		
		if (file) then
			io.input(file)
			outStr = "{\n"
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
				local shouldequalitself = equalmyself(_os)
				outStr = (
					outStr
						.."\t"..stringify(_os)..";\n"
						--..shouldequalitself
				)
			end

			outStr = (outStr.."}\n\n")
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
			local keyword_list_file = io.open(string.sub(file_name,1,#file_name-4).."_list.json","w+")
			
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

main = function()  keyword_list_generator("reserved_words.txt") end main()

--brb

 