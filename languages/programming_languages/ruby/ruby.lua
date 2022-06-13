	ruby_components = {
	class_attr_call = '@';
}

ruby_class_data = function(class_data) 
	local outAtr, outFnc = (''), ('')
	if (class_data) then
		for i,v in pairs(class_data) do
			local isFnc = (false)
			local strLine = ('')
			if (v.data_parameters) then
				strLine = (
					strLine
						..'\n\t'
						..ruby_components.comment_statement
						..' Declare function '
						..tostring(i)
						..' and return data type '
						..stringify(v.data_type)
						..'.'
						..'\n\t'
						..v.data_privacy
						..' '
						..v.data_type
						..' '
						..tostring(i)
						..code_components.parenthesisify(commacommacommacommacomma())
				)
			end
		end
	else
		print('nil_value: ruby_class_generator')
	end
end

ruby_demo_class_data = ruby_class(
	ruby_demo_class
)