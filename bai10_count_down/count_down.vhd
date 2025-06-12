library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity count_down is
    generic( N: natural );
    port(
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        CNT : out std_logic_vector(N-1 downto 0)
    );
end count_down;

architecture rtl of count_down is
    signal CNT_reg : std_logic_vector( N-1 downto 0) := (others => '0');

begin 
        process(clk,reset)
        begin
            if reset ='1' then
                CNT_reg <= (others => '0');
            elsif rising_edge(clk) then
                if enable ='1' then
                    CNT_reg <= CNT_reg - 1;
                end if;
            end if;
        end process;

        CNT <= CNT_reg;
end rtl;