library ieee;
use ieee.std_logic_1164.all;

entity test is
end entity;

architecture test_th of test is
    signal sh_in  : std_logic_vector(7 downto 0);
    signal sh_val : std_logic_vector(2 downto 0);
    signal sh_out : std_logic_vector(7 downto 0);
    
    component rol_c is
        port (
            sh_in  : in  std_logic_vector(7 downto 0);
            sh_val : in  std_logic_vector(2 downto 0);
            sh_out : out std_logic_vector(7 downto 0)
        );
    end component;

begin 
    uut: rol_c
        port map (
            sh_in  => sh_in,
            sh_val => sh_val,
            sh_out => sh_out
        );
    
    cre_data: process
    begin
        sh_in  <= "11111000";
        sh_val <= "010";
        wait for 20 ns;

        sh_in  <= "00111011";
        sh_val <= "110";
        wait for 20 ns;

        sh_in  <= "10010011";
        sh_val <= "101";
        wait for 20 ns;

        sh_in  <= "00011001";
        sh_val <= "100";
        wait for 20 ns;
        wait;
    end process cre_data;
end architecture test_th;
