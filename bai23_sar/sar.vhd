library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sar_c is 
    port(
        sh_in : in std_logic_vector (7 downto  0);
        sh_val: in std_logic_vector(2 downto 0);
        sh_out : out std_logic_vector(7 downto 0 )
    );

end entity sar_c;
--Cách 1
architecture behavior of sar_c is
begin
    process(sh_in, sh_val)
        variable temp : std_logic_vector(7 downto 0);
        variable n    : integer;
    begin
        n := to_integer(unsigned(sh_val));
        for i in 0 to 7 loop
            if (i + n) <= 7 then
                temp(i) := sh_in(i + n);
            else
                temp(i) := sh_in(7);
            end if;
        end loop;
        sh_out <= temp;
    end process;
end architecture behavior;

--cách 2
-- process(sh_in, sh_val)
--     variable n : integer;
-- begin
--     n := to_integer(unsigned(sh_val));
--     if n = 0 then
--         sh_out <= sh_in;
--     elsif n < 8 then
--         sh_out <= sh_in(7 downto n) & (others => sh_in(7))(n-1 downto 0);
--     else
--         sh_out <= (others => sh_in(7));
--     end if;
-- end process;