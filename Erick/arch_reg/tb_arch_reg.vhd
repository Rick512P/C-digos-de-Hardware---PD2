library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_arch_reg2 is
    end entity;

architecture behavior of tb_arch_reg2 is




signal sg_In1   :   std_logic_vector(7 downto 0):= 8D"3";

signal sg_In2   :   std_logic_vector(7 downto 0):= 8D"2";

signal sg_In3   :   std_logic_vector(7 downto 0):= 8D"1";

signal sg_Out1  :   std_logic_vector(7 downto 0);

signal sg_clock :   std_logic:= '0';

signal sg_reset :   std_logic:= '0';

component arch_reg2
    port(
        In1     :   in std_logic_vector(7 downto 0);
        In2     :   in std_logic_vector(7 downto 0);
        In3     :   in std_logic_vector(7 downto 0);

        Out1    :   out std_logic_vector(7 downto 0);

        clock   :   in std_logic;    
        reset   :   in std_logic
    );
end component;

begin
    inst_arch_reg2:  arch_reg2
        port map(

            In1 => sg_In1,

            In2 => sg_In2,

            In3 => sg_In3,

            Out1 => sg_Out1,

            clock => sg_clock,

            reset => sg_reset

        );

    sg_clock <= not sg_clock after 5 ns;

    --process 
    --begin
    --    wait for 2 ns;
    --        sg_reset <= '1';
    --    wait;
--
    --end process;
end behavior;
