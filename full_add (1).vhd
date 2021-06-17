-- Additionneur complet 1-bit
Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

Entity full_add is
Port ( 
  a : in STD_LOGIC ;
  b : in STD_LOGIC ;
  cin : in STD_LOGIC ;
  s : out STD_LOGIC ;
  cout : out STD_LOGIC) ;
End full_add; 
Architecture behavior of full_add is 
BEGIN
S <= A XOR B XOR Cin;
Cout <= (A AND B) OR (Cin AND (A XOR B));
END behavior ;
