library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity JK_FF is
    port(
        J,K     : in std_logic;
        CLK    : in std_logic;
        SET ,CLR : in std_logic;
        Q       : out std_logic;
        NQ      : out std_logic
    );
END entity;

architecture behaviroral of JK_FF is
    signal Q1 : std_logic;
    begin
        process(J,K,CLK,SET,CLR)
            begin
                IF CLR='1' THEN Q1 <= '0';
                ELSIF SET ='1' THEN Q1 <= '1';
                ELSIF CLR = '0' AND SET ='0' THEN
                    IF falling_EDGE(CLK) THEN
                        IF J ='1' AND K = '0' THEN Q1 <= '1';
                        ELSIF J ='0' AND K = '1' THEN Q1 <= '0';
                        ELSIF J ='1' AND K = '1' THEN Q1 <= NOT Q1;
                        END IF;
                    END IF;
                END IF;
        END PROCESS;
        Q <= Q1 ;
        NQ <= NOT Q1;
END behaviroral;



