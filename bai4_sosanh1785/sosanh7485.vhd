library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sosanh7485 is
    port (
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);

        O: out std_logic_vector(2 downto 0)
    );
end entity;

architecture Behavioral of sosanh7485 is
begin
    process(A, B)
    begin
        if unsigned(A) > unsigned(B) then-- chuyển vector về dạng số nguyên không dấu
            O <= "100";
        elsif unsigned(A) < unsigned(B) then
            O <= "010";
        else
			O <= "001";
        end if;
    end process;
end Behavioral;
