-- Libraries definitions for BAE core
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb_arch_reg_pipe is 
end entity;

architecture behavior of tb_arch_reg_pipe is

signal Entrada1_sg      : std_logic_vector(7 downto 0):= "00000001";     
signal Entrada2_sg      : std_logic_vector(7 downto 0):= "00000010";    
signal Entrada3_sg      : std_logic_vector(7 downto 0):= "00000011";     
signal clock_sg     : std_logic:= '0'; 
signal reset_sg     : std_logic:= '0'; 
signal OutPut1_sg       : std_logic_vector(7 downto 0); 

component arch_reg_pipe is
    port(
        Entrada1     : in std_logic_vector(7 downto 0);

        Entrada2    : in std_logic_vector(7 downto 0);

        Entrada3     : in std_logic_vector(7 downto 0);

        clock : in std_logic;

        reset : in std_logic;

        OutPut1 : out std_logic_vector(7 downto 0)
        
        );
end component;
        
begin
    inst_arch_reg_pipe : arch_reg_pipe
        port map(

            Entrada1 => Entrada1_sg,
            Entrada2 => Entrada2_sg,
            Entrada3 => Entrada3_sg,
            clock    => clock_sg,
            reset    => reset_sg,
            OutPut1  => OutPut1_sg

            );

    clock_sg <= not clock_sg after 5 ns;
    process
        begin
            wait for 2 ns;
                reset_sg <= '1';
            wait;
    end process;
end behavior;