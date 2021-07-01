file_content = function(file_name)
	if (file_name) then
		local file = io.open(file_name, 'rb')
		local file_content = file:read('*all')
		file:close()
		return file_content
	else
		print('nil_value: file_concat/file_content/arg/file_name')
		return file_name
	end
end

table_requires = function(fyle_name)
	out_table_requires = {}
	if (fyle_name) then
		
		local fyle_content = file_content(fyle_name)
		
		if fyle_content ~= nil then
			print(tostring(fyle_content))
		end
		
	else
		print('nil_value: file_concat/table_requires/arg/fyle_name')
	end
	return out_table_requires
end

