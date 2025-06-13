-------------------------------------------------- 
----------------- adder4_test.vhd ----------------
--------- Duong Huy Hoang - Thong tin 55 ---------
-------------------------------------------------- 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
-------------------------------------------------- 
entity adder4_test is 
end adder4_test; 
-------------------------------------------------- 
architecture test of adder4_test is 
component adder4 is 
port(A  : in  std_logic_vector(3 downto 0);  
     B  : in  std_logic_vector(3 downto 0); 
     Ci : in  std_logic; 
     Sum: out std_logic_vector(3 downto 0); 
     Co : out std_logic);  
end component; 
signal A  : std_logic_vector(3 downto 0):= "0000";  
signal B  : std_logic_vector(3 downto 0):= "0000"; 
signal Ci : std_logic:= '0'; 
signal Sum: std_logic_vector(3 downto 0); 
signal Co : std_logic; 
begin 
   DUT: component adder4      
       port map(A => A, B => B, Ci => Ci, 
				Sum => Sum, Co => Co);
	creat_input: process
	begin
		A <= "0101"; B <= "0110"; ci <= '0';
		wait for 100 ns;
		----------------
		A <= "0101"; B <= "0110"; ci <= '1';
		wait for 100 ns;
		----------------
		A <= "0111"; B <= "0010"; ci <= '0';
		wait for 100 ns;
		----------------
		A <= "0111"; B <= "0010"; ci <= '1';
		wait for 100 ns;
		----------------
	end process;
end test; 
-------------------------------------------------- 