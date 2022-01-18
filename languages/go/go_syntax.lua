
java_conditions = {
	greater_than_condition = [[var1 > var2]];
	lesser_than_condition = [[var1 < var2]];
	greater_than_or_equal_to_condition = [[var1 >= var2]];
	lesser_than_or_equal_to = [[var1 <= var2]];
	equal_to = [[var1 == var2]];
	not_equal_to = [[var1 != var2]];
	
	
	--is = [[var1 is var2]];
	is = [[]]; --[[@override bool equals(Type1 var1) {}]]

	not_is = [[]]; --[[var1 is! var2;]]
	
	
	not_condition = [[!(condition1)]];

	and_conditions = [[condition1 && condition2]];
	or_conditions = [[condition1 || condition2]];
	
} 

java_statements = {

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
	
	set_statement = [[set var1(arg1) var1 = arg1;]]];
	get_statement = [[type_var1 get var1 => this.var1;]];
	
	

	if_statement = {
		start_statement = [[if (condition1) {]];
		end_statement = [[}]];
	};
	
	for_statement = {
		start_statement = [[for (declare_incrementer, condition1, incrementer_change) {]];
		end_statement = [[}]];
	};
 	
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

var_syntax = 'var'

decipher_string = function()
	for i,v in pairs(string) do
		
	end
end