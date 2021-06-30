require "essentialz/essentialz"
go_components = {
	comment_statement = 	[[// ]];
	file_extension = 		[[.go]];
	tipe = 					[[type]];
	struct = 				[[struct]];
--	left_bracket = 			[[{]];
--	right_bracket = 		[[}]];
--	left_parenthesis = 		[[(]];
--	right_parenthesis = 	[[)]];
}


go_class_data = function(class_data)
	local outAtr = ''
	local outFnc = ''
	if (class_data) then
		for i,v in pairs(class_data) do
			local isFnc = false
			local strLine = ''
			if (v.data_parameters)  then
				--print_debug(tostring(v.data_value))
				
				strLine = (
					strLine
						..'\n'
						..go_components.comment_statement
						..' Declare function '
						..tostring(i)
						..' and return data type "'
						..v.data_type
						..'".'
						..'\n'
						..v.data_type
						..' '
						..tostring(i) 
						..code_components.left_parenthesis
						..commacommacommacommacomma(v.data_parameters)
						..code_components.right_parenthesis
						..' '
						..code_components.left_bracket
						..'\n'
						..format_stanzatement(v.data_value)
						..'\n'
						..code_components.right_bracket
				)
				isFnc = true
			elseif (type(v.data_value) == "table") then
				strLine = (
					strLine
						..'\n\t'
						..go_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..commacommacommacommacomma(v.data_value)
						..'".'
						..'\n\t'
						..tostring(i)
						..' '
						..code_components.left_square_bracket
						..code_components.right_square_bracket
						..v.data_type
						..' '
						..code_components.left_bracket
						..stringify(commacommacommacommacomma(v.data_value))
						..code_components.right_bracket
				)
			elseif (v.data_type == 'string') then
				strLine = (
					strLine
						..'\n\t'
						..go_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..v.data_type 
						..' '
						..tostring(i)
						..' '
						..stringify(v.data_value)
				)
			else
				
				strLine = (
					strLine
						..'\n\t'
						..go_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..v.data_type 
						..' '
						..tostring(i)
						..' '
						..v.data_value
				)
			end
			if (isFnc == true) then
				outFnc = (outFnc..'\n'..strLine)
				--print_debug(outFnc)
			else
				outAtr = (outAtr..'\n'..strLine)
			end
		end
	else
		print_debug('nil_value: go_file_generator/go_class_data/arg/class_data')
	end
	return ({outAtr,outFnc})
end

go_class = function(class_name, class_data) 
	if (class_name and class_data) then
		local cd = go_class_data(class_data)
		return (
			go_components.tipe
				..' '
				..class_name
				..' '
				..go_components.struct
				..' '
				..code_components.left_bracket
				..'\n\t'
				..go_components.comment_statement
				..' File: '
				..class_name
				..go_components.file_extension
				..cd[1]
				..'\n'
				..code_components.right_bracket
				..'\n'
				..cd[2]
		) 
	else
		if (class_name == nil) then
			print_debug('nil_value: go_file_generator/go_class/arg/class_name')
		end
		if (class_data == nil) then
			print_debug('nil_value: go_file_generator/go_class/arg/class_data')
		end
	end
end


print(
	go_class(
		demo_class.class_name, 
		demo_class.class_data
	)
)


