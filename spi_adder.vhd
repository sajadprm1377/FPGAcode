----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:41 03/01/2022 
-- Design Name: 
-- Module Name:    adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library ieee; 
 use ieee.std_logic_1164.all;  
 use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
           En : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;

           B : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0')
           );
end adder;

architecture Behavioral of adder is


signal tmp: std_logic_vector(7 downto 0);
 begin  
 
 
 process (clk)
 begin
 if (clk='1' and clk'event) then
 if (En ='1') then
 if (A < 30 ) then
 tmp <= A + 30;
 
 else if (A < 60 ) then
 tmp <= A + 60;
 
 else if (A <90 ) then
 tmp <= A + 90;
 
 else if (A > 90) then
 tmp <= A - 90;
 end if;
 end if;
 end if;
 end if;
 
 --tmp <=  A + 1 ;
end if;
end if;
end process;

B<=tmp;


end Behavioral;

