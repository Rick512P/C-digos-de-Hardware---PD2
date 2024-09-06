library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ula_h is
    port(
        in1 : in std_logic_vector(7 downto 0);
        in2 : in std_logic_vector(7 downto 0);
        sel : in std_logic_vector(1 downto 0);
        out1 : out std_logic_vector(7 downto 0)
    );
end entity;

architecture behavior of ula_h is
    signal soma : std_logic_vector(7 downto 0);
    signal sub : std_logic_vector(7 downto 0);
