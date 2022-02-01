---TODO: Add Gist: lc3_op_code_console_memory_contents.txt

local LC3_OP_CODE_DICTIONARY = {
	ADD_CODE_0 	= {'0001','0','00'}; 			--1
	ADD_CODE_1	= {'0001','1'};					--2	
	AND_CODE_0	= {'0101','0','00'}; 			--3
	AND_CODE_1	= {'0101','1'};					--4	
	BR_CODE 	= {'0000'};						--5
	JMP_CODE	= {'1100'};						--6
	JSR_CODE 	= {'0100','1'}; 				--7
	JSRR_CODE 	= {'0100','0','00','000000'};	--8
	LD_CODE 	= {'0010'};						--9
	LDI_CODE	= {'1010'};						--10
	LDR_CODE	= {'0110'};						--11	
	LEA_CODE	= {'1110'};						--12	
	NOT_CODE	= {'1001','111111'};			--13
	RET_CODE	= {'1100','000','111','000000'};--14
	RTI_CODE	= {'1000','000000000000'};		--15	
	ST_CODE		= {'0011'};						--16
	STI_CODE	= {'1011'};						--17
	STR_CODE 	= {'0111'};						--18
	TRAP_CODE	= {'1111','0000'};				--19	
	RESERVED	= {'1101'};						--20
}



local DEFAULT_PROGRAM_COUNTER = 12288 
local DEFAULT_CC = 'Z'

local R0, R1, R2, R3, R4, R5, R6, R7, PC, IR, CC

local HEXIDECIMAL_TO_BINARY = function(hexidecimal_value)
	local decimal_value = tonumber(hexidecimal_value)
	local binary_value = ''
	
	
	
end

local BINARY_TO_HEXIDECIMAL = function(binary_value)
	local hexidecimal_to_binary = ''
	local reversed_binary_value
	for i = #binary_value, 1, -1 do
		
	end	
end



local ADD_0 = function(DR, SR1, SR2)
	--Formula: DR = SR1 + SR2
	local _DR = SR1 + SR2
	
	return _DR
end


local ADD_1 = function(DR, SR1, imm5)
	--Formula: DR = SR1 + imm5
	local _DR = SR1 + imm5
	
	return _DR
end


local AND_0 = function(DR, SR1, SR2)
	--Formula: If SR1 == SR2 then == DR else 0
	local _DR = 0
	if (SR1 == SR2) then
		_DR = SR1
	end
	return _DR
end


local AND_1 = function(DR, SR1, imm5)
	--Formula: If SR1 == imm5 then == DR else 0
	local _DR = 0
	local _imm5 = ---TODO: Binary to decimal conversion
	if (SR1 == imm5) then
		_DR = SR1
	end
	return _DR
end


local BR = function(n,z,p, PCoffset9)
	if ((PCoffset9 <= -1) and (n == 1)) then
	
		BR(n,z,p,PCoffset9)
		
	elseif ((PCoffset9 <= 0) and (z == 1)) then
	
		BR(n,z,p,PCoffset9)
		
	elseif ((PCoffset9 > 0) and (p == 1)) then
	
		BR(n,z,p,PCoffset9)
		
	else
	
		print("qhrai*")
	
	end
end


local JMP = function(BaseR)
	
end


local JSR = function(PCoffset11)
	
end


local JSRR = function(BaseR)
	
end


local LD = function(DR, PCoffset9)
	
end


local LDI = function(DR, PCoffset9)

end


local LDR = function(DR, BaseR, offset6)

end


local LEA = function(DR, PCoffset9)

end


local NOT = function(DR, SR)

end


local RET = function()

end


local RTI = function()

end


local ST = function(SR, PCoffset9)

end


local STI = function(SR, PCoffset9)

end


local STR = function(SR, BaseR, offset6)

end


local TRAP = function(trapvect8)

end


local reserverd = function()

end


local OP_CODE_COMMAND = function(OP_CODE)
	local OUT = nil
	local OP_C = string.sub(OP_CODE,1,3)
	for i,v in pairs(LC3_OP_CODE_DICTIONARY) do
		if (OP_C == v[1]) then
			if (v[1] == LC3_OP_CODE_DICTIONARY[1][1]) then
				if (v[2] == 0) then -- 1
					OUT = ADD_0(
						string.sub(OP_CODE,5,7),
						string.sub(OP_CODE,8,10),
						string.sub(OP_CODE,14,16)
					)
				elseif (v[2] == 1) then -- 2
					OUT = ADD_1(
						string.sub(OP_CODE,5,7),
						string.sub(OP_CODE,8,10),
						string.sub(OP_CODE,12,16)
					)
				end
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[3][1]) then
				if (v[2] == 0) then -- 3
					OUT = AND_0(
						string.sub(OP_CODE,5,7),
						string.sub(OP_CODE,8,10),
						string.sub(OP_CODE,14,16)
					)
				elseif (v[2] == 1) then -- 4
					OUT = AND_1(
						string.sub(OP_CODE,5,7),
						string.sub(OP_CODE,8,10),
						string.sub(OP_CODE,12,16)
					)
				end	
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[5][1]) then --5
				OUT = BR(
					string.sub(OP_CODE,5,5),
					string.sub(OP_CODE,6,6),
					string.sub(OP_CODE,7,7),
					string.sub(OP_CODE,8,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[6][1]) then
				OUT = JMP(
					string.sub(OP_CODE,8,10)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[7][1]) then
				if (v[2] == 1) then -- 7
					OUT = JSR(string.sub(OP_CODE,5,16))
				elseif (v[2] == 0) then -- 8
					OUT = JSRR(string.sub(OP_CODE,8,10))
				end
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[9][1]) then --9
				OUT = LD(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[10][1]) then --10
				OUT = LDI(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[11][1]) then --11
				OUT = LDR(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,10),
					string.sub(OP_CODE,11,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[12][1]) then --12
				OUT = LEA(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[13][1]) then --13
				OUT = NOT(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,10)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[14][1]) then --14
				OUT = RET()
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[15][1]) then --15
				OUT = RTI()
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[16][1]) then --16
				OUT = ST(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[17][1]) then --17
				OUT = STI(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[18][1]) then --18
				OUT = STR(
					string.sub(OP_CODE,5,7),
					string.sub(OP_CODE,8,10),
					string.sub(OP_CODE,11,16)
				)
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[19][1]) then --19
				OUT = TRAP()
			elseif (v[1] == LC3_OP_CODE_DICTIONARY[20][1]) then --20
				OUT = reserverd()
			end
		end
	end
end
