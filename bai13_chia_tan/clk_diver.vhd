library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clk_diver is
    port (
        clk_in : in std_logic;
        clk_out : out std_logic
    );
end clk_diver;

architecture Behavioral of clk_diver is
    signal count : integer range 0 to 24 := 0; -- Counter from 0 to 24
    signal clk_reg : std_logic := '0'; -- Output clock register
begin
    process (clk_in)
    begin
        -- Rising edge of the input clock
        if rising_edge(clk_in) then
            if count = 24 then
                count <= 0; -- Reset counter after reaching 24
                clk_reg <= not clk_reg; -- Toggle the output clock
            else
                count <= count + 1; -- Increment counter
            end if;
        end if;
    end process;

    clk_out <= clk_reg; -- Assign the toggled signal to output

end Behavioral;
