require "essentialz/essentialz"

local go_components = {
	comment_statement = 	[[// ]];
	file_extension = 		[[.go]];
	tipe = 					[[type]];
	struct = 				[[struct]];
	func = 					[[func]];
--	left_bracket = 			[[{]];
--	right_bracket = 		[[}]];
--	left_parenthesis = 		[[(]];
--	right_parenthesis = 	[[)]];
}


local go_parametersersersersers = function(parameterererererer_table)
	if (parameterererererer_table) then
		local parametersersersersers = {}
		local outStr = ''
		for i,v in pairs(parameterererererer_table) do
			table.insert(parametersersersersers, (tostring(i)..' :'..v.data_type))
		end
		
		outStr = commacommacommacommacomma(parametersersersersers)

		return outStr
	else
		print_debug('nil_value: go/go_parametersersersersers/arg/parametererererer_table')
	end
end

local go_class_data = function(class_data)
	local outAtr, outFnc = '', ''
	print(class_data)
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
						..' Declare function as '
						..tostring(i)
						.." with parameters: "
						..commacommacommacommacomma(i_table(v.data_parameters))
						..' and return data type "'
						..v.data_type
						..'".'
						..'\n' 
						..go_components.func
						..code_components.space
						..code_components.left_parenthesis
						..go_parametersersersersers(v.data_parameters)
						..code_components.right_parenthesis
						..code_components.space
						..tostring(i)
						..code_components.left_parenthesis
						..code_components.right_parenthesis
						..code_components.space
						..v.data_type 
						..code_components.space
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
						..code_components.space
						..code_components.left_square_bracket
						..code_components.right_square_bracket
						..v.data_type
						..code_components.space
						..code_components.left_bracket
						..commacommacommacommacomma(i_table(v.data_value))
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
						..code_components.space
						..tostring(i)
						..code_components.space
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
						..code_components.space
						..tostring(i)
						..code_components.space
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
	return ({ atr = outAtr, fnc = outFnc })
end

local go_class = function(class_name, class_data) 
	local outStr = ''
	if (class_name and class_data) then
		local cd = go_class_data(class_data)
		print(cd)
		outStr = (
			go_components.tipe
				..code_components.space
				..class_name
				..code_components.space
				..go_components.struct
				..code_components.space
				..code_components.left_bracket
				..'\n\t'
				..go_components.comment_statement
				..' File: '
				..class_name
				..go_components.file_extension
				..cd.atr
				..'\n'
				..code_components.right_bracket
				..'\n'
				..cd.fnc
		) 
	else
		if (class_name == nil) then
			print_debug('nil_value: go_file_generator/go_class/arg/class_name')
		end
		if (class_data == nil) then
			print_debug('nil_value: go_file_generator/go_class/arg/class_data')
		end
	end
	return outStr
end

local go_demo_class = demo_class

local go_demo_class_data = go_class(
	go_demo_class.class_name, 
	go_demo_class.class_data
)


print(go_demo_class_data)
print('go')