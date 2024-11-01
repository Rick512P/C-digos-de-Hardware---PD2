library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    port(
        Input0      : in STD_LOGIC_VECTOR(7 downto 0);
        Input1      : in STD_LOGIC_VECTOR(7 downto 0);
        Output1      : out STD_LOGIC_VECTOR(7 downto 0);

        Clock    : in STD_LOGIC;
        Reset    : in STD_LOGIC;

        En_0    : in STD_LOGIC;
        En_1    : in STD_LOGIC;
        OP    : in STD_LOGIC
    );
end main;

architecture behavior of main is

    signal FF_1, FF_2, FF_3, FF_4   : STD_LOGIC_VECTOR(7 downto 0);
    signal FF_OP_1, FF_OP_2     : STD_LOGIC;
begin
    process(Clock, Reset)
    begin
        if (Reset = '1') then
            FF_1 <= (others => '0');
            FF_2 <= (others => '0');
            FF_3 <= (others => '0');
            FF_4 <= (others => '0');
            FF_OP_1 <= ('0');
            FF_OP_2 <= ('0');
        
        elsif (Clock ='1' and Clock'event) then
            FF_OP_2 <= FF_OP_1;
            FF_OP_1 <= OP;

            if En_0 = '1' then
                FF_1 <= Input0;
            end if;

            if En_1 = '1' then
                FF_2 <= Input1;
            end if;

            FF_3 <= FF_1 + FF_2;
            FF_4 <= FF_1 - FF_2;

            if FF_OP_2 = '0' then
                Output1 <= FF_3;
            else
                Output1 <= FF_4;
            end if;
        end if;
    
    end process;

end behavior;