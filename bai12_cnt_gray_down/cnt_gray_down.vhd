library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cnt_gray_down is
    port(
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        CNT_gray : out std_logic_vector(1 downto 0)
    );
end cnt_gray_down;

architecture rtl of cnt_gray_down IS
    signal CNT_bin : std_logic_vector(1 downto 0) := (others=> '0');

begin 
        process(clk,reset)
        begin
            if reset ='1' then 
                CNT_bin <= (others => '0');
            elsif rising_edge(clk) then
                if enable ='1' then
                        if CNT_bin = "00" then
                    CNT_bin <= "11";
                        else
                    CNT_bin <= CNT_bin - 1;
                        end if;
                end if;
            end if;
        end process;
        CNT_gray(1) <= CNT_bin(1);
        CNT_gray(0) <= CNT_bin(1) xor CNT_bin(0);
end rtl;
