library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity arch_reg is
	port(
		entrada1 : in std_logic_vector(7 downto 0);
		entrada2 : in std_logic_vector(7 downto 0);
		entrada3 : in std_logic_vector(7 downto 0);
		clock    : in std_logic;
		reset    : in std_logic;
		output1  : out std_logic_vector(7 downto 0)
		);
end entity;

architecture behavior of arch_reg is 
signal FF_A : std_logic_vector(7 downto 0);
signal FF_B : std_logic_vector(7 downto 0);
signal FF_C : std_logic_vector(7 downto 0);
signal FF_D : std_logic_vector(7 downto 0);
begin

process(clock, reset)
begin
if (reset = '0') then 
	FF_A <= (others => '0');
	FF_B <= (others => '0');
	FF_C <= (others => '0');
	FF_D <= (others => '0');
elsif (clock = '1' and clock'event) then
	FF_A <= entrada1;
	FF_B <= entrada2;
	FF_C <= entrada3;
	FF_D <= (FF_A + FF_B) - FF_C;
end if;
end process;

output1 <= FF_D;

end behavior;