library ieee;
use ieee.std_logic_1164.all ;	
use ieee.numeric_std.all ;

entity shiftLeft is
	port(			   
	input  : in std_logic_vector(31 downto 0);	--from sign extend
	shifted : out std_logic_vector(31 downto 0)  
	);
end entity;

architecture behavior of shiftLeft is

begin							   
	shifted <= std_logic_vector(unsigned(input) sll 2);
	
end architecture ;
