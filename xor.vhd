Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

Entity xor_custom is
Port ( 
  a : in STD_LOGIC ;
  b : in STD_LOGIC ;
  s : out STD_LOGIC );
End xor_custom; 

Architecture behavior of xor_custom is 
BEGIN
  s <= a XOR b;
END behavior ;