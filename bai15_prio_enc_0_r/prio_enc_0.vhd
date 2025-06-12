library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all; -- Dùng để chuyển integer sang std_logic_vector
entity prio_enc is
    port(
        i_vector : in std_logic_vector(7 downto 0);
        pos : out std_logic_vector(2 downto 0);
        found : out std_logic
    );
end entity prio_enc;

architecture behavior of prio_enc is
    signal pos_temp : std_logic_vector(2 downto 0) := "000";
begin
    process(i_vector)
        variable pos_temp   : std_logic_vector(2 downto 0) := "000";
        variable found_temp : std_logic := '0';
    begin
        -- Duyệt từ trái sang phải (bit 7 -> 0), gặp '0' đầu tiên thì lưu lại
        for i in 0 to 7 loop
            if i_vector(i) = '0' then
                pos_temp := std_logic_vector(to_unsigned(i, 3));
                found_temp := '1';
                exit; -- Ngừng ngay khi gặp '0' đầu tiên
            end if;
        end loop;
        pos   <= pos_temp;
        found <= found_temp;
    end process;
end architecture behavior;
