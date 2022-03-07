require "essentialz/essentialz"

local perl_components = {
	extension_statement = ".pl";
	comment_statement = "#";
	finish_statement = ";";
	function_class = "sub";
	
}

perl_class = function(class_data)
	local outAtr, outFnc = '', ''
	if (class_data) then
		for i,v in pairs(class_data.class_data) do
			local isFnc = false
			local strLine = ''			
			strLine = (
				strLine
					..'\n'
					..perl_components.comment_statement
					..'Declare '
			)
			if (v.data_parameters) then
				strLine = (
					strLine
						..' function as '
						..tostring(i)
						..' with parameters: '
						..commacommacommacommacomma(
							i_table(
								v.data_parameters
							)
						)
						..' and return data type '
						..stringify(v.data_type)
						..'.'
						..'\n'
						..perl_components.sub
						..code_components.bracketify(
							commacommacommacommacomma(
								i_table(
									v.data_parameters
								)
							)
						)
				)
			elseif (type(v.data_value) == "table") then
				strLine = (
					strLine
						..' array '
						..
						..' array and assign the value '
				)
			else
				strLine = (
					strLine
						..' attribute '
						..tostring(i)
						..' as data type '
				)	
				if (type(v.data_value) == "string") then
					strLine = (
						strLine
							..stringify(v.data_type)
					)
				elseif (type(v.data_value) == "char") then
					strLine = (
						strLine
							..charify(v.data_type)
					)
				else
					print('der_value: perl_class/var/v.data_type')
					strLine = (
						strLine
							..'blahblahblahitsanerror'
					)
				end
				strLine = (
					strLine
						..
				)
			else
				
				
			end
		end
	end
end

perl_demo_class = demo_class

perl_demo_class_data = perl_class(
	perl_demo_class
)

test_file(
	
)