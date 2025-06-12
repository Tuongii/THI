library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dec_3to8 is
	port(
		A: in std_logic_vector(2 downto 0);
		E: in std_logic;
		E1: in std_logic;
		E2: in std_logic;
		Y: out std_logic_vector(7 downto 0)
		);
end dec_3to8;

architecture dataflow of dec_3to8 is
	begin 
		process(A,E,E1,E2)
			begin 
				if (E = '1' and E1 = '0' and E2= '0') then
					case A is 
			when "000" => Y <="11111110";
			when "001" => Y <="11111101";
			when "010" => Y <="11111011";
			when "011" => Y <="11110111";
			when "100" => Y <="11101111";
			when "101" => Y <="11011111";
			when "110" => Y <="10111111";
			when "111" => Y <="01111111";
			when others=> Y <="11111111";
					end case;
				else Y <= "11111111";
				end if;
		end process;
end dataflow;
