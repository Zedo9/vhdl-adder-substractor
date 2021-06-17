Library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;

Entity mux is
Port ( 
  sel : in STD_LOGIC ;
  in_0 : in STD_LOGIC ;
  in_1 : in STD_LOGIC ;
  s : out STD_LOGIC );
End mux; 

architecture behavior of mux is 
BEGIN
  p_mux: process(sel, in_0, in_1)
  begin
    case sel is
      when '0' => s <= in_0;
      when '1' => s <= in_1;
      when others => s <= '0' ;
    end case;
  end process p_mux;
END behavior ;