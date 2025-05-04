
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity register_file_TB is 
end register_file_TB;

architecture test of register_file_TB is

	signal clk: std_logic:= '0';
	signal writeEN: std_logic:= '0';
	signal write: std_logic_vector(4 downto 0);
	signal read1: std_logic_vector(4 downto 0):= "ZZZZZ";
	signal read2: std_logic_vector(4 downto 0):= "ZZZZZ";
	signal datawrite: std_logic_vector(31 downto 0); 
	signal dataread1: std_logic_vector(31 downto 0);
	signal dataread2: std_logic_vector(31 downto 0);

	component register_file
		port(
			clk: in std_logic;
			writeEN: in std_logic;
			write: in std_logic_vector(4 downto 0); 
			read1: in std_logic_vector(4 downto 0);
			read2: in std_logic_vector(4 downto 0);
			datawrite: in std_logic_vector(31 downto 0); 
			dataread1: out std_logic_vector(31 downto 0);
			dataread2: out std_logic_vector(31 downto 0)
	);end component;

begin 
	reg: register_file port map(
		clk => clk,
		writeEN => writeEn,
		write => write,
		read1 => read1,
		read2 => read2,
		datawrite => datawrite,
		dataread1 => dataread1,
		dataread2 => dataread2
	);
	
	clk <= not clk after 10 ns;
	
	process
	begin 
		write <= "00000";
		datawrite <= X"44444444";
		writeEN <= '1';
		wait for 20 ns;
		
		write <= "00001";
		datawrite <= X"55555555";
		wait for 20 ns;
		
		writeEN <= '0';
		
		read1 <= "00000";
		read2 <= "00001";
		wait;
	
	end process;
	
end test;
