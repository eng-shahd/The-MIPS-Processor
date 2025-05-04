
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity memory_tb is 
end memory_tb;

architecture test of memory_tb is
	signal clk: std_logic:= '0';
	signal write: std_logic:= '0';
	signal read: std_logic:= '0';
	signal address: std_logic_vector(4 downto 0); 
	signal write_data: std_logic_vector(31 downto 0); 
	signal read_data: std_logic_vector(31 downto 0);
	
	component memory
		port(
		clk: in std_logic;
		write: in std_logic;
		read: in std_logic;
		address: in std_logic_vector(4 downto 0); 
		write_data: in std_logic_vector(31 downto 0);  
		read_data: out std_logic_vector(31 downto 0)
	);end component;

begin
	RAM: memory port map(
		clk => clk,
		write => write,
		read => read,
		address => address,
		write_data => write_data,
		read_data => read_data
	);
	
	clk <= not clk after 10 ns;

	process 
	begin
		address <= "00000";
		write_data <= X"4576F103";
		write <= '1';
		read <= '0';
		wait for 20 ns;
		
		write <= '0';
		wait for 20 ns;
		
		read <= '1';
		address <= "00000";
		wait for 20 ns;
	end process;
end test;
	