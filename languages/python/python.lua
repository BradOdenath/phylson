require "essentialz/essentialz"

local python_components = {
	comment_statement = [[#]];
	file_extension = [[.python]];
	tipe = [[type]];
	struct = [[struct]];
	func = [[def]];
	stryng = [[str]];
}

python_class_data = function(class_data)
	local outAtr, outFnc = '', ''
	print(class_data)
	if (class_data) then
		for i,v in pairs(class_data) do 
			local isFnc = false
			local strLine = ''
			if (v.data_parameters) then
				strLine = (
					strLine
						..'\n'
						..python_components.comment_statement
						..' Declare function as '
						..tostring(i)
						..' with parameters: '
						..commacommacommacommacomma(i_table(v.data_parameters))
						..' and return data type "'
						..v.data_type
						..'".'
						..'\n'
						..python_components.func
						..code_components.space
						..tostring(i)
						..code_components.space
						..code_components.left_parenthesis
						..commacommacommacommacomma(i_table(v.data_parameters))
						..code_components.right_parenthesis
						..code_components.colon
						..'\n'
				)
			elseif (type(v.data_value == 'table') then
				strLine = (
					strLine
						..'\n\t'
						..python_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type"'
						..v.data_type
						..'" and initialize the value as "'
						..commacommacommacommacomma(v.data_value)
						..'".'
						..'\n\t'
						..tostring(i)
						..code_components.colon_component()
						..v.data_type
						..code_components.equals_component()
						..code_components.left_bracket
						..commacommacommacommacomma(i_table(v.data_value))
						..code_components.right_bracket
				)
			elseif (type(v.data_value == "string") then
				strLine = (
					strLine
						..'\n\t'
						..go_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..python_components.stryng
						..code_components.colon_component()
						..tostring(i)
						..code_components.space
						..v.data_value
				)
			else
				strLine = (
					strLine
				)
			end
		end
	end
	
end