library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity intrrupt_module is
    Port (
	 clk: in  STD_LOGIC;
	 int_Pol: in  STD_LOGIC;
	 X_int:out  STD_LOGIC;
	 IAR : in  STD_LOGIC_Vector(15 downto 0);
	 IRR : in  STD_LOGIC_Vector(15 downto 0);
	 IMR : in  STD_LOGIC_Vector(15 downto 0);
	 IR : out  STD_LOGIC_Vector(15 downto 0));
end intrrupt_module;

architecture Behavioral of intrrupt_module is
Signal T_IMR :STD_LOGIC_Vector(15 downto 0);
Signal T_IR :STD_LOGIC_Vector(15 downto 0);
Signal T_IRR :STD_LOGIC_Vector(15 downto 0);
Signal T_IAR :STD_LOGIC_Vector(15 downto 0);
Signal T2_IR :STD_LOGIC_Vector(15 downto 0);
Signal or_ir: STD_LOGIC;
begin

PROCESS(clk)
  BEGIN                                      
   IF(clk'EVENT AND clk = '1') THEN
			T_IMR<=IMR;
			T2_IR<=T_IR;
			T_IAR<=IAR;
			
	end if;
end process;
	 
	 T_IRR <=IRR and ( not T_IAR);
    T_IR <= T_IRR and ( not T_IMR);

	 IR<= T2_IR;

	 or_ir<= T2_IR (15) or 
				T2_IR (14) or 
				T2_IR (13) or 
				T2_IR (12) or 
				T2_IR (11) or 
				T2_IR (10) or 
				T2_IR (9) or 
				T2_IR (8) or  
				T2_IR (7) or 
				T2_IR (6) or 
				T2_IR (5) or 
				T2_IR (4) or 
				T2_IR (3) or 
				T2_IR (2) or 
				T2_IR (1) or 
				T2_IR (0);

X_int <= or_ir Xor int_Pol;

end Behavioral;

