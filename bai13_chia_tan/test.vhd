library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is
end test;

architecture test_cnt of test is
    signal clk_in : std_logic := '0';
    signal clk_out : std_logic := '0';

    component clk_diver
        port(
            clk_in : in std_logic;
            clk_out : out std_logic    
        );
        
    end component;
begin

            dut: clk_diver
                port map (
                    clk_in => clk_in,
                    clk_out => clk_out
                );  
            cre_clk: process
                begin 
                    while true loop
                        clk_in <= '0';
                        wait for 10 ns;
                        clk_in <= '1';
                        wait for 10 ns; 
                    end loop;
                end process;
end test_cnt;
