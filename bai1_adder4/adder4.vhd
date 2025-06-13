-------------------------------------------------------- 
--------------- 4-bit adder (adder4.vhd) ---------------
------------ Duong Huy Hoang - Thong tin 55 ------------
-------------------------------------------------------- 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
-------------------------------------------------------- 
entity adder4 is 
port(A   : in  std_logic_vector(3 downto 0);  
     B   : in  std_logic_vector(3 downto 0); 
     Ci  : in  std_logic;  
     Sum : out std_logic_vector(3 downto 0);  
     Co  : out std_logic);  
end adder4;
-------------------------------------------------------- 
architecture dataflow of adder4 is 
signal C : std_logic_vector(2 downto 0); 
component full_adder  
port(A   : in  std_logic; 
     B   : in  std_logic; 
     Cin : in  std_logic; 
     S   : out std_logic; 
     Cout: out std_logic); 
end component; 
begin 
    u0: component full_adder
		port map(A => A(0), B => B(0), Cin => Ci, 
				 S => Sum(0), Cout => C(0)); 
    u1: component full_adder  
        port map(A => A(1), B => B(1), Cin => C(0), 
				 S => Sum(1), Cout => C(1));  
    u2: component full_adder  
        port map(A => A(2), B => B(2), Cin => C(1), 
				 S => Sum(2), Cout => C(2));  
    u3: component full_adder  
        port map(A => A(3), B => B(3), Cin => C(2), 
				 S => Sum(3), Cout => Co); 
end dataflow; 
--------------------------------------------------------