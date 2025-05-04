library ieee;
use ieee.std_logic_1164.all ;	

entity shiftLeft2 is
	port(			   
	input  : in std_logic_vector(25 downto 0);	 --input 26 bits
	shifted : out std_logic_vector(27 downto 0)  --output 28 bits
	);
end entity;

architecture behavior of shiftLeft2 is

begin							   
	shifted <= input & "00";
	
end architecture ;