print_table = function(table_data)
	if (table_data) then
		if (type(table_data) == 'table') then
			for i,v in pairs(table_data) do
				if (type(i) ~= 'number') then
					print(tostring(i))
				end
				if (v) then
					if (type(v) == 'table') then
						print_table(v)
					else
						print('i: '..tostring(i)..'\t| v: '..tostring(v))
					end
				else
					print('nil_value: essentials/print_table/arg'
						..code_components.left_bracket
						..tostring(i)
						..code_components.right_bracket
						..'/v')
				end
			end
		end
	else
		print('nil_value: print_table/arg/table_data')
	end
end

main = function() print_table({'a','y','o'}) end main()