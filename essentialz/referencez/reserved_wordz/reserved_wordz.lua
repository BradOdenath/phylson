file_list_to_union = function(file_name)
	if (file_name) then
		local file = io.open(file_name, "r")
		local outStr = ''
		local outTable = {}
		
		if (file) then
			io.input(file)
			for line in io.lines(file_name) do 
				if (line) then
					
					if (not (outTable[line])) then
						outTable[line] = tostring(line)
					end	
					print('asdf'..outTable[line])
				
				else
					print("err_value: reserved_wordz/file_list_to_union/arg/file_name")
				end
			end
			
			io.close(file)
			
			table.sort(outTable)
			
			for i,v in pairs(outTable) do
				local _os = v:gsub("\n","")
				outStr = (
					outStr
						.._os
						.."\n"
				)
			end
			
			print(outStr)
			
		end
	else
		print("nil_value: reserved_wordz/file_list_to_union/arg/file_name")
	end
end

main = function() end main() 