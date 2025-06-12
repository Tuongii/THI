library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity shl_reg is
    port(
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        SL: in std_logic;
        Dout : out std_logic_vector(3 downto 0)
    );
end shl_reg;

architecture structure of shl_reg is
    signal Dout_reg : std_logic_vector(3 downto 0) := "0000";
begin
    process(clk,reset)
    begin 
        if reset = '1' then 
            Dout_reg <= (others => '0');
            elsif  rising_edge(clk) then
                if enable = '1' then
                    Dout_reg <= Dout_reg(2 downto 0) & SL;

                end if;
        end if;
    end process;
                        Dout <= Dout_reg;
end structure;
