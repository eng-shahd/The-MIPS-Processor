library ieee;
use ieee.std_logic_1164.all ;	
use ieee.numeric_std.all ;

entity mux_2_5 is
	port(
	in0 : in std_logic_vector(4 downto 0);
	in1 : in std_logic_vector(4 downto 0);	
	sel : in std_logic ;	 
	
	output : out std_logic_vector(4 downto 0)
	);
end entity ;		  

architecture behavior of mux_2_5 is
begin
	with sel select
	output <= in0 when '0' ,
	          in1 when others ;
end architecture ;
