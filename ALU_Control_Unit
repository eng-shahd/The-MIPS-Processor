library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_Control_Unit is
  port(
    opcode      : in  std_logic_vector(5 downto 0);
    funct_field : in  std_logic_vector(5 downto 0);
    ALUcontrol : out std_logic_vector(3 downto 0)
  );
end ALU_Control_Unit;

architecture Behavioral of ALU_Control_Unit is
  signal alu_op : std_logic_vector(1 downto 0);
begin
  process(opcode)
  begin
    case opcode is
      when "000000" => alu_op <= "10";
      when "100011" => alu_op <= "00";
      when "101011" => alu_op <= "00";
      when "000100" => alu_op <= "01";
      when others   => alu_op <= "00";
    end case;
  end process;

  process(alu_op, funct_field)
  begin
    case alu_op is
      when "00" =>
        ALUcontrol <= "0000";
      when "01" =>
        ALUcontrol <= "0001";
      when "10" =>
        case funct_field is
          when "100000" => ALUcontrol <= "0000";
          when "100010" => ALUcontrol <= "0001";
          when "100100" => ALUcontrol <= "0010";
          when "100101" => ALUcontrol <= "0011";
          when "100111" => ALUcontrol <= "0100";
          when "100110" => ALUcontrol <= "0101";
          when "000000" => ALUcontrol <= "0110";
          when "000010" => ALUcontrol <= "0111";
          when "101010" => ALUcontrol <= "1000";
          when others   => ALUcontrol <= "1111";
        end case;
      when others =>
        ALUcontrol <= "1111";
    end case;
  end process;
end Behavioral;
