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

local python_is_stringifyable = function(data_type)
	local is_string = (data_type == ('string') or data_type == ('char'))
	print(tostring(is_string),tostring(data_type))
	return is_string
end

python_is_string_but_data_type = function(data_type)
	if (python_is_stringifyable(data_type)) then
		return python_components.stryng
	else
		return data_type
	end
end

python_commentify = function(oi)
	return ify(oi, '\n"""')
end

python_class = function(class_data)
	local strLine, outAtr, outFnc = '', '', ''
	if (class_data) then
		for i,v in pairs(class_data.class_data) do 
			local isFnc = false
			local strLine = (
				strLine
					..'\n'
					..python_components.comment_statement
					..' Declare '					
			)
			if (v.data_parameters) then
				strLine = (
					strLine
						..'function as '
						..tostring(i)
						..' with parameters: '
						..commacommacommacommacomma(i_table(v.data_parameters))
						..' and return data type '
						..stringify(v.data_type)
						..'.'
						..'\n'
						..python_components.func
						..code_components.space
						..tostring(i)
						..code_components.space
						..code_components.parenthesisify(
							commacommacommacommacomma(
								i_table(
									v.data_parameters
								)
							)
						)
						..code_components.colon
						..'\n'
						..v.data_value
				)
				isFnc = true
			elseif (type(v.data_value) == 'table') then
				strLine = (
					strLine
						..' attribute '
						..tostring(i)
						..' as data type'
						..stringify(v.data_type)
						..' and initialize the value as "'
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
				local isStr = python_is_stringifyable(v.data_type)
				local dataValue 
				print(isStr)
				if (isStr) then
					dataValue = stringify(data_value)
				end
				strLine = (
					strLine
						..'\n\t'
						..python_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type '
						..stringify(v.data_type)
						..' and initialize the value as '
						..(dataValue or v.data_value)
						..'.'
						..'\n\t'
						..tostring(i)
						..code_components.colon_component
						..python_is_string_but_data_type(v.data_type)
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
	return ( outAtr..'\n'..python_commentify(outFnc) )
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
