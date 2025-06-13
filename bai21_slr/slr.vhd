library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity slr_c is
    port (
        Sh_in  : in  std_logic_vector(7 downto 0);
        Sh_val : in  std_logic_vector(2 downto 0); -- Số bit dịch (0..7)
        Sh_out : out std_logic_vector(7 downto 0)
    );
end slr_c;
--cách 1
architecture Behavioral of slr_c is
begin
    process(Sh_in, Sh_val)
        variable temp : std_logic_vector(7 downto 0);
        variable n    : integer;

    begin
        n := to_integer(unsigned(Sh_val));

        for i in 0 to 7 loop
            if (i + n) <= 7 then
                temp(i) := Sh_in(i + n);
            else
                temp(i) := '0'; -- lấp bằng bit dấu
            end if;
        end loop;
        Sh_out <= temp;
    end process;
end Behavioral;
--cách 2
-- architecture Behavioral of slr_c is
-- begin
--     process(Sh_in, Sh_val)
--         variable n : integer;
--     begin
--         n := to_integer(unsigned(Sh_val));
--         if n = 0 then
--             Sh_out <= Sh_in;
--         elsif n < 8 then
--             Sh_out <= (others => '0')(7 downto 8-n) & Sh_in(7 downto n);
--         else
--             Sh_out <= (others => '0');
--         end if;
--     end process;
-- end Behavioral;

