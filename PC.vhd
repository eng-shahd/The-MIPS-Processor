
library	ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PC is
	port(
	clk: in std_logic;
	load: in std_logic;
	reset: in std_logic;
	PCcount: in std_logic;
	DATAin: in std_logic_vector(31 downto 0);
	DATAout: out std_logic_vector(31 downto 0) -- its size is 32 as address of ram memory is 32
);end PC;

architecture behavioral of PC is
signal pcsignal: std_logic_vector(31 downto 0);
begin 
	process(clk)
	begin
		if rising_edge(clk)then
			if reset = '1' then
				pcsignal <= (others => '0');
			elsif load = '1' then
				pcsignal <= DATAin;
			elsif PCcount = '1' then
				pcsignal <= pcsignal + 4;
			end if;
		end if;		
	end process;
	DATAout <= pcsignal;
end behavioral;
