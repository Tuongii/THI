library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		A 	: in std_logic;
		B 	: in std_logic;
		Cin : in std_logic;
		S 	: out std_logic;
		Cout: out std_logic
		);
end full_adder;

architecture dataflow of full_adder is
	begin
		S 	<= A xor B xor Cin;
		Cout <= (A and B) or (Cin and ( A or B));
	end dataflow;
end full_adder;