
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity register_file is 
	port(
		clk: in std_logic;
		writeEN: in std_logic;
		write: in std_logic_vector(4 downto 0); -- write, read1, read2 as addresses of registers
		read1: in std_logic_vector(4 downto 0);
		read2: in std_logic_vector(4 downto 0);
		datawrite: in std_logic_vector(31 downto 0); 
		dataread1: out std_logic_vector(31 downto 0);
		dataread2: out std_logic_vector(31 downto 0)
);end register_file;

architecture behavioral of register_file is
type register_array is array (0 to 31) of std_logic_vector(31 downto 0);
signal registers : register_array := (others => (others => '0'));

begin 
	process(clk)
	begin 
		if rising_edge(clk) then
			if writeEN = '1' then
				registers(to_integer(unsigned(write))) <= datawrite;
			end if;
		end if;
	end process; 
	
	dataread1 <= registers(to_integer(unsigned(read1)));
	dataread2 <= registers(to_integer(unsigned(read2)));
	
end behavioral;
