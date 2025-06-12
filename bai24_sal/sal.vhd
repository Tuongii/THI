library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sal_c is 
    port(
        sh_in : in std_logic_vector (7 downto  0);
        sh_val: in std_logic_vector(2 downto 0);
        sh_out : out std_logic_vector(7 downto 0 )
    );

end entity sal_c;

architecture behavior of sal_c is
begin
    process(sh_in, sh_val)
        variable temp : std_logic_vector(7 downto 0);
        variable n    : integer;
    begin
        n := to_integer(unsigned(sh_val));
        for i in 0 to 7 loop
            if (i - n) >=0  then
                temp(i) := sh_in(i - n );
            else
                temp(i) := sh_in(0);
            end if;
        end loop;
        sh_out <= temp;
    end process;
end architecture behavior;