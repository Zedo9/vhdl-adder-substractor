Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

Entity full_add_sub_4_bit is
Port ( 
  A : in STD_LOGIC_VECTOR(3 downto 0);
  B : in STD_LOGIC_VECTOR(3 downto 0);
  M : in STD_LOGIC ;
  S : out STD_LOGIC_VECTOR(3 downto 0);
  CF : out STD_LOGIC ;
  OVF : out STD_LOGIC ;
  MCOV : out STD_LOGIC );
End full_add_sub_4_bit; 
Architecture behavior of full_add_sub_4_bit is
--mux
component mux
port ( 
  sel : in STD_LOGIC ;
  in_0 : in STD_LOGIC ;
  in_1 : in STD_LOGIC ;
  s : out STD_LOGIC );
end component;
--adder
component full_add
Port ( 
  a : in STD_LOGIC ;
  b : in STD_LOGIC ;
  cin : in STD_LOGIC ;
  S : out STD_LOGIC ;
  cout : out STD_LOGIC);
end component;
--xor
component xor_custom
Port ( 
  a : in STD_LOGIC ;
  b : in STD_LOGIC ;
  s : out STD_LOGIC );
end component;
-- signals
singal b0x, b1x, b2x, b3x : STD_LOGIC_VECTOR(3 downto 0);
singal c0, c1, c2, c3, c4 : STD_LOGIC(4 downto 0);
singal ovf_m : STD_LOGIC;
BEGIN
c(0) <= M;
--Add/Sub xor
gen1: for i in 0 to 3 generate 
xor_custom port map(B(i) => a, M => b, b(i) => s)
end generate gen1;
--ovf xor
xor_4: xor_custom port map (c4 => a, c3 => b, ovf_m ->s);
--mux
mux: mux port map(M => sel, in_0 => c4, in_1 => ovf_m, MCOV => s);
--Adders
gen2 : for i in 0 to 3 generate
full_add port map(A(i) => a, b(i)=> b, c(i) => cin, S(i) => s, c(i+1) => cout );
end generate gen2;
CF <= c(4);
OVF <= ovf_m;
END behavior ;
