require "essentialz/essentialz"

java_permissions = {
	private = 'private';
	protected = 'protected';
	public = 'public';
}

java_components = {
	abstract = 				[[abstract]];
	comment_statement = 	[[//]];
	file_extension = 		[[.java]];
	class = 				[[class]];
	finish_statement =		[[;]];
}


java_class_data = function(class_data)
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
						..'\n\t'
						..java_components.comment_statement
						..' Declare function '
						..tostring(i)
						..' and return data type "'
						..v.data_type
						..'".'
						..'\n\t'
						..v.data_privacy
						..' '
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
						..'\n\t'
						..code_components.right_bracket
				)
				isFnc = true
			elseif (type(v.data_value) == "table") then
				strLine = (
					strLine
						..'\n\t'
						..java_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "{'
						..commacommacommacommacomma(v.data_value)
						..'}".'
						..'\n\t'
						..v.data_privacy
						..' '
						..v.data_type 
						..code_components.left_square_bracket
						..code_components.right_square_bracket
						..' '
						..tostring(i)
						..' = '
						..code_components.left_bracket
						..commacommacommacommacomma(v.data_value)
						..code_components.right_bracket
						..java_components.finish_statement
				)
			elseif (type(v.data_value) == "string") then
				strLine = (
					strLine
						..'\n\t'
						..java_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..v.data_privacy
						..' '
						..v.data_type 
						..' '
						..tostring(i)
				)
				if (v.data_value) then
					strLine = (
						strLine
							..code_components.equals_component
					)
					if (v.data_type == "char") then
						strLine = (
							strLine
								..charify(v.data_value)
						)
					else
						strLine = (
							strLine
								..stringify(v.data_value)
						)
					end
					strLine = (
						strLine
							..java_components.finish_statement
					)
				end
			else
				strLine = (
					strLine
						..'\n\t'
						..java_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "'
						..v.data_value
						..'".'
						..'\n\t'
						..v.data_privacy
						..' '
						..v.data_type 
						..' '
						..tostring(i)
						..' = '
						..v.data_value
						..java_components.finish_statement
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
		print_debug('nil_value: java_file_generator/java_class_data/arg/class_data')
	end
	return (outAtr..outFnc)
end

java_class = function(tree_class_data) 
	local outStr = ''
	if (tree_class_data) then
		if (tree_class_data.class_abstract) then
			outStr = (
				outStr
					..java_components.abstract
			)
		end
		outStr = (
			outStr
				..java_permissions.public
				..' '
				..java_components.class
				..' '
				..tree_class_data.class_name
				..' '
				..code_components.left_bracket
				..'\n\t'
				..java_components.comment_statement
				..' File: '
				..tree_class_data.class_name
				..java_components.file_extension
				..java_class_data(tree_class_data.class_data)
				..'\n'
				..code_components.right_bracket
		)
	else
		if (class_name == nil) then
			print_debug('nil_value: java_file_generator/java_class/arg/tree_class_data')
		end
	end
	return outStr
end

java_demo_class = demo_class

java_demo_class_data = java_class(
	java_demo_class -- Class Data
)

print(java_demo_class_data)	

test_file(
	java_demo_class.class_name, 
	java_components.file_extension, 
	java_demo_class_data
)