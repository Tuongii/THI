library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity JK_FF is
    port(
        J,K     : in std_logic;
        CLK    : in std_logic;
        SET ,CLR : in std_logic;
        Q       : out std_logic;
        NQ      : out std_logic
    );
END entity;

architecture behavioral of JK_FF is
    signal Q1 : std_logic;
begin
    process(CLK, SET, CLR)
    begin
        if CLR = '0' then
            Q1 <= '0';
        elsif SET = '0' then
            Q1 <= '1';
        elsif rising_edge(CLK) then
            if J = '0' and K = '0' then
                Q1 <= Q1;          -- Giữ nguyên trạng thái
            elsif J = '0' and K = '1' then
                Q1 <= '0';         -- Reset
            elsif J = '1' and K = '0' then
                Q1 <= '1';         -- Set
            elsif J = '1' and K = '1' then
                Q1 <= not Q1;      -- Toggle (đảo trạng thái)
            end if;
        end if;
    end process;
    Q  <= Q1;
    NQ <= not Q1;
end behavioral;




