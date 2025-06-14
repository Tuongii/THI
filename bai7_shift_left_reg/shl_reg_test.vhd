library ieee;
use ieee.std_logic_1164.all;

entity shl_reg_test is
end shl_reg_test;

architecture test of shl_reg_test is
    signal clk    : std_logic;
    signal reset  : std_logic;
    signal enable : std_logic;
    signal sl     : std_logic;
    signal dout   : std_logic_vector(3 downto 0);

    component shl_reg
        port(
            clk    : in std_logic;
            reset  : in std_logic;
            enable : in std_logic;
            SL     : in std_logic;
            Dout   : out std_logic_vector(3 downto 0)
        );
    end component;

begin 
    uut: shl_reg
        port map (
            clk    => clk,
            reset  => reset,
            enable => enable,
            SL     => sl,
            Dout   => dout 
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

    create_data: process 
    begin
        reset  <= '0'; sl <= '1';
        enable <= '0';
        wait for 20 ns;
        
        enable <= '1';
        wait for 60 ns;
        
        sl <= '1'; wait for 10 ns;   -- Dịch 1
        sl <= '0'; wait for 10 ns;   -- Dịch 0
        sl <= '1'; wait for 10 ns;   -- Dịch 1
        sl <= '1'; wait for 10 ns;   -- Dịch 1

        
        reset <= '1';
        wait for 20 ns;
        
reset <= '0';

        wait for 40 ns;
        
        sl <= '1';
        wait for 100 ns;
        wait;
    end process;
end test;
