library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit_tb is
end ControlUnit_tb;

architecture behavior of ControlUnit_tb is

  signal CLK         : std_logic := '0';
  signal Reset       : std_logic := '1';
  signal Op          : std_logic_vector(5 downto 0);

  signal PCWriteCond : std_logic;
  signal PCWrite     : std_logic;
  signal IorD        : std_logic;
  signal MemRead     : std_logic;
  signal MemWrite    : std_logic;
  signal MemToReg    : std_logic;
  signal IRWrite     : std_logic;
  signal PCSource    : std_logic_vector(1 downto 0);
  signal ALUOp       : std_logic_vector(1 downto 0);
  signal ALUSrcB     : std_logic_vector(1 downto 0);
  signal ALUSrcA     : std_logic;
  signal RegWrite    : std_logic;
  signal RegDst      : std_logic;

  constant CLK_PERIOD : time := 10 ns;

begin

  uut: entity work.ControlUnit
    port map (
      CLK         => CLK,
      Reset       => Reset,
      Op          => Op,
      PCWriteCond => PCWriteCond,
      PCWrite     => PCWrite,
      IorD        => IorD,
      MemRead     => MemRead,
      MemWrite    => MemWrite,
      MemToReg    => MemToReg,
      IRWrite     => IRWrite,
      PCSource    => PCSource,
      ALUOp       => ALUOp,
      ALUSrcB     => ALUSrcB,
      ALUSrcA     => ALUSrcA,
      RegWrite    => RegWrite,
      RegDst      => RegDst
    );

  clk_process : process
  begin
    while true loop
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
  end process;

  stim_proc: process
  begin
    Reset <= '0';
    wait for 2 * CLK_PERIOD;
    Reset <= '1';

    Op <= "100011";
    wait for 6 * CLK_PERIOD;

    Op <= "101011";
    wait for 6 * CLK_PERIOD;

    Op <= "000000";
    wait for 5 * CLK_PERIOD;

    Op <= "001000";
    wait for 5 * CLK_PERIOD;

    Op <= "000100";
    wait for 4 * CLK_PERIOD;

    Op <= "000010";
    wait for 4 * CLK_PERIOD;

    wait;
  end process;

end behavior;
