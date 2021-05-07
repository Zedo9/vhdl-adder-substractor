---TEST FULL ADD---
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Entity
ENTITY full_add_sub__4_bit_tb IS
end full_add_sub__4_bit_tb;
Architecture test of full_add_sub__4_bit_tb is
component full_add_sub_4_bit
Port ( 
  A : in STD_LOGIC_VECTOR(3 downto 0);
  B : in STD_LOGIC_VECTOR(3 downto 0);
  M : in STD_LOGIC ;
  S : out STD_LOGIC_VECTOR(3 downto 0);
  CF : out STD_LOGIC ;
  OVF : out STD_LOGIC ;
  MCOV : out STD_LOGIC );
end component;
signal A_tb, B_tb, S_tb : STD_LOGIC_VECTOR (3 downto 0);
signal M_tb, CF_tb, OVF_tb, MCOV_tb : STD_LOGIC;
Begin 
DUT : full_add_sub_4_bit port MAP (
  A=>A_tb,
  B=>B_tb,
  M=>M_tb,
  S=>S_tb,
  CF=>CF_tb,
  OVF=>OVF_tb,
  MCOV=>MCOV_tb);
process
begin 

A_tb<='0110';
B_tb<='1110';
--Addition
M_tb<='0'
wait for 20 ns;
--soustraction
M_tb<='1';
wait for 20 ns;

A_tb<='1101';
B_tb<='0000';
--Addition
M_tb<='0'
wait for 20 ns;
--soustraction
M_tb<='1';
wait for 20 ns;

A_tb<='0000';
B_tb<='1111';
--Addition
M_tb<='0'
wait for 20 ns;
--soustraction
M_tb<='1';
wait for 20 ns;

end process;
end test;
