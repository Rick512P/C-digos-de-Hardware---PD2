--Érick Santos Matos | 2310100966

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ae01 is
    port(
		reset		    : in std_logic;	
		clock  		    : in std_logic;	
		Input0  		: in std_logic_vector(7 downto 0);	
		Input1  		: in std_logic_vector(7 downto 0);	
		op_0    		: in std_logic;	
		op_1    		: in std_logic;	
		Output0	        : out std_logic_vector(7 downto 0)
		);
end ae01;

architecture behavior of ae01 is

    signal FF_0, FF_1, FF_2, FF_3                           : STD_LOGIC_VECTOR(7 downto 0);
    signal FF_0_op_0, FF_0_op_1, FF_1_op_0, FF_1_op_1       : STD_LOGIC;

begin
    process(clock, reset)
    begin
        if (reset = '1') then
            FF_0 <= (others => '0');
            FF_1 <= (others => '0');
            FF_2 <= (others => '0');
            FF_3 <= (others => '0');
            Output0 <= (others => '0');
            FF_0_op_0 <= ('0');
            FF_1_op_0 <= ('0');
            FF_0_op_1 <= ('0');
            FF_1_op_1 <= ('0');
                    
        elsif (clock ='1' and clock'event) then
            FF_0 <= Input0;
            FF_1 <= Input1;
            FF_0_op_0 <= op_0;
            FF_1_op_0 <= FF_0_op_0;
            FF_0_op_1 <= op_1;
            FF_1_op_1 <= FF_0_op_1;

            FF_2 <= FF_0 - FF_1;
            FF_3 <= FF_0 + FF_1;
            
            if (FF_1_op_0 = '0' and FF_1_op_1 = '0') then
                Output0 <= FF_2 + FF_2;
            elsif (FF_1_op_0 = '1' and FF_1_op_1 = '1') then
                Output0 <= FF_3 + FF_3;
            elsif (FF_1_op_0 = '0' and FF_1_op_1 = '1') then
                Output0 <= FF_2 + FF_3;
            else
                Output0 <= FF_3 + FF_2;
            end if;
        end if;
    end process;
end behavior;
