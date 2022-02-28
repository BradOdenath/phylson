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

literally_the_alphabet.is_letter = function(letter) 
	if (letter) then
		for i,v in pairs(literally_the_alphabet) do
			if (string.lower(letter) == v) then
				return i
			end
		end
		return false
	else
		print("nil_value: reserved_wordz/is_letter/arg/letter")
	end
end


string_to_table = function(stryng)
	if (stryng) then
		local outTable = {}
	
		if (type(stryng) == "string") then
			for i = 1, (#stryng) do
				table.insert(outTable, stryng[i])
			end
			print(outTable[i])
		else
			print("typ_value: reserved_wordz/string_to_table/arg/stryng: type"..tostring(type(stryng)))		
		end
		
		return outTable
		
	else
		print("nil_value: reserved_wordz/string_to_table/arg/stryng")
	end
end

keywords_length = function(taybl)
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
end

table_value_alphabeticallify = function(taybl)
	if (taybl) then
		local outTaybl = {}


		for _, letter in pairs(literally_the_alphabet) do
			local letter_words = {}
			
			local _sorter = function(ouhtTaybl)
				for i = 1, (keywords_length(ouhtTaybl))
					for i,v in pairs(ouhtTaybl) do
						for j,w in pairs(v) do
							if (type(w) == "string") then
								
							end
						end			
					end
				end
			end
			local sorter = function(...) _sorter(...) end
			letter_words = sorter(outTaybl)
		
		end
		
		return (outTaybl)
	else
		print("nil_value: reserved_wordz/table_value_alphabeticallify/arg/taybl")
	end
end


file_list_to_union = function(file_name)
	if (file_name) then
		local file = io.open(file_name, "r")
		local outStr = ''
		local outTable = {}
		
		if (file) then
			io.input(file)
			for line in io.lines(file_name) do
				if (line) then
					
					line = line:gsub("\n","")
					
					if (not (outTable[line])) then
						outTable[line] = tostring(line)
					end	
					--print('asdf'..outTable[line])
				
				else
					print("err_value: reserved_wordz/file_list_to_union/arg/file_name")
				end
			end
			
			io.close(file)
			
			--outTable = table_value_alphabeticallify(outTable)
			table.sort(outTable)
			
			for i,v in pairs(outTable) do
				local _os = v:gsub("\n","")
				outStr = (
					outStr
						.._os
						.."\n"
				)
			end
			
			--print(outStr)
			os.execute("cat << "..outStr.." > keywordz.txt")
			
			return outTable
		end
	else
		print("nil_value: reserved_wordz/file_list_to_union/arg/file_name")
	end
end

main = function() file_list_to_union("keywordz.txt") end main() 