require 'essentialz/essentialz'

csharp_permissions = {
	internal = 'internal';
	private = 'private';
	protected = 'protected';
	public = 'public';
}

csharp_components = {
	abstract = 				[[abstract]];
	interface = 			[[interface]];
	if_value_null_then = 	"??";
	comment_statement = 	"// ";
	file_extension = 		[[.cs]];
	class =					[[class]];
	finish_statement = 		[[;]];	
	set =					[[set]];
	get = 					[[get]];	
}

csharp_components.if_value_null_then_component = (
	code_components._code_component(
		csharp_components.if_value_null_then
	)
)

csharp_permissions.protected_internal = (
	csharp_permissions.protected
		..code_components.space
		..csharp_permissions.internal
)
csharp_permissions.private_protected = (
	csharp_permissions.private
		..code_components.space
		..csharp_permissions.protected
)

--[[
	public class CSHARPOBJECT {
	
		
		public type objName {get; set;}
		
		
	}
]]

csharp_parametersersersersersers = function(parameterererererer_table)
	if (parameterererererer_table) then
		local parametersersersersersers = {}
		local outStr = ''
		for i,v in pairs(parameterererererer_table) do
			table.insert(parametersersersersersers, (v.data_type..code_components.space..tostring(i))) --- TODO: 
		end
		
		outStr = commacommacommacommacomma(parametersersersersersers)
		
		return outStr
	else
		print_debug('nil_value: csharp/csharp_parametersersersersersers/arg/parameterererererer_table')
	end
end

csharp_multidimensional_array_count = function(asdf)
	local status, response = pcall(function() return #asdf end)
		if (status) then
		local outasdf = 0
		for i,v in pairs(asdf) do
			if (type(v) == "table") then
				outasdf = outasdf + 1
			else
				return ''
			end
		end
		return outasdf
	else
		return ''
	end
end

csharp_is_multidimensional_array = function(asdf)
	return (csharp_multidimensional_array_count == '')
end

csharp_class_data = function(class_data)
	local outData = {}
	local outStr = ''
	if (class_data) then
		for i,v in pairs(class_data) do
			local isFnc = false
			local strLine = ''
			if (v.data_parameters) then
				strLine = (
					strLine
						..'\n\t'
						..csharp_components.comment_statement
						..' Declare function '
						..tostring(i)
						..' and return data type "'
						..v.data_type 
						..'".'
						..'\n\t'
						..v.data_privacy
						..code_components._code_component(
								v.data_type
						)
						..tostring(i)
						..code_components.parenthesisify(				
							commacommacommacommacomma(
								csharp_parametersersersersersers(
									v.data_paramters
								)
							)
						)
				)
			elseif (type(v.data_value) == "table") then
				strLine = (
					strLine
						..'\n\t'
						..csharp_components.comment_statement
						..' Declare array as ' --TODO: data_structures
						..tostring(i)
						..' as data type as '
						..stringify(v.data_type)
						..' and initialize the value as '
						..stringify(
							code_components.bracketify(
								commacommacommacommacomma(
									v.data_value
								)
							)
						)
						..'.'
						..'\n\t'
						..v.data_privacy
						..code_components.space
						..v.data_type
						..code_components.square_bracketify(
							csharp_multidimensional_array_count(v.data_value)
						)
						..code_components.space
						..tostring(i)
						..code_components.space
				)
				if (v.data_value) then
					strLine = (
						strLine
							..code_components.equals_component
							..commacommacommacommacomma(v.data_value)
					)
				end
			else --string, char, numbers
				strLine = (
					strLine
						..'\n\t'
						..csharp_components.comment_statement
						..' Declare attribute '
						..tostring(i)
						..' as data type '
						..stringify(v.data_type)
						..' and initialize the value as '
						..stringify(v.data_value)
						..'.'
						..'\n\t'
						..v.data_privacy
						..code_components.space
						..v.data_type
						..code_components.space
						..tostring(i)
				)
				if (v.data_value) then
					strLine = (
						strLine
							..code_components.equals_component
							..tostringify(v.data_value)
							..csharp_components.finish_statement
					)
				end
				if (v.public_member_funcs) then
					strLine = (
						strLine
							..'\n\t'
							..code_components.left_bracket
					)
					if (v.public_member_funcs.get_accessor) then
						strLine = (
							strLine
								..code_components._code_component(
									csharp_components.get
									..csharp_components.finish_statement
								)
						)
					end
					if (v.public_member_funcs.set_mutator) then
						strLine = (
							strLine
								..csharp_components.set
								..csharp_components.finish_statement
						)
					end
					strLine = (
						strLine
							..code_components.space
							..code_components.right_bracket
					)
				end
			end
			zpcall(
				table.insert(outData, strLine)
			)
		end
		--outData = table.sort(outData)
		for i,v in pairs(outData) do
			outStr = (outStr..v)
		end
		return outStr
	else
		print_debug('nil_value: csharp_file_generator/csharp_class_data/arg/class_data')
	end
end

csharp_class = function(tree_class_data) 
	local outStr = ''
	if (tree_class_data) then
		if (tree_class_data.class_abstract) then
			outStr = (
				outStr
					..cshar_components.abstract
			)
		end
		outStr = (
			outStr
				..tree_class_data.class_privacy
				..code_components.space
				..csharp_components.class
				..code_components.space
				..tree_class_data.class_name
				..code_components.space
				..code_components.bracketify(
					'\n\t'
						..csharp_components.comment_statement
						..' File: '
						..tree_class_data.class_name
						..csharp_components.file_extension
						..csharp_class_data(tree_class_data.class_data)
						..'\n'
				)
		)
	else
		print_debug('nil_value: csharp_file_generator/csharp_class/arg/tree_class_data')
	end
	return outStr
end

csharp_demo_class_data = csharp_class(
	demo_class
)

print(csharp_demo_class_data)
print(csharp_demo_class_data)