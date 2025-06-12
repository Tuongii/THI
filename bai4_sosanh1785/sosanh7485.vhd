library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sosanh7485 is
	port(
		A:in std_logic_vector(3 downto 0);
		B:in std_logic_vector(3 downto 0);
		I:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(2 downto 0)
		);
end entity;

architecture Behavioral of sosanh7485 is
begin 
	process(A,B,I)
		begin 
			if (A(3)>B(3)) then
				O<="100";
			elsif A(3)<B(3) then
				O<="010";
			elsif A(3)=B(3) then	
				if A(2)>B(2) then
				O<="100";
				elsif A(2)<B(2) then
				O<="010";
				elsif A(2)=B(2) then
						if A(1)>B(1) then
							O<="100";
						elsif A(1)<B(1) then
							O<="010";
						elsif A(1)=B(1) then
							if A(0)>B(0) then
								O<="100";
							elsif A(0)<B(0) then
								O<="010";
							elsif A(0)=B(0) then
								case I is 
									when "100"=>O<="100";
									when "010"=>O<="010";
									when "001"=>O<="001";
									when others=>O<="XXX";
								end case;
							end if;
						end if;
				end if;
			end if;
		end process;
	 end Behavioral;
					
				
									
