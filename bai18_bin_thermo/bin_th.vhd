library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all; -- Dùng để chuyển integer sang std_logic_vector


entity bin_th is
    port(
        bin_code : in std_logic_vector(2 downto 0);
        th_code : out std_logic_vector(7 downto 0)
    );
end entity bin_th;

architecture behavior of bin_th is
begin 
    process(bin_code)
        variable value : integer;
        variable temp: std_logic_vector(7 downto 0);
    begin 
        value := to_integer(unsigned(bin_code)); -- Chuyển đổi std_logic_vector sang integer
        temp := (others => '0');--khởi tạo lại giá trị mỗi lần có tín hiệu bin_code thay đổi
        if value > 0 then
            for i in 0 to value - 1 loop -- duyệt qua các giá trị từ bit 0 đến value-1
            
                temp(i) := '1';-- Gán giá trị '1' cho các bit từ 0 đến value-1
            end loop;
        end if;
        th_code <= temp;
    end process;
end architecture behavior;
        
