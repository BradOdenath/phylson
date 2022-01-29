require 'essentialz/essentialz/'

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
}
csharp_components.if_value_null_then_component = (
	code_components._code_component(
		cshar_components.if_value_null_then
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
	return (erererererer_(
		parameterererererer_table, 
		(v.data_type..code_components.space..tostring(i))
	))
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
	if (class_data) then
		for i,v in pairs(class_data) do
			local isFnc = false
			local strLine = ''
			if (v.data_paramters) then
				strLine = (
					strLine
						..'\n\t'
						..csharp_components.comment_statement
						..' Declare function '
						..tostring(i)
						..' and return data type "'
						..v.data_type 
						..'".'
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
							bracketify(
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
						..bracketify(csharp_multidimensional_array_count(v.data_value))
						..code_components.space
						..
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
				
			end
			zpcall(
				function()
					outData[tostring(i)
				end,
				table.insert(outData, strLine)
			)
		end
	else
		print_debug('nil_value: csharp_file_generator/csharp_class_data/arg/class_data')
	end
end