
library	ieee;
use ieee.std_logic_1164.all;

-- this register stores data and sends it from Register_File 
-- it saves data temporarily

entity temp_register_AB is 
	port( 
	clk, en: in std_logic;
	Ain, Bin: in std_logic_vector(31 downto 0);
	Aout, Bout: out std_logic_vector(31 downto 0)
);end temp_register_AB;

architecture behavioral of temp_register_AB is 
signal Asignal, Bsignal: std_logic_vector(31 downto 0):= (others => '0');
begin 
	process(clk)
	begin  
		if rising_edge(clk) then 
			if en = '1' then
				Asignal <= Ain;
				Bsignal <= Bin;
			end if;
		end if;
	end process;
	Aout <= Asignal;
	Bout <= Bsignal;
end behavioral;