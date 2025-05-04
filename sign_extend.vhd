library ieee;
use ieee.std_logic_1164.all ;	
use ieee.numeric_std.all ;

entity sign_extend is 
	
	port(				  
	input : in std_logic_vector(15 downto 0) ;
	sign_extended : out std_logic_vector(31 downto 0) 
	);
end entity;				 

architecture behavior of sign_extend is	  

signal upper_bits : std_logic_vector(15 downto 0);
begin 
	upper_bits <= (others => input(15)); 
	sign_extended <= (upper_bits & input);

end architecture ;

