
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC_TB is
end PC_TB;

architecture test of PC_TB is

	signal clk: std_logic:='0';
	signal load: std_logic:= '0'; 
	signal reset: std_logic:= '0';
	signal PCcount: std_logic:= '0';
	signal DATAin: std_logic_vector(31 downto 0);
	signal DATAout: std_logic_vector(31 downto 0);

	component PC
		port(
			clk: in std_logic;
			load: in std_logic;
			reset: in std_logic;
			PCcount: in std_logic;
			DATAin: in std_logic_vector(31 downto 0);
			DATAout: out std_logic_vector(31 downto 0)
	);end component;
	

begin
	pc_port: PC port map(
		clk => clk,
		load => load,
		reset => reset,
		PCcount	=> PCcount,
		DATAin => DATAin,
		DATAout => DATAout
	);
	
	clk <= not clk after 10 ns;
	
	process
	begin
		reset <= '1';
		wait for 20 ns;
		
		reset <= '0';
		load <= '1';
		DATAin <= X"55555555";
		wait for 20 ns;
		
		load <= '0';
		PCcount <= '1';
		wait;
	
	end process;
	
end test;
