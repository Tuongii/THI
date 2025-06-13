library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ror_c is
    port(
        sh_in  : in  std_logic_vector (7 downto 0);
        sh_val : in  std_logic_vector(2 downto 0);
        sh_out : out std_logic_vector(7 downto 0)
    );
end entity ror_c;

architecture behavior of ror_c is
begin 
    process(sh_in, sh_val)
        variable temp : std_logic_vector( 7 downto 0);
        variable n : integer;
        begin
            n := to_integer(unsigned(sh_val));--dịch 3 bit n =3
            for i in 0 to 7 loop
                temp(i) := sh_in((i + n) mod 8);
            end loop;
            sh_out <= temp;
    end process;
end architecture behavior;


                -- Dịch vòng tròn, nếu i+n > 7 thì lấy phần dư của phép chia cho 8
                -- (i + n) mod 8 sẽ đảm bảo rằng chỉ số không vượt quá 7    
                --ví dụ: nếu n=3 và i=0 thì temp(0) = sh_in(3)
                --nếu n=3 và i=7 thì temp(7) = sh_in(2)
                --nếu n=3 và i=8 thì temp(0) = sh_in(3)


---------------------------------------
--Cách 2
--     architecture behavior of ror_c is
-- begin 
--     process(sh_in, sh_val)
--         variable n : integer;
--     begin
--         n := to_integer(unsigned(sh_val));
--         sh_out <= sh_in(n-1 downto 0) & sh_in(7 downto n);  -- dịch phải n bit
--     end process;
-- end architecture behavior;
