---TEST FULL ADD---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity
ENTITY full_add_tb IS
end full_add_tb;
Architecture test of full_add_tb is
component full_add
port(A : in std_logic;
     B : in std_logic;
     Cin : in std_logic;
     S : out std_logic;
     Cout : out std_logic);
end component;
signal A_tb,B_tb,Cin_tb,S_tb,Cout_tb : std_logic;
Begin 
DUT : full_add port MAP (A=>A_tb,
                         B=>B_tb,
                         Cin=>Cin_tb,
                         S=>S_tb,
                         Cout=>Cout_tb);
process
begin 
A_tb<='0'; B_tb<='0' ;Cin_tb<='0';
wait for 20 ns;
A_tb<='1';
wait for 20 ns;
A_tb<='0'; B_tb<='1';
wait for 20 ns;
A_tb<='1';
wait for 20 ns;
A_tb<='0'; B_tb<='0';Cin_tb<='1';
wait for 20 ns;
A_tb<='1';
wait for 20 ns;
A_tb<='0'; B_tb<='1';
wait for 20 ns;
A_tb<='1';
wait for 20 ns;
end process;
end test;
