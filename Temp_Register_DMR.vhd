
library	ieee;
use ieee.std_logic_1164.all;

-- this register stores data and sends it from Ram Memory 
-- it saves data temporarily

entity temp_register_DMR is 
	port( 
	clk, en: in std_logic;
	datain: in std_logic_vector(31 downto 0);	
	dataout: out std_logic_vector(31 downto 0)	
);end temp_register_DMR;

architecture behavioral of temp_register_DMR is 
signal DMRsignal: std_logic_vector(31 downto 0):= (others => '0');
begin 
	process(clk)
	begin  
		if rising_edge(clk) then 
			if en = '1' then
				DMRsignal <= datain;
			end if;
		end if;
	end process;
	dataout <= DMRsignal;
end behavioral;