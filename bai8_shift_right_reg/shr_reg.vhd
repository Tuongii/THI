library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity shr_reg is
    port(
        clk : in std_logic;
        reset  : in std_logic;
        enable : in std_logic;
        SR : in std_logic;
        Dout : out std_logic_vector ( 3 downto 0)
    );
end shr_reg;

architecture rtl of shr_reg is 
    signal Dout_reg : std_logic_vector(3 downto 0):= "0000";

begin 
    process(clk, reset)
        begin 
            if reset = '1' then
                
                Dout_reg <= (others => '0');
            elsif rising_edge(clk) then
                if enable = '1' then
                    Dout_reg <= SR & Dout_reg(3 downto 1 );
                end if;
            end if;
    end process;
    Dout <= Dout_reg;
end rtl;    
        