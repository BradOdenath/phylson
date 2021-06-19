zero = 0

require "essentialz/essentialz"

demo_class = {
	class_abstract = false;
	class_name = 'JavaObj';
	class_extends = {};
	class_implements = {};
	class_data = {
		str = {
			data_type = 'String';
			data_value = 'sssttrrrrr';
		}; 
		dubbl = {
			data_type = 'double';
			data_value = 13.37;
		};
		ihnt = {
			data_type = 'int';
			data_value = 5;
		};
		fuhnktchyon = {
			data_type = 'var';
			data_parameters = {'derpaderp, adf'};
			data_value = [[
				if (adf != null) {
					derpaderp += adf;
				} 
				
				return (derpaderp);
			]];
		};
	};
}

java_components = {
	abstract = 				[[abstract]];
	comment_statement = 	[[//]];
	file_extension = 		[[.java]];
	class = 				[[class]];
--	left_bracket = 			[[{]];
--	right_bracket = 		[[}]];
--	left_parenthesis = 		[[(]];
--	right_parenthesis = 	[[)]];
	finish_statement =		[[;]];
}

java_statements = {
	variable_increment_statement = [[var += var]];
	variable_decrement_statement = [[var -= var]];
	if_statement = {
		start_statement = [[if (condition) {]];
		end_statement = [[}]];
	};
	for_statement = {
		start_statement = [[for (declare_incrementer, condition, incrementer_change) {]];
		end_statement = [[}]];
	};
	
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
			elseif (v.data_type == "String") then
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
						..v.data_type 
						..' '
						..tostring(i)
						..' = '
						..stringify(v.data_value)
						..java_components.finish_statement
				)
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
			print_debug('nil_value: java_file_generator/java_class/arg/class_name')
		end
		if (class_data == nil) then
			print_debug('nil_value: java_file_generator/java_class/arg/class_data')
		end
	end
	return outStr
end

java_demo_class_data = java_class(
	demo_class -- Class Data
)

print(java_demo_class_data)