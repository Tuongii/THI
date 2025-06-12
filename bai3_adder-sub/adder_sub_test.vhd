library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder_sub_test is 
end adder_sub_test;

architecture test of adder_sub_test is
	component adder_sub is
		port(
			A	: in  std_logic_vector(3 downto 0);
			B	: in  std_logic_vector(3 downto 0);
			Sum : out std_logic_vector(3 downto 0);
			Sub : in  std_logic;
			Cin : in  std_logic;
			Cout: out std_logic);
	end component;
	
signal A	: std_logic_vector(3 downto 0):="0110";
signal B	: std_logic_vector(3 downto 0):="0001";
signal Sum  : std_logic_vector(3 downto 0):="0000";
	signal Sub : std_logic:= '0';
	signal Cin : std_logic:= '0';
	signal Cout : std_logic:= '0';
	
	begin 
		DUT: component adder_sub
			port map(
			A => A,
			B => B,
			Sum => Sum,
			Cin => Cin,
			Sub => Sub,
			Cout => Cout
			);
		input : process
		begin 
		A <= "0110"; B <= "0001";
		sub <= '0'; cin <= '0';
		wait for 100 ns;
		----------------
		A <= "0011"; B <= "0001";
		sub <= '1'; cin <= '0';
		wait for 100 ns;
		----------------
		A <= "0011"; B <= "0001";
		sub <= '0'; cin <= '1';
		wait for 100 ns;
		----------------
		A <= "1001"; B <= "1011";
		sub <= '0'; cin <= '0';
		wait for 100 ns;
		----------------
		A <= "1001"; B <= "0101";
		sub <= '1'; cin <= '0';
		wait for 100 ns;
		----------------
		A <= "1001"; B <= "0011";
		sub <= '0'; cin <= '1';
		wait for 100 ns;
		
	end process;
end test;
	