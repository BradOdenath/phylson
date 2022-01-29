require "essentialz/essentialz"

local python_components = {
	comment_statement = [[#]];
	file_extension = [[.py]];
	type_hint = '@dataclass';
	tipe = [[type]];
	class = [[class]]; -- todo: fix this
	func = [[def]];
	stryng = [[str]];
}

local python_is_string = function(data_type)
	return (type(data) == ('string'))
end

python_is_string_but_data_type = function(data_type)
	if (python_is_string(data)) then
		return python_components.stryng
	else
		return data_type
	end
end

python_class = function(class_data)
	local outAtr, outFnc = '', ''
	if (class_data) then
		for i,v in pairs(class_data.class_data) do 
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
						..v.data_value
				)
				isFnc = true
			elseif (type(v.data_value) == 'table') then
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
						..code_components.colon_component
						..v.data_type
				)
				if (v.data_value) then
					strLine = 
						strLine
							..code_components.equals_component
							..code_components.square_bracketify(
								commacommacommacommacomma(
									v.data_value
								)
							)
				end
			else
				local isStr = python_is_string(v.data_type)
				local dataValue 
				if (isStr) then
					dataValue = stringify(data_value)
				end
				strLine = (
					strLine
						..'\n\t'
						..python_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as '
						..(dataValue or v.data_value)
						..'.'
						..'\n\t'
						..python_is_string_but_data_type(v.data_type)
						..code_components.colon_component
						..tostring(i)
				)
				if (v.data_value) then
					strLine = (
						strLine
							..code_components.equals_component
							..v.data_value
					)
				end
			end	
			if (isFnc == true) then
				outFnc = (outFnc..'\n'..strLine)
			else
				outAtr = (outAtr..'\n'..strLine)
			end
		end
		outAtr = (
			python_components.type_hint
				..'\n'
				..python_components.class
				..code_components.space
				..class_data.class_name
				..code_components.colon
				..outAtr
			)
	else
		print_debug('python_file_generator/python_class_data/arg/class_data')
	end 
	return ( outAtr..outFnc )
end

local python_demo_class = demo_class

local python_demo_class_data = python_class(
	python_demo_class
)

print_debug(python_demo_class_data)
print_debug('python')

test_file(
	python_demo_class.class_name, 
	python_components.file_extension, 
	python_demo_class_data
)