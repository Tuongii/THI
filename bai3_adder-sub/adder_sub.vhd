library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder_sub is
	port(
		A: in std_logic_vector(3 downto 0);
		B:in std_logic_vector(3 downto 0);
		Sub: in std_logic;
		Cin: in std_logic;
		Sum:out std_logic_vector(3 downto 0);
		Cout:out std_logic
		);
end adder_sub;

architecture behavioral of adder_sub is
	signal A_temp : std_logic_vector(4 downto 0);
	signal B1_temp 	: std_logic_vector(3 downto 0);
	signal B2_temp	: std_logic_vector(4 downto 0);
	signal Cin_temp : std_logic;
	signal Sum_temp : std_logic_vector(4 downto 0);
		begin 
			Cin_temp <= Sub or Cin;
			--chọn MUX
			MUX: process(B,Sub)
				begin 
					if Sub ='1' then 
					B1_temp <=  not B ;
					else  B1_temp <= B;
					end if;
				end process MUX;
				--mở rộng 5  bit tránh tràn 
			A_temp <= '0' & A;
			B2_temp <= '0' & B1_temp;
			Sum_temp<= A_temp + B2_temp +Cin_temp;
			Cout <= Sum_temp(4);
			Sum <= Sum_temp(3 downto 0);
end behavioral;
					