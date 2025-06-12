library ieee;
use ieee.std_logic_1164.all;

entity test is
end test;

architecture test_enc of test is

    component prio_enc
        port(
            i_vector : in std_logic_vector(7 downto 0);
            pos : out std_logic_vector(2 downto 0);
            found : out std_logic
        );
    end component;

    signal i_vector : std_logic_vector(7 downto 0):= "00000000";
    signal pos : std_logic_vector(2 downto 0);
    signal found : std_logic;
begin
    uut: prio_enc
        port map (
            i_vector => i_vector,
            pos => pos,
            found => found
        );

    cre_data: process
    begin
        -- Test case 1: All bits are '0'
        i_vector <= "00000000";
        wait for 20 ns;

        -- Test case 2: First bit is '1'
        i_vector <= "10000000";
        wait for 20 ns;

        -- Test case 3: Second bit is '1'
        i_vector <= "01000000";
        wait for 20 ns;

        -- Test case 4: Third bit is '1'
        i_vector <= "00100000";
        wait for 20 ns;

        -- Test case 5: Fourth bit is '1'
        i_vector <= "00010000";
        wait for 20 ns;

        -- Test case 6: Fifth bit is '1'
        i_vector <= "00001000";
        wait for 20 ns;

        -- Test case 7: Sixth bit is '1'
        i_vector <= "00000100";
        wait for 20 ns;

        -- Test case 8: Seventh bit is '1'
        i_vector <= "00000010";
        wait for 20 ns;

        -- Test case 9: Eighth bit is '1'
        i_vector <= "00000001";
        wait for 20 ns;

        i_vector <= "00010001";
        wait for 20 ns;

        i_vector <= "10010000";
        wait for 20 ns;

        i_vector <= "00110000";
        wait for 20 ns;

        i_vector <= "00001100";
        wait for 20 ns;

        wait;
    end process;
end test_enc;