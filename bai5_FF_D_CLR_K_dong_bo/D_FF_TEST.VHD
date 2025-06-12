    LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_ARITH.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;

    ENTITY D_FF_TEST is
    END ENTITY;

    ARCHITECTURE TEST OF D_FF_TEST is
        COMPONENT D_FF is
            PORT(
                SET,CLR : IN STD_LOGIC;
                CLK     : IN STD_LOGIC;
                D       : IN STD_LOGIC;
                Q       : OUT STD_LOGIC;
                NQ      : OUT STD_LOGIC
            );
        END COMPONENT;

    SIGNAL SET : STD_LOGIC ;
    SIGNAL CLR : STD_LOGIC ;
    SIGNAL CLK : STD_LOGIC := '0';
    SIGNAL D    : STD_LOGIC := '1';
    SIGNAL Q,NQ    : STD_LOGIC;

    BEGIN 
        U1: PROCESS
            BEGIN
                WHILE TRUE LOOP
                    CLK <= '0';
                    WAIT FOR 50 ns;
                    CLK <= '1';
                    WAIT FOR 50 ns;
                END LOOP;
        END PROCESS;


            create_input: process
                begin
                    SET <= '0'; CLR <= '0';
                    wait for 13 ns;
	------------------------
                    SET <= '1'; CLR <= '0';
                    wait for 13 ns;
	------------------------
                    SET <= '1'; CLR <= '1'; D <= '1';
                    wait for 13 ns;
	------------------------
                    D <= '0';
                    wait for 13 ns;
            end process create_input;
        DUT: COMPONENT D_FF
            PORT MAP(
                SET => SET,
                CLR => CLR,
                CLK => CLK,
                D   => D,
                Q   => Q,
                NQ  => NQ
            );
    END ARCHITECTURE;

