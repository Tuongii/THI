library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sosanh_test is
end sosanh_test;

architecture behavorial of sosanh_test is
component sosanh7485 is
	port(
		A:in std_logic_vector(3 downto 0);
		B:in std_logic_vector(3 downto 0);
	O:out std_logic_vector(2 downto 0)
		);
end component;
signal A:std_logic_vector(3 downto 0):="1010";
signal B:std_logic_vector(3 downto 0):="1010";

signal O:std_logic_vector(2 downto 0);

 begin 
	DUT: sosanh7485 
		port map(
			A=>A,
			B=>B,

			O=>O
			);
	sosanh: process
		begin
		A<="1010";
		B<="0110";

		wait for 10ns;
		
		A<="0011";
		B<="0101";

		wait for 10ns;
		
		A<="1001";
		B<="1000";

		wait for 10ns;
				A<="1000";
		B<="1000";

		wait for 10ns;
		

	end process;
end behavorial;