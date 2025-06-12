-------------------------------------------------------- 
-------- jk_flipflop_test (jk_flipflop_test.vhd) -------
------------ Duong Huy Hoang - Thong tin 55 ------------
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------------------------------
entity jk_flipflop_test is
end jk_flipflop_test;
--------------------------------------------------------
architecture test of jk_flipflop_test is
component JK_FF
port(J  : in  std_logic;
	 K  : in  std_logic;
	 CLK: in  std_logic;
	 SET: in  std_logic;
	 CLR: in  std_logic;
	 Q  : out std_logic;
	 NQ : out std_logic);
end component;
signal J	: std_logic:='0';
signal K	: std_logic:='0';
signal CLK  : std_logic:='0';
signal SET 	: std_logic:='0';
signal CLR	: std_logic:='0';
signal Q	: std_logic:='0';
signal NQ	: std_logic:='0';
begin
	DUT: component JK_FF
		port map(
            J => J,
            K => K, 
            CLK => CLK, 
            SET => SET,
			CLR => CLR, 
            Q => Q,
            NQ => NQ
            );
	create_clock: process  
    begin 
        CLK <= '0'; 
        wait for 10 ns; 
        CLK <= '1'; 
        wait for 10 ns; 
    end process create_clock;
	create_input: process
	begin
	CLR <= '1'; SET <= '0';
	wait for 13 ns;
	------------------------
	SET <= '1'; CLR <= '0';
	wait for 13 ns;
	------------------------
	SET <= '0'; CLR <= '0'; J <= '1'; K <= '0';
	wait for 13 ns;
	------------------------
	J <= '0'; K <= '1';
	wait for 13 ns;
	------------------------
	J <= '1'; K <= '1';
	wait for 13 ns;
	------------------------
	end process create_input;
end test;