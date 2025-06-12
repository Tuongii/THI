library ieee;
use ieee.std_logic_1164.all;

entity shr_reg_test is
end shr_reg_test;

architecture test of shr_reg_test is
    component shr_reg
        port(
            clk : in std_logic;
            reset : in std_logic;
            enable : in std_logic;
            SR : in std_logic;
            Dout : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clk : std_logic := '0';
    signal reset :  std_logic := '0';
    signal enable : std_logic := '0';
    signal SR :std_logic := '0';
    signal Dout : std_logic_vector(3 downto 0);

begin 

    utt: shr_reg
        port map (
            clk => clk,
            reset => reset,
            enable => enable,
            SR => SR,
            Dout => Dout
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
            SR <= '1';
            enable <= '0';
            wait for 20 ns;

            enable <= '1';
            wait for 60 ns;

            SR <= '1';
            wait for 60 ns;

            enable <= '0';
            wait for 20 ns;

            reset <= '1';
            wait for 20 ns;

            SR <= '0';
            reset <= '0';
            enable <= '1';
            wait for 40 ns;

            SR <= '1';
            wait for 100 ns;
            wait;
    end process;
end test;






    
    
