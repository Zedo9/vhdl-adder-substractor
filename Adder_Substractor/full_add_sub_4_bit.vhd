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
singal b0x, b1x, b2x, b3x : STD_LOGIC;
singal c0, c1, c2, c3, c4 : STD_LOGIC;
singal ovf_m : STD_LOGIC;
BEGIN
c0 <= M;
--Add/Sub xor
xor_0: xor_custom port map (B(0) => a, M => b, b0x ->s);
xor_1: xor_custom port map (B(1) => a, M => b, b1x ->s);
xor_2: xor_custom port map (B(2) => a, M => b, b2x ->s);
xor_3: xor_custom port map (B(3) => a, M => b, b3x ->s);
xor_3: xor_custom port map (B(3) => a, M => b, b3x ->s);
--ovf xor
xor_4: xor_custom port map (c4 => a, c3 => b, ovf_m ->s);
--mux
mux: mux port map(M => sel, in_0 => c4, in_1 => ovf_m, MCOV => s);
--Adders
add_0: full_add port map(A(0) => a, b0x => b, c0 => cin, S(0)=>s, c1 => cout);
add_1: full_add port map(A(1) => a, b1x => b, c1 => cin, S(1)=>s, c2 => cout);
add_2: full_add port map(A(2) => a, b2x => b, c2 => cin, S(2)=>s, c3 => cout);
add_3: full_add port map(A(3) => a, b3x => b, c3 => cin, S(3)=>s, c4 => cout);
CF <= c4;
OVF <= ovf_m;
END behavior ;
