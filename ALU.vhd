library ieee;
use ieee.std_logic_1164.all ;	
use ieee.numeric_std.all ;

entity ALU is
	port(
	operand1 : in std_logic_vector(31 downto 0);
	operand2 : in std_logic_vector(31 downto 0);		  
	ALUcontrol : in std_logic_vector(3 downto 0);
	
	result : out std_logic_vector(31 downto 0);
	zero: out std_logic
	);
end entity;		 

architecture behavior of ALU is			  

signal temp : std_logic_vector(31 downto 0);
begin							 
	temp <=
	--add 
    std_logic_vector(unsigned(operand1) + unsigned(operand2)) when ALUcontrol = "0000" else	
	--subtract
	std_logic_vector(unsigned(operand1) + unsigned(operand2)) when ALUcontrol = "0001" else			
	--AND
	operand1 AND operand2 when ALUcontrol = "0010" else
	--OR
	operand1 OR operand2 when ALUcontrol = "0011" else	
	--NAND
	operand1 NAND operand2 when ALUcontrol = "0100" else	
	--NOR
	operand1 NOR operand2 when ALUcontrol = "0101" else	  
	--XOR
	operand1 XOR operand2 when ALUcontrol = "0110" else	
	--shift left logical sll
	std_logic_vector(shift_left(unsigned(operand1) , to_integer(unsigned(operand2(10 downto 6))) )) when ALUcontrol = "0111" else
	--shift right logical srl
	std_logic_vector(shift_right(unsigned(operand1) , to_integer(unsigned(operand2(10 downto 6))) )) when ALUcontrol = "1000" else	
	--other cases	
	(others => '0');
	
	zero <= '1' when temp <= "00000000000000000000000000000000"	else '0' ;
	
	result <= temp ;	
		
	
end architecture ;

		