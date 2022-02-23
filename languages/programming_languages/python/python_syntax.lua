require "essentialz/essentialz"

python_syntax = {
	if_ = {
		ss = [[if (]];
		sf = [[):]];
	};
	elseif_ = {
		ss = [[elif (]];
		sf = [[):]];
	};
	else_ = {
		ss = [[else:]];
	};
	for_ = {
		ss = [[for ]];
	};
	in_ = {
		ss = [[in (]];
		sf = [[):]];
	};
	range_ = {
		ss = [[range(]];
		sf = [[)]];
	};
	
}

python_syntax.for_.is = function(data)
	local out
	if (type(data) == "string") then
		out = (
			(string.find(data, python_syntax.for_.ss) ~= nil) 
		and (string.find(data, python_syntax.in_.ss) ~= nil)
		and (string.find(data, python_syntax.in_.sf) ~= nil)
		) 
	else
		print("der_type: python_syntax/arg/data: "..tostring(data))
		--out = false
	end
	return((out) or (false))
end
python_syntax.for_.extract = function(data)
	local outData = {}
	if (python_syntax.for_.is(data)) then
		string.gsub(data,python_syntax.for_.ss,'')
		table.insert(outData, first_word_from_statement(data))
	end
	print(outData)
	return(outData)
end
python_syntax.for_.convert = function(data)
	--[[order of operations check all ifs from the essentialz map it to the language that returns true get the extract function from that table then return the data to this function to build the new for]]
end

main = function() print_table(python_syntax.for_.extract("for a in range(1,5):")) end main()