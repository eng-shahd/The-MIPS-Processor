
library	ieee;
use ieee.std_logic_1164.all;

-- this register stores data and sends it from ALU 
-- it saves data temporarily

entity temp_register_ALUout is 
	port( 
	clk, en : in std_logic;
	datain : in std_logic_vector(31 downto 0);	
	dataout : out std_logic_vector(31 downto 0)	
);end temp_register_ALUout;

architecture behavioral of temp_register_ALUout is 
signal ALUsignal : std_logic_vector(31 downto 0):= (others => '0');
begin 
	process(clk)
	begin  
		if rising_edge(clk) then 
			if en = '1' then
				ALUsignal <= datain;
			end if;
		end if;
	end process;
	dataout <= ALUsignal;
end behavioral;