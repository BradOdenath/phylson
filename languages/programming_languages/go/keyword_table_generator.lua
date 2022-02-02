
luajson = function(file_name)

	if (file_name) then
		local file = io.open(file_name, "r")
		local outStr
		
		if (file) then
			io.input(file)
			outStr = "{"

			local status, line
			while true do 
				status, line = pcall(function() return io.read() end)
				if (status) then
					if (line and #line > 1) then
						print("Line "..line)
						outStr = (
							outStr
								..([[\n\t{ "]]
								..tostring(line)
								..'" = "'
								..tostring(line)
								..[["};]])
						)
					else
						print("err_value: keyword_table_generator/luajson/var/line")
					end
				
					print("err_value: keyword_table_generator/luajson/var/status")
					break
				end
			end
			
			io.close(file)

			outStr = (outStr.."\n}")
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
				
				io.output(file)
				
				io.write(generated_keywords_table)
				
				io.close(keyword_list_file)
				
				print("nil_value: keyword_table_generator/keyword_list_generator/var/keyword_list_file")
			end
			print("nil_value: keyword_table_generator/keyword_list_generator/var/generated_keywords_table")
			
		end
		print("nil_value: keyword_table_generator/keyword_list_generator/arg/file_name")
	end		
end

main = function() print('main') keyword_list_generator("go_keywords.txt") end main()