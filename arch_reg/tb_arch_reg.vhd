library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_arch_reg is
end entity;

architecture behavior of tb_arch_reg is 
component arch_reg is
	port(
		entrada1 : in std_logic_vector(7 downto 0);
		entrada2 : in std_logic_vector(7 downto 0);
		entrada3 : in std_logic_vector(7 downto 0);
		clock    : in std_logic;
		reset    : in std_logic;
		output1  : out std_logic_vector(7 downto 0)
		);
end component;

signal entrada1_sg : std_logic_vector(7 downto 0):= "00000011";
signal entrada2_sg : std_logic_vector(7 downto 0):= "00000010";
signal entrada3_sg : std_logic_vector(7 downto 0):= "00000100";
signal clock_sg    : std_logic:= '0';
signal reset_sg    : std_logic:= '0';
signal output1_sg  : std_logic_vector(7 downto 0);

begin

inst_arch_reg : arch_reg
	port map(
		entrada1 => entrada1_sg,
		entrada2 => entrada2_sg,
		entrada3 => entrada3_sg,
		clock    => clock_sg,   
		reset    => reset_sg,   
		output1  => output1_sg
		);
clock_sg <= not clock_sg after 5 ns;
process 
begin
	wait for 2 ns;
		reset_sg <= '1';
	wait;
end process;
end behavior;