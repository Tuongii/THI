library ieee;
use ieee.std_logic_1164.all;

entity adder4_test is
end adder4_test;

architecture test of adder4_test is
    component adder4 is
        port(
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Ci : in std_logic;
            Sum : out std_logic_vector(3 downto 0);
            Co : out std_logic
        );
    end component;

    signal A : std_logic_vector(3 downto 0) := "0000";
    signal B : std_logic_vector(3 downto 0) := "0000";
    signal Ci : std_logic := '0';
    signal Sum : std_logic_vector(3 downto 0);
    signal Co : std_logic;

begin
    DUT: component adder4
        port map(
            A => A,
            B => B,
            Ci => Ci,
            Sum => Sum,
            Co => Co
        );

    input: process
    begin
        -- Test case 1
        A <= "0101";
        B <= "0110";
        Ci <= '0';
        wait for 100ns;

        -- Test case 2
        A <= "0101";
        B <= "0110";
        Ci <= '1';
        wait for 100ns;

        -- Test case 3
        A <= "0111";
        B <= "0010";
        Ci <= '0';
        wait for 100ns;

        -- Test case 4
        A <= "0111";
        B <= "0010";
        Ci <= '1';
        wait for 100ns;
    end process;
end test;
