library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test is
end test;

architecture test_cont of test is
    signal clk : std_logic :='0';
    signal reset : std_logic := '0';
    signal enable : std_logic := '0';
    signal CNT_gray : std_logic_vector(1 downto 0);
    component count_gray_up
        port(
            clk : in std_logic;
            reset : in std_logic;
            enable : in std_logic;
            CNT_gray : out std_logic_vector(1 downto 0)  
        );
    end component;
begin 
    utt: count_gray_up
        port map (
            clk => clk,
            reset => reset , 
            enable => enable,
            CNT_gray => CNT_gray
        );
        cre_clk: process
            begin
                while true loop 
                    clk <=  '0';
                    wait for 10 ns;
                    clk <= '1';
                    wait for 10 ns;
                end loop;
            end process;
        cre_data: process
            begin

                reset <= '1';
                wait for 5 ns;

                reset <= '0';
                enable <= '0';
                wait for 20 ns;

                enable <= '1';
                wait for 500 ns;

                reset <= '1';
                wait for 20 ns;
                reset <= '0';
                enable <= '1';
                wait for 500 ns;
                
                wait;
            end process;
end test_cont;