library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dec_3to8_test is
end dec_3to8_test;

architecture test of dec_3to8_test is
	component dec_3to8
	port(
		A : in std_logic_vector(2 downto 0);
		E : in std_logic;
		E1: in std_logic;
		E2: in std_logic;
		Y : out std_logic_vector(7 downto 0)
		);
	end component;
	signal A: std_logic_vector(2 downto 0):="000";
	signal E: std_logic:='1';
	signal E1: std_logic:='0';
	signal E2: std_logic :='0';
	signal Y: std_logic_vector(7 downto 0) :=(others => '0');
	
	begin 
		DUT: component dec_3to8 
			port map(
				A =>A,
				E =>E,
				E1 =>E1,
				E2 =>E2,
				Y => Y
				);
		input: process
			begin 
				E <= '1';
				E1<= '0';
				E2<= '0';
				A<="000";
				wait for 50ns;
				
				A <= "101";
				wait for 50ns;
				
				A<="111";
				wait for 50ns;
				
				A<="011";
				wait for 50ns;
				
				E<='0';
				E1<= '1';
				E2<='0';
				A<= "100";
				wait for 50ns;
				
				E<='1';
				E1<= '0';
				E2<='0';
				A<= "110";
		end process;
end test;
				