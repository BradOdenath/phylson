zero = 0

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
				if (adf) {
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
	left_bracket = 			[[{]];
	right_bracket = 		[[}]];
	left_parenthesis = 		[[(]];
	right_parenthesis = 	[[)]];
	finish_statement =		[[;]];
}


-- Put quotes arounds a string value
stringify = function(str)
	if (str) then
		return ([["]]..str..[["]])
	else
		print('nil_value: dart_file_generator/stringify/arg/str')
		return str
	end
end

-- Turn a table into a list with commas
commacommacommacommacomma = function(data_table)
	local outStr = ''
	if (data_table) then
		for i,v in pairs(data_table) do
			outStr = (outStr..v)
			if (i < #data_table) then
				outStr = (outStr..', ')
			end
		end
	else
		print('nil_value: dart_file_generator/commacommacommacommacomma/arg/data_table')
	end
	return outStr
end

semicolonoscopyz = function(staytmnt)
	if (staytmnt) then
		if (string.find(staytmnt, dart_components.finish_statement) == nil) then
			return (staytmnt..dart_components.finish_statement)
		end
	else
		print('nil_value: dart_file_generator/semicolonoscopyz/arg/staytmnt')
	end
	return staytmnt
end

taboutosometabracknacklets = function(staytmnt)
	for i,v in pairs(staytmnt) do
		
	end
end

--[[
split = function(str, splitter)
	local atoms = {}
	--local iterationLocations = string.gmatch(str, splitter)
	
	
	local iterations = string.gmatch(str, '%a+')
	print(iterations)
	return atoms
end
]]
stanzatements = function(stanza)
	if (stanza) then 
		local stanza_statements = string.gmatch(stanza, '%a+')
		return stanza_statements
	else
		print('nil_value: dart_file_generator/stanzatements/arg/stanza') 
		return {}
	end
end

semicoloniyzanza = function(stanza)
	local stanza_statements = stanzatements(stanza)
	if stanza_statements then
		local out_stanza = ''
		
		for i, stanzatement in stanza_statements do
			if (stanzatement) then
				out_stanza = (
					out_stanza
						..semicolonoscopyz(stanzatement)
				)
			else
				print('nil_value: dart_file_generator/semicoloniyzanza/var/'..tostring(i))
			end
			out_stanza = (
				out_stanza
					..'\n'
			)
		end
		return out_stanza
	else
		print('nil_value: dart_file_generator/semicoloniyzanza/var/stanza_statements')
		return stanza
	end
	
end

indent_string = function(str)
	if (str) then
		return ('\t'..string.gsub(str, '\n', '\n\t'))
	else
		print('nil_value: dart_file_generator/indent_string/arg/str')
	end
end

dindent_string = function(str)
	if (str) then
		return string.gsub(str, '\t\n', '\n')
	else
		print('nil_value: dart_file_generator/dindent_string/arg/str')
	end
end

nodent_string = function(str)
	if (str) then
		return string.gsub(str, '\t', '')	
	else
		print('nil_value: dart_file_generator/nodent_string/arg/str')
	end
end

tab_newline_count = function(stanza_of_statements, offset)
	local tnc = zero
	
	if (offset) then
		tnc = offset
	else
		print('nil_value: dart_file_generator/tab_newline_count/offset')
		--tnc = zero
	end
	
	if (stanza_of_statements) then
		local first
		if pcall(function() 
			first = string.len(string.sub(stanza_of_statements, string.find(stanza_of_statements, '\t\n')))
			--print('first: '..tostring(first))
		end) then
			tnc = tnc + 1
			tab_newline_count(string.sub(stanza_of_statements, first), tnc)
		else
			print('nil_value: dart_file_generator/tab_newline_count/first')
		end
	else
		print('nil_value: dart_file_generator/tab_newline_count/stanza_of_statements')
	end
	
	return tnc
end

getaboffset = function(stanza_of_statements, offset)
	local taboffset = zero
	
	if (stanza_of_statements) then
		
		if (offset) then
			taboffset = offset
		else
			print('nil_value: dart_file_generator/getaboffset/arg/offset')
			--taboffset = zero
		end
		
		local tab_newline_count_a = tab_newline_count(stanza_of_statements)
		
		local stanza_of_statements = dindent_string(stanza_of_statements)

		local tab_newline_count_b = tab_newline_count(stanza_of_statements)
		if (tab_newline_count_a and tab_newline_count_b) then		
			if (tab_newline_count_a <= tab_newline_count_b) then
				return getaboffset(stanza_of_statements, taboffset)
			end
		else
			if (tab_newline_count_a == nil) then
				print('nil_value: dart_file_generator/getaboffset/var/tab_newline_count_a')
			end
			if (tab_newline_count_b == nil) then
				print('nil_value: dart_file_generator/getaboffset/var/tab_newline_count_b')
			end
		end
	else
		print('nil_value: dart_file_generator/getaboffset/arg/stanza_of_statements')
		return zero
	end
	
	return taboffset
end

format_stanzatement = function(stanza_of_statements)
	if (stanza_of_statements) then
		local tab_offset = getaboffset(stanza_of_statements)
		if (tab_offset > 0) then
			for i = 1, tab_offset do
				stanza_of_statements = dindent_string(stanza_of_statements)
			end
		end
		stanza_of_statements = 
			semicoloniyzanza(
				indent_string(
					indent_string(
						--nodent_string(
							stanza_of_statements
						--)
					)
				)			
			)
	else
		print('nil_value: dart_file_generator/format_stanzatement/arg/stanza_of_statements')
	end
	return stanza_of_statements
	
end

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
						..dart_components.left_parenthesis
						..commacommacommacommacomma(v.data_parameters)
						..dart_components.right_parenthesis
						..' '
						..dart_components.left_bracket
						..'\n'
						..format_stanzatement(v.data_value)
						..'\n\t'
						..dart_components.right_bracket
				)
				isFnc = true
			elseif (v.data_value == "String") then
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
				..dart_components.left_bracket
				..'\n\t'
				..dart_components.comment_statement
				..' File: '
				..class_name
				..dart_components.file_extension
				..dart_class_data(class_data)
				..'\n'
				..dart_components.right_bracket
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


print(
	dart_class(
		demo_class.class_name, 
		demo_class.class_data
	)
)

