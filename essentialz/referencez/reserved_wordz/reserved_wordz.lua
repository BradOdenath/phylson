zpcall = function(...) 
	local funcs = table.pack(...)
	local _status, _response = {}, {}
	local count = #funcs
	for i,v in pairs(funcs) do
		local __status, __response = pcall(function() v() end)
		--print(__status)
		if (__status) then
			--print('Successfully ran pcall #'..tostring(i))
			return {
				status = {__status}, 
				response = {__response}
			}
		else
			_status[i] = __status
			_response[i] = __response
		end
	end
	--print('zpcall function count = '..tostring(count))
	return {status = _status, response = _response}
end

obfuscate = function(code) --glot.io
	local outLS = (code:gsub(".", function(_) return ("\\".._:byte()) end) or code)
	outLS = outLS:gsub('\1','')
	print(outLS)
	local outTS, tmpFile
	
	tmpFile = io.open("obfuscate.txt","w+")
	io.output(tmpFile)
	io.write(outLS)
	io.close(tmpFile)
	
	
	return outLS
end
obfuscate([[print('hi')]])

remove_backslash_uno_from_loadstring = function()


end

literally_the_alphabet = {
	"a";
	"b";
	"c";
	"d";
	"e";
	"f";
	"g";
	"h";
	"i";
	"j";
	"k";
	"l";
	"m";
	"n";
	"o";
	"p";
	"q";
	"r";
	"s";
	"t";
	"u";
	"v";
	"w";
	"x";
	"y";
	"z";
}

literally_the_alphabet.is_letter_value = function(letter) 
	if (letter) then
		for i,v in pairs(literally_the_alphabet) do
			if (string.lower(letter) == v) then
				return i
			end
		end
	else
		print("nil_value: reserved_wordz/is_letter_value/arg/letter")
	end
	return 0
end


string_to_table = function(stryng)
	if (stryng) then
		local outTable = {}
	
		if (type(stryng) == "string") then
			for i = 1, (#stryng) do
				table.insert(outTable, stryng[i])
			end
			--print(outTable[i])
		else
			print("typ_value: reserved_wordz/string_to_table/arg/stryng: type"..tostring(type(stryng)))		
		end
		
		return outTable
		
	else
		print("nil_value: reserved_wordz/string_to_table/arg/stryng")
	end
end

string_to_table_values = function(stryng)
	if (stryng) then
		local outTable = {}
		
	--[[if (type(stryng) == "string") then]]
	-- Note: indent ifffffffff statement and comment line below
		stryng = tostring(stryng)
			
		for i = 1, (#stryng) do
			local lytr = (stryng[i])
			table.insert(outTable, (literally_the_alphabet.is_letter_value(lytr)))
		end
		--print(outTable[i])

	--[[else
			print("typ_value: reserved_wordz/string_to_table_values/arg/stryng: type"..tostring(type(stryng)))		
		end]]
		
		return outTable
	else	
		print('nil_values: reserved_wordz/string_to_table_values/arg/stryng')
	end
end

keywords_length = function(taybl)
	if (taybl) then
		local length
		for i,v in ipairs(taybl) do
			if (type(v) == "string") then
				if (length) then
					if (length < #v) then
						length = #v
					end
				else
					length = #v
				end
			end
		end
		return length
	else
		print('nil_value: reserved_wordz/keywords_length/arg/taybl')
	end
end

table_value_alphabeticallify = function(taybl)
	if (taybl) then
		--print(#taybl)
	
		for i,v in pairs(taybl) do
			table.insert(outTable, string_to_table_values(v) )
		end
		
		table.sort(taybl)
		
		return (taybl)
	else
		print("nil_value: reserved_wordz/table_value_alphabeticallify/arg/taybl")
	end
end

split_string = function(str, delimeter)
	if (delimeter == nil) then 
		delimeter = '%s'
	end
	local result = {}
	for match in (str..delimeter):gmatch('(.-)'..delimeter) do
		table.insert(result, match)
	end
	return result
end

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
	--thing = stringify(thing)
	return (
		"\t"
		..stringify(obfuscate(thing))..[[ : ]]..stringify(thing)
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
						--.."\t"..stringify(_os)..";\n"
						..shouldequalitself
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
				print('--asdf')
				
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

--Returns position/s in the list
table.find = function(taybl, item)
	local positions = {}
	
	for i,v in pairs(taybl) do
		if (v == item) then
			table.insert(positions, i)
		end
	end
	
	if (#positions <= 0) then
		positions = nil
	end
	
	return (positions)
end

table.unionify = function(taybl)
	
end

--[[
remove_duplicates = function(this_poor_table_man)
	if (this_poor_table_man) then
		local outTable = {}
		
		for i,v in pairs(this_poor_table_man) do
			
		end
		
		return (outTable)
	else
		print('nil_value: reserved_wordz/remove_duplicates/arg/this_poor_table_man')
	end
end
]]

file_list_to_union = function(file_name)
	if (file_name) then
		local file = io.open(file_name, "r")
		local outStr = ''
		local outTable = {}
		
		if (file) then
			io.input(file)
			for line in io.lines(file_name) do
				if (line) then
					
					line = tostring((line:gsub("%s+","")))
		
					local el = table.find(outTable,line) 
					
					if (line == "true") then
						print('oi')
					end
					
					
					if (not (el)) then
						outTable[line] = tostring(line)
						print('Added: '..outTable[line]..tostring(#line))
					else
						--print('Ignor: '..line..tostring(el))

					end	
					--print('asdf'..outTable[line])
				
				else
					print("err_value: reserved_wordz/file_list_to_union/arg/file_name")
				end
			end
			
			io.close(file)
			
			--outTable = table_value_alphabeticallify(outTable)
			table.sort(outTable)
			
			print(#outTable)
			
			for i,v in pairs(outTable) do
				local _os = v:gsub("%s+","")
				outStr = (
					outStr
						.._os
						.."\n"
				)
			end
			
			--print(outStr)
			os.execute("cat << "..outStr.." > "..file_name)
			
			return outTable
		end
	else
		print("nil_value: reserved_wordz/file_list_to_union/arg/file_name")
	end
end

main = function() 
	local fyle_naym = ("keywordz.txt")
	file_list_to_union(fyle_naym) 
	keyword_list_generator(fyle_naym)
end main() 