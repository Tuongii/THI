library ieee;
use ieee.std_logic_1164.all;

entity test is
end entity test;

architecture test_th of test is
    signal bin_code : std_logic_vector(2  downto 0) := "000";
    signal th_code : std_logic_vector(7 downto 0);

component bin_th is
    port(
        bin_code : in std_logic_vector(2 downto 0);
        th_code : out std_logic_vector(7 downto 0)
    );
end component bin_th;

begin 
    uut: bin_th
        port map(
            bin_code => bin_code,
            th_code => th_code
        );

    cre_data:process
        begin
            bin_code <= "000";
            wait for 20 ns;
            bin_code <= "001";
            wait for 20 ns;
            bin_code <= "010";
            wait for 20 ns;
            bin_code <= "011";
            wait for 20 ns;
            bin_code <= "100";
            wait for 20 ns;
            bin_code <= "101";
            wait for 20 ns;
            bin_code <= "110";
            wait for 20 ns;
            bin_code <= "111";
            wait for 20 ns;
            wait;
        end process;
end architecture test_th;