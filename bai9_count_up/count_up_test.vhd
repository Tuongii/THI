library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity count_up_test is
end count_up_test;

architecture test of count_up_test is
    component count_up
        generic (
            N : natural := 4
        );
        port(
            clk : in std_logic;
            reset : in std_logic;
            enable : in std_logic;
            CNT : out std_logic_vector(N-1 downto 0)
        );
end component;
    signal clk : std_logic := '0';
    signal reset : std_logic :='0';
    signal enable : std_logic := '0';
    signal CNT : std_logic_vector(3 downto 0);

begin 
    uut: count_up
        generic map (
            N => 4
        )
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            CNT => CNT
        );
    cre_clk: process
        begin 
            while true loop
                clk <= '0';
                wait for 10 ns;
                clk <= '1';
                wait for 10 ns;
            end loop;
        end process;
    cre_data: process
        begin 
            reset <= '0';
            enable <= '0';
            wait for 20 ns;

            enable <= '1';
            wait for 500 ns;


            reset <= '1';
            wait for 20 ns;

            reset <= '0';
            enable <= '1';
            wait for 60 ns;

            enable <= '0';
            wait for 20 ns;

            reset <= '1';           
            wait for 20 ns;
            wait;
        end process;
end test;

