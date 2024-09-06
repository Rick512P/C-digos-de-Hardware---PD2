library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity arch_reg2 is

    port(
    
    
    In1     :   in std_logic_vector(7 downto 0);
    In2     :   in std_logic_vector(7 downto 0);
    In3     :   in std_logic_vector(7 downto 0);

    Out1    :   out std_logic_vector(7 downto 0);

    clock   :   in std_logic;    
    reset   :   in std_logic

    );
end entity;

architecture behavior of arch_reg2 is

    signal FF_A :   std_logic_vector(7 downto 0);
    signal FF_B :   std_logic_vector(7 downto 0);
    signal FF_C :   std_logic_vector(7 downto 0);
    signal FF_D :   std_logic_vector(7 downto 0);

begin

    process(clock, reset)
        begin
            if (reset = '1') then
                FF_A <= (others => '0');
                FF_B <= (others => '0');
                FF_C <= (others => '0');
                FF_D <= (others => '0');

            elsif (clock = '1' and clock'event) then

                FF_A <= In1;

                FF_B <= In2;
                
                FF_C <= In3;

                FF_D <= (FF_A + FF_B) - FF_C;

            end if;
        end process;

    Out1 <= FF_D;
    
end architecture behavior;