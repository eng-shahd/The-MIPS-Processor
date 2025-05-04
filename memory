
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity memory is -- RAM MEMORY
	port(
		clk: in std_logic;
		write: in std_logic;
		read: in std_logic;
		address: in std_logic_vector(4 downto 0); -- 5 bits address deals with 32 location
		write_data: in std_logic_vector(31 downto 0); -- data in 
		read_data: out std_logic_vector(31 downto 0) -- data out
);end memory;

architecture behavioral of memory is   
type memory_array is array(0 to 31) of std_logic_vector(31 downto 0); -- array of 32 words every word is 4 byte
signal ram: memory_array := (others => (others => '0')); -- make the whole array equal 0 as initial value
begin
	process(clk)-- synchronous
	begin
		if rising_edge(clk)then
			if write = '1' then
				-- make address casting from std to interger as an index in ram array
				ram(to_integer(unsigned(address)))<= write_data;
			end if;
		end if;
	end process;
	
	process(read,address) 
	begin
		if read = '1' then
			read_data<= ram(to_integer(unsigned(address)));
		else
			read_data<= (others => 'Z');
		end if;
	end process;
end behavioral;	
 	
