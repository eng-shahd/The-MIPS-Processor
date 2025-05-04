library ieee;
use ieee.std_logic_1164.all ;	
use ieee.numeric_std.all ;

entity mux4 is
	port(
	in0 : in std_logic_vector(31 downto 0);
	in1 : in std_logic_vector(31 downto 0);	 
	in2 : in std_logic_vector(31 downto 0);
	in3 : in std_logic_vector(31 downto 0);
	sel : in std_logic_vector(1  downto 0);	 
	
	output : out std_logic_vector(31 downto 0)
	);
end entity ;				

architecture bahavior of mux4 is			 

signal muxOut : std_logic_vector(31 downto 0); 

begin	  	   				
	with sel select
	muxOut <= in0 when "00" ,
	          in1 when "01" ,
	          in2 when "10"	,
			  in3 when "11"	,
			  "00000000000000000000000000000000" when others; 
			  
	output <= muxOut ;
			  

end architecture ;