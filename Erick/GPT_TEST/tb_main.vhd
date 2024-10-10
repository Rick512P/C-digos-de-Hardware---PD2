-- Testbench para o circuito principal (main.vhdl)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_main is
end tb_main;

architecture Behavioral of tb_main is
    signal CLK : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Op : STD_LOGIC_VECTOR(2 downto 0);
    signal Resultado : STD_LOGIC_VECTOR(3 downto 0);
    signal Zero : STD_LOGIC;

    -- Instanciando o componente principal (main)
    component main
        Port (
            CLK : in STD_LOGIC;
            Reset : in STD_LOGIC;
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            Op : in STD_LOGIC_VECTOR(2 downto 0);
            Resultado : out STD_LOGIC_VECTOR(3 downto 0);
            Zero : out STD_LOGIC
        );
    end component;

begin
    -- Instância do circuito principal
    uut: main
        port map(
            CLK => CLK,
            Reset => Reset,
            A => A,
            B => B,
            Op => Op,
            Resultado => Resultado,
            Zero => Zero
        );

    -- Geração de clock
    process
    begin
        while true loop
            CLK <= not CLK;
            wait for 10 ns;
        end loop;
    end process;

    -- Estímulos de teste
    process
    begin
        -- Reset inicial
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        
        -- Testando a operação de adição
        A <= "0001"; -- A = 1
        B <= "0010"; -- B = 2
        Op <= "000"; -- Op = ADD
        wait for 20 ns;

        -- Testando a operação de subtração
        A <= "0100"; -- A = 4
        B <= "0011"; -- B = 3
        Op <= "001"; -- Op = SUB
        wait for 20 ns;

        -- Testando a operação AND
        A <= "1010"; -- A = 10
        B <= "1100"; -- B = 12
        Op <= "010"; -- Op = AND
        wait for 20 ns;

        -- Testando a operação OR
        A <= "1010"; -- A = 10
        B <= "1100"; -- B = 12
        Op <= "011"; -- Op = OR
        wait for 20 ns;

        -- Testando a operação XOR
        A <= "1010"; -- A = 10
        B <= "1100"; -- B = 12
        Op <= "100"; -- Op = XOR
        wait for 20 ns;

        -- Finalizando a simulação
        wait;
    end process;

end Behavioral;