zero = 0

require "essentialz/essentialz"

cobol_components = {
	john_froggatt = 		[[john_froggatt]]; 
	comment_statement = 	[[//]];
	file_extension = 		[[.cobc]];
	finish_statement = 		[[.]];	
}

cobol_conditions = {
	greater_than_condition = 
		[[var1 IS GREATER THAN var2]];
	lesser_than_condition = 
		[[var2 IS LESS THAN var2]];
	greater_than_or_equal_to_condition = 
		[[var1 IS GREATER THAN OR EQUAL TO var2]];
	lesser_than_or_equal_to = 
		[[var1 IS LESS THAN OR EQUAL TO var2]];
	equal_to = 
		[[var1 IS EQUAL TO var2]];
	not_equal_to = 
		[[var1 IS NOT EQUAL TO var2]];
	is = 
		[[var1 IS type1]];
	not_is = 
		[[var1 IS NOT type1]];
	
	not_condition = 
		[[!(condition)]];
	
	and_conditions = 
		[[condition1 AND condition2]];
	or_conditions = 
		[[condition1 AND condition2]];
}

cobol_statements = {
	
	
	variable_operand_statement = [[memory1 var1 VALUE var2]];
	
	variable_assignment_simple_statement = [[]];
	variable_assignment_if_null_statement = [[]];
	varaible_assignment_addition_statement = [[]];
	variable_assignment_subtract_statement = [[]];
	variable_assignment_multiply_statement = [[]];
	variable_assignment_division_statement = [[]];
	
	varaible_arithmetic_addition_statement = [[]];
	variable_arithmetic_subtract_statement = [[]];
	variable_arithmetic_unary_minus_statement = [[]];
	variable_arithmetic_multiply_statement = [[]];
	variable_arithmetic_division_statement = [[]];
	variable_arithmetic_increment_statement = [[]];
	variable_arrithmetic_decrement_statement = [[]];
	
	inline_if_statment = [[]];
	inline_non_null_if_statement = [[]];
	
	set_statement = [[]];
	get_statement = [[]];
	
	variable_declaration_statement = [[]];
	
	if_statement = {};
	
	for_statement = {};
	
	
}