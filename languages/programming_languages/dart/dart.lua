zero = 0

require "essentialz/essentialz"


dart_components = {
	abstract = 				[[abstract]];
	comment_statement = 	[[//]];
	file_extension = 		[[.dart]];
	class = 				[[class]];
	finish_statement =		[[;]];
}

dart_conditions = {
	greater_than_condition = [[var1 > var2]];
	lesser_than_condition = [[var1 < var2]];
	greater_than_or_equal_to_condition = [[var1 >= var2]];
	lesser_than_or_equal_to = [[var1 <= var2]];
	equal_to = [[var1 == var2]];
	not_equal_to = [[var1 != var2]];
	is = [[var1 is var2]];
	not_is = [[var1 is! var2]];
	
	not_condition = [[!(condition1)]];
	
	and_conditions = [[condition1 && condition2]];
	or_conditions = [[condition1 || condition2]];
	
}

dart_statements = {

	variable_operand_statement = [[var1 operand= var2]];
	
	variable_assignment_simple_statement = [[var1 = (assignment_var2)]];
	variable_assignment_if_null_statement =  [[var1 = var2]];
	variable_assignment_addition_statement = [[var1 += var2]];
	variable_assignment_subtract_statement = [[var1 -= var2]];
	variable_assignment_multiply_statement = [[var1 *= var2]];
	variable_assignment_division_statement = [[var1 /= var2]];	

	variable_arithmetic_addition_statement = [[var1 = var2 + var3]];
	variable_arithmetic_subtract_statement = [[var1 = var2 - var3]];
	--variable_arithmetic_unary_minus_statement = [[var1 = var2 -expr var3]];
	variable_arithmetic_multiply_statement = [[var1 = var2 * var3]];
	variable_arithmetic_division_statement = [[var1 = var2 / var3]];
	variable_arithmetic_division_integer_return_statement = [[var1 = var2 ~/ var3]];
	variable_arithmetic_division_remainder_statement = [[var1 = var2 % var3]];
	variable_arithmetic_increment_statement = [[var1++]];
	variable_arithmetic_decrement_statement = [[var1--]];
	
	inline_if_statement = [[(condition1) ? statement1 : statement2]];
	inline_non_null_if_statement = [[var1 ?? var2]];
	
	set_statement = [[set var1(arg1) var1 = arg1;]];
	get_statement = [[type_var1 get var1 => this.var1]];
	
	variable_declaration_statement = [[Type1 var1]];

	if_statement = {
		start_statement = [[if (condition1) {]];
		end_statement = [[}]];
	};
	
	for_statement = {
		start_statement = [[for (declare_incrementer, condition1, incrementer_change) {]];
		end_statement = [[}]];
	};
 	
}


dart_class_data = function(class_data)
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
						..dart_components.comment_statement
						..' Declare '
						..tostring(i)						
						..'as a '
						..v.data_privacy
						..' function '
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
			elseif (type(v.data_value) == "table") then
				strLine = (
					strLine
						..'\n\t'
						..dart_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type "'
						..v.data_type
						..'" and initialize the value as "{'
						..commacommacommacommacomma(v.data_value)
						..'}".'
						..'\n\t'
						..v.data_type 
						..code_components.left_square_bracket
						..code_components.right_square_bracket
						..' '
						..tostring(i)
						..' = '
						..code_components.left_bracket
						..commacommacommacommacomma(v.data_value)
						..code_components.right_bracket
						..dart_components.finish_statement
				)
			elseif (type(v.data_value) == "string") then
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
				--print_debug(outFnc)
			else
				outAtr = (outAtr..'\n'..strLine)
			end
		end
	else
		print_debug('nil_value: dart_file_generator/dart_class_data/arg/class_data')
	end
	return (outAtr..outFnc)
end

dart_class = function(tree_class_data) 
	local outStr = ''
	if (tree_class_data) then
		if (tree_class_data.class_abstract) then
			outStr = (
				outStr
					..dart_components.abstract
			)
		end
		outStr = (
			outStrfsdafasf   
--				..dart_permissions.public
--				..' '
				..dart_components.class
				..' '
				
				
				..tree_class_data.class_name
				..' '
				..code_components.left_bracket
				..'\n\t'
				..dart_components.comment_statement
				..' File: '
				..tree_class_data.class_name
				..dart_components.file_extension
				..dart_class_data(tree_class_data.class_data)
				..'\n'
				..code_components.right_bracket
		)
	else
		if (class_name == nil) then
			print_debug('nil_value: dart_file_generator/dart_class/arg/class_name')
		end
		if (class_data == nil) then
			print_debug('nil_value: dart_file_generator/dart_class/arg/class_data')
		end
	end
	return outStr
end

dart_demo_class = demo_class

dart_demo_class_data = dart_class(
	dart_demo_class -- Class Data
)

print(dart_demo_class_data)	

test_file(
	demo_class.class_name, 
	dart_components.file_extension, 
	dart_demo_class_data
)