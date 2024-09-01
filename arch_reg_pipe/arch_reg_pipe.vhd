library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity arch_reg_pipe is
    port(

        Entrada1     : in std_logic_vector(7 downto 0);

        Entrada2    : in std_logic_vector(7 downto 0);

        Entrada3     : in std_logic_vector(7 downto 0);

        clock : in std_logic;

        reset : in std_logic;

        OutPut1 : out std_logic_vector(7 downto 0)

    );
end entity;

architecture behavior of arch_reg_pipe is

    signal FF_A : std_logic_vector(7 downto 0);
    
    signal FF_B : std_logic_vector(7 downto 0);
    
    signal FF_C : std_logic_vector(7 downto 0);

    signal FF_D : std_logic_vector(7 downto 0);

    signal FF_E : std_logic_vector(7 downto 0);

    signal FF_F : std_logic_vector(7 downto 0);

    
    begin
        process(clock, reset) --Inicia processo necessario para FF
            begin
            if (reset = '0') then --Verifica reset
                FF_F <= (others => '0');
                FF_C <= (others => '0');
                FF_B <= (others => '0');
                FF_A <= (others => '0');
    
            elsif (clock = '1' and clock'event) then --verifica borta ascedente
                
                FF_A <= Entrada1;
                FF_B <= Entrada2;
                FF_C <= Entrada3;

                FF_D <= FF_A + FF_B;
                FF_E <= FF_C;
                FF_F <= FF_D - FF_E;

            end if;
            
        end process;
    
        OutPut1 <= FF_F; --Recebe Valor do FF C, se fosse inserido dentro do processo, tornaria-se um FF.
    