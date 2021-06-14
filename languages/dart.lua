zero = 0

require "essentials/essentials"

demo_class = {
	class_name = 'DartObj';
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

dart_components = {
	comment_statement = 	[[//]];
	file_extension = 		[[.dart]];
	class = 				[[class]];
--	left_bracket = 			[[{]];
--	right_bracket = 		[[}]];
--	left_parenthesis = 		[[(]];
--	right_parenthesis = 	[[)]];
	finish_statement =		[[;]];
}


dart_class_data = function(class_data)
	local outAtr = ''
	local outFnc = ''
	if (class_data) then
		for i,v in pairs(class_data) do
			local isFnc = false
			local strLine = ''
			if (v.data_parameters)  then
				--print(tostring(v.data_value))
				
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
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
			elseif (v.data_type'== "String") then
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
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
						..dart_components.finish_statement
				)
			else
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
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
						..dart_components.finish_statement
				)
			end
			if (isFnc == true) then
				outFnc = (outFnc..'\n'..strLine)
				--print(outFnc)
			else
				outAtr = (outAtr..'\n'..strLine)
			end
		end
	else
		print('nil_value: dart_file_generator/dart_class_data/arg/class_data')
	end
	return (outAtr..outFnc)
end

dart_class = function(class_name, class_data) 
	if (class_name and class_data) then
		return (
			dart_components.class
				..' '
				..class_name
				..' '
				..code_components.left_bracket
				..'\n\t'
				..dart_components.comment_statement
				..' File: '
				..class_name
				..dart_components.file_extension
				..dart_class_data(class_data)
				..'\n'
				..code_components.right_bracket
		) 
	else
		if (class_name == nil) then
			print('nil_value: dart_file_generator/dart_class/arg/class_name')
		end
		if (class_data == nil) then
			print('nil_value: dart_file_generator/dart_class/arg/class_data')
		end
	end
end

dart_demo_class_data = dart_class(
		demo_class.class_name, 
		demo_class.class_data
	)

print(dart_demo_class_data)