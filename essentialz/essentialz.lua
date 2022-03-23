--
zero = 0

test_file = function(name, extension, content)
	local file = io.open((name..extension), "w+")
	io.output(file)
	io.write(content)
	io.close(file)
end

zpcall = function(...) 
	local funcs = table.pack(...)
	local _status, _response = {}, {}
	local count = #funcs
	for i,v in pairs(funcs) do
		local __status, __response = pcall(function() v() end)
		--print(__status)
		if (__status) then
			--print('Successfully ran pcall #'..tostring(i))
			return {
				status = {__status}, 
				response = {__response}
			}
		else
			_status[i] = __status
			_response[i] = __response
		end
	end
	--print('zpcall function count = '..tostring(count))
	return {status = _status, response = _response}
end

debugger = true

print_debug = function(statement)
	if (debugger) then
		print(statement)
		pcall(function()
			error(statement)
		end)
	end
end

language_contains_statement_methodology = function(statements, statement)
	for statement_method, statement_methodology in pairs(statements) do
		if (statement == tostring(statement_method)) then
			return true
		end
	end
	return false
end

class_types = {
	class	=	'class';
	interface = 'interface';
	abstract = 'abstract';
}

operands = {
	'+';
	'-';
	'*';
	'/';
}

data_type = {
	arg = 'arg';
	par = 'parameter';
}

code_permissions = {
	private = 'private';
	protected = 'protected';
	public = 'public';
}

code_components = {
	left_bracket = 			[[{]];
	right_bracket = 		[[}]];
	left_parenthesis = 		[[(]];
	right_parenthesis = 	[[)]];
	finish_statement =		[[;]];
	left_square_bracket =	'[';
	right_square_bracket = 	']';
	private_indicator = 	'_';
	colon =					':';
	equals =				'=';
	space = 				' ';
	char_component = 		[[']];
	string_component = 		[["]];
}

code_components._code_component = function(der)
		return (
			code_components.space
				..tostring(der)
				..code_components.space
		)
end

code_components.colon_component = (
		code_components
			._code_component(
				code_components.colon
		)
	)

code_components.equals_component = (
		code_components
			._code_component(
				code_components.equals
		)
	)

code_components.square_bracketify = function(ayoooo)
	return (
		code_components.left_square_bracket
			..ayoooo
			..code_components.right_square_bracket
	)
end

code_components.bracketify = function(ayoooo)
	return (
		code_components.left_bracket
			..ayoooo
			..code_components.right_bracket
	)
end

code_components.parenthesisify = function(aatawer)
	return (
		code_components.left_parenthesis
			..aatawer
			..code_components.right_parenthesis
	)
end

--[[
erererererer_ = function(parameterererererer_table, erererererer)
	if (parameterererererer_table) then
		local parametersersersersersers = {}
		local outStr = ''
		for i,v in pairs(parameterererererer_table) do
			table.insert(parametersersersersersers, erererererer) --- TODO: 
		end
		
		outStr = commacommacommacommacomma(parametersersersersersers)
		
		return outStr
	else
		print_debug('nil_value: csharp/csharp_parametersersersersersers/arg/parameterererererer_table')
	end
end]]

ify = function(str,ing)     
	if (str) then
		if (type(string.lower(str)) == string.lower('string')) then
			return (ing..str..ing)
		else
			print_debug('dif_value: essentials/stringify/arg/str: '..tostring(str))
		end
	else
		print_debug('nil_value: essentials/stringify/arg/str')
	end
	return str
end

-- Put quotes arounds a string value
stringify = function(str)
	return (ify(str,code_components.string_component))
end

charify = function(chr)
	return (ify(chr,code_components.char_component))
end

objectify = function(parameterererererer_table)
	if (parameterererererer_table) then
		local parametersersersersersers = {}
		local outStr = ''
		for i,v in pairs(parameterererererer_table) do
			table.insert(parametersersersersersers, 
				(v.data_type
					..code_components._code_component(
						tostring(i)
					))
					..code_components.equals_component
					..tostringify(v.data_value)
					..code_components.finish_statement
			) --- TODO: 
		end
		
		outStr = commacommacommacommacomma(parametersersersersersers)
		
		return outStr
	else
		print_debug('nil_value: csharp/csharp_parametersersersersersers/arg/parameterererererer_table')
	end
end

thisequalsthatersersersersersers = function(parameterererererer_table)
	if (parameterererererer_table) then
		local parametersersersersersers = {}
		local outStr = ''
		for i,v in pairs(parameterererererer_table) do
			local its_an_rv = (v.data_type..code_components.space..tostring(i))
			if (v.data_value) then
				its_an_rv = (its_an_rv..code_components.equals_component..v.data_value)
			end
			print(its_an_rv)
			table.insert(parametersersersersersers, its_an_rv) --- TODO: 
		end
		
		outStr = commacommacommacommacomma(parametersersersersersers)
		
		return outStr
	else
		print_debug('nil_value: csharp/csharp_parametersersersersersers/arg/parameterererererer_table')
	end
end

tostringify = function(ngi)
	local out
	if (type(ngi) == "number") then
		out = (tostring(ngi))
	elseif (type(ngi) == "string") then
		if (#ngi > 1) then
			out = (stringify(ngi))
		else
			out = (charify(ngi))
		end
	elseif (type(ngi) == "table") then
		out = (code_components.parenthesisify(thisequalsthatersersersersersers(ngi)))
	else
		out = (objectify(ngi))
	end
	return out
end

default_class_is_a = class_types.class

demo_class = {
	class_privacy = code_permissions.public;
	class_is_a = default_class_is_a;
	class_name = 'Obj';
	class_extends = {};
	class_implements = {};
	class_privacy = code_permissions.public;
	class_data = {
		suhpher_ohbjhekt = {
			data_privcay = code_permissions.public;
			data_type = 'VEEEHIKL';
			data_value = {
				
			};
		};
		sthr = {
			data_privacy = code_permissions.public;
			data_type = 'string';
			data_value = 'sssttrrrrr';
		}; 
		dubbl = {
			data_privacy = code_permissions.protected;
			data_type = 'double';
			data_value = 13.37;
			public_member_funcs = {
				set_mutator = true;
				get_accessor = true;
			};
		};
		ihnt = {
			data_privacy = code_permissions.public;
			data_type = 'int';
			data_value = 5;
		};
		ihntegers = {
			data_privacy = code_permissions.public;
			data_type = 'int';
			data_value = {4,5,6};
		};
		chyr = {
			data_privacy = code_permissions.private;
			data_type = 'char';
			data_value = 'a';
		};
		ohbjhct = {
			data_object_signal = true;
			data_privacy = code_permissions.protected;
			data_type = "Ooobbbjjjeeecccttt";
			data_value = {
				ayderparreserda = {
					data_privacy = code_permissions.public;
					data_type = 'int';
					data_value = 4;
				};
				syeklacigameerht = {
					data_privacy = code_permissions.protected;
					data_type = 'int';
					data_value = 3;
				};
				kaseudahs = {
					data_privacy = code_permissions.privacy;
					data_type = 'int';
					data_value = 74;
				};
			};
		};
		fuhnktchyon = {
			data_privacy = code_permissions.public;
			data_type = 'int';
			data_parameters = {
				derpaderp = {
					data_privacy = code_permissions.public;
					data_type = 'int';
					data_value = 5;
				}; -- ... ,
				asdf = {
					data_privacy = code_permissions.public;
					data_type = 'int';
					data_value = 5;
				};
			};
			data_value = [[
				if (adf) {
					derpaderp += adf;
				} 
				
				return (derpaderp);
			]];
		};
	};
}

<<<<<<< Updated upstream
=======
is = function(entity, data_type)
	return (type(entity) == data_type)
end

isFunction = function(entity) return (v.data_parameters) end

isTable = function(entity) return (is(entity, "table")) end

isString = function(entity) return (is(entity, "string")) end

isNumeric = function(entity) retur (is(entity, "number")) end
>>>>>>> Stashed changes

pre_permissions_syntax = function(prublivacte, public_string, private_string)
	if (prublivacte) then
		return private_string
	else
		return public_string
	end
end

pre_permission = function(prublivacte)
	return pre_permissions_syntax(
		prublivacte, 
		'', 
		code_components.private_indicator
	)
end

what_is_a_class = function(class_is_a) 
	if (class_is_a) then
		for i,v in pairs(class_types) do
			if (v == class_is_a) then
				return class_is_a
			end
		end
		print_debug('dif_value: essentials/what_is_a_class/arg/class_is_a: '..tostring(class_is_a))
	else
		print_debug('nil_value: essentials/what_is_a_class/arg/class_is_a')
	end
	return default_class_is_a
end

print_table = function(table_data)
	if (table_data) then
		if (type(table_data) == 'table') then
			for i,v in pairs(table_data) do
				if (type(i) ~= 'number') then
					print_debug(tostring(i))
				end
				if (v) then
					if (type(v) == 'table') then
						print_table(v)
					else
						print_debug('i: '..tostring(i)..'\t| v:'..tostring(v))
					end
				else
					print_debug('nil_value: essentials/print_table/arg'
						..bracketify(tostring(i))
						..'/v')
				end
			end
		end
	else
		print_debug('nil_value: essentials/print_table/arg/table_data')
	end
end

string_to_table = function(str)
	local taybl = {}
	for i = 1, #str do
		table.insert(taybl, string.sub(str,i,i))
	end
	return taybl
end

string_to_table('asdf')

contras = {ol = "a"; e = "b"}
-- Turn a table into a list with commas
commacommacommacommacomma = function(data_table)
	local contra, outStr = contras.ol, ''
	if (data_table) then
		if (type(data_table) == "table") then
			for i,v in pairs(data_table) do			
				if (contra == contras.e) then
					outStr = (outStr..', ')
				else
					contra = contras.e
				end
				outStr = (outStr..tostring(v))
			end
		else
			print_debug('der_type: essentialz/commacommacommacommacomma/arg/data_table')
		end
	else
		print_debug('nil_value: essentials/commacommacommacommacomma/arg/data_table')
	end
	return outStr
end

first_word_from_statement = function(statement) 
	if (statement) then
		if (type(statement) == "string") then
			return string.match(statement, "(%w+)")
		end
	else
		print_debug('nil_value: essentials/first_word_from_statement/arg/statement')
	end
end

desemicolonoscoz = function(staytmnt)
	return string.gsub(staytmnt, code_components.finish_statement, [[]])
end

semicolonoscopyz = function(staytmnt)
	if (staytmnt) then
		if (string.find(staytmnt, code_components.finish_statement) == nil) then
			return (staytmnt..code_components.finish_statement)
		end
	else
		print_debug('nil_value: essentials/semicolonoscopyz/arg/staytmnt')
	end
	return staytmnt
end

--- TODO: Convert to Binary Bits
i_table = function(taybl)
	if (taybl) then
		local eyes = {}
		
		for i,v in pairs(taybl) do
			table.insert(eyes, tostring(i))
		end
		
		return eyes
	else
		print_debug('nil_value: essentialz/i_table/arg/taybl')
	end
end

value_table = function(taybl)
	if (taybl) then
		local values = {}
		
		for i,v in pairs(taybl) do
			table.insert(values, tostring(v))
		end
		
		return values
	else
		print_debug('nil_value: essentialz/value_table/arg/taybl')
	end
end

--[[
split = function(str, splitter)
	local atoms = {}
	--local iterationLocations = string.gmatch(str, splitter)
	
	
	local iterations = string.gmatch(str, '%a+')
	print_debug(iterations)
	return atoms
end
]]
stanzatements = function(stanza, pre_stanza_statements)
	local stanza_statements = {}
	if (pre_stanza_statements) then
		stanza_statements = pre_stanza_statements
	else
		--print_debug('nil_value: essentials/stanzatements/arg/pre_stanza_statements')
	end
	
	if (stanza) then 
		local first = string.sub(stanza, string.find(stanza, '\n'))
		if (first) then
			table.insert(stanza_statements, first)
			print_debug(tostring(first))
			stanzatements(string.sub(stanza, string.len(first)), pre_stanza_statements)
		else
			print_debug('nil_value: essentials/stanzatements/var/first')
		end
	else
		print_debug('nil_value: essentials/stanzatements/arg/stanza') 
	end
	return stanza_statements
end

semicoloniyzanza = function(stanza)
	local stanza_statements = stanzatements(stanza)
	if stanza_statements then
		local out_stanza = ''
		for stanzatement in stanza_statements do
			if (stanzatement) then
				out_stanza = (
					out_stanza
						..semicolonoscopyz(stanzatement)
				)
			else
				print_debug('nil_value: essentials/semicoloniyzanza/var/stanzatement')
			end
			out_stanza = (
				out_stanza
					..'\n'
			)
		end
		return out_stanza
	else
		print_debug('nil_value: essentials/semicoloniyzanza/var/stanza_statements')
		return stanza
	end
	
end

indent_string = function(str)
	if (str) then
		return ('\t'..string.gsub(str, '\n', '\n\t'))
	else
		print_debug('nil_value: essentials/indent_string/arg/str')
	end
end

dindent_string = function(str)
	if (str) then
		return string.gsub(str, '\t\n', '\n')
	else
		print_debug('nil_value: essentials/dindent_string/arg/str')
	end
end

nodent_string = function(str)
	if (str) then
		return string.gsub(str, '\t', '')	
	else
		print_debug('nil_value: essentials/nodent_string/arg/str')
	end
end

ondent_string = function(str)
	if (str) then
		return string.gsub(nodent_string(str), '\t', '')
	else
		print_debug('nil-value: essentialz/ondent_string/arg/str')
	end
end

tab_newline_count = function(stanza_of_statements, offset)
	local tnc
	
	if (offset) then
		tnc = offset
	else
		print_debug('nil_value: essentials/tab_newline_count/offset')
		tnc = zero
	end
	
	if (stanza_of_statements) then
		local first
		if pcall(function() 
			first = string.len(string.sub(stanza_of_statements, string.find(stanza_of_statements, '\t\n')))
			--print_debug('first: '..tostring(first))
		end) then
			tnc = tnc + 1
			tab_newline_count(string.sub(stanza_of_statements, first), tnc)
		else
			print_debug('nil_value: essentials/tab_newline_count/first')
		end
	else
		print_debug('nil_value: essentials/tab_newline_count/stanza_of_statements')
	end
	
	return tnc
end

getaboffset = function(stanza_of_statements, offset)
	local taboffset
	
	if (offset) then
		taboffset = offset
	else
		print_debug('nil_value: essentials/gettaboffset/offset')
		taboffset = zero
	end
	
	if (stanza_of_statements) then
		
		local tab_newline_count_a = tab_newline_count(stanza_of_statements,taboffset)
		
		local stanza_of_statements = dindent_string(stanza_of_statements)

		local tab_newline_count_b = tab_newline_count(stanza_of_statements,taboffset)
		if (tab_newline_count_a and tab_newline_count_b) then		
			if (tab_newline_count_a <= tab_newline_count_b) then
				return getaboffset(stanza_of_statements, taboffset)
			end
		else
			if (tab_newline_count_a == nil) then
				print_debug('nil_value: essentials/getaboffset/var/tab_newline_count_a')
			end
			if (tab_newline_count_b == nil) then
				print_debug('nil_value: essentials/getaboffset/var/tab_newline_count_b')
			end
		end
	else
		print_debug('nil_value: essentials/getaboffset/arg/stanza_of_statements')
		return zero
	end
	
	return taboffset
end

taboutosometabracknacklets = function(stanza_of_statements)
	if (stanza_of_statements) then
		local tab_offset = getaboffset(stanza_of_statements)
		if (tab_offset > 0) then
			for i = 1, tab_offset do
				stanza_of_statements = dindent_string(stanza_of_statements)
			end
		end
	else
		print_debug('nil_value: essentials/taboutosometabracknacklets/arg/staytmnt')
	end
	return stanza_of_statements
end

format_stanzatement = function(stanza_of_statements)
	stanza_of_statements = taboutosometabracknacklets(stanza_of_statements)
	if (stanza_of_statements) then
		stanza_of_statements = 
			--semicoloniyzanza(
				indent_string(
					indent_string(
						--nodent_string(
							stanza_of_statements
						--)
					)
				)
			--)
	else
		print_debug('nil_value: essentials/format_stanzatement/arg/stanza_of_statements')
	end
	return stanza_of_statements
end
