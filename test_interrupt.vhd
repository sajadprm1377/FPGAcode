--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:50:18 04/27/2022
-- Design Name:   
-- Module Name:   C:/Users/Asak Computer/Desktop/intrrupt/int/test_interrupt.vhd
-- Project Name:  int
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: intrrupt_module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_interrupt IS
END test_interrupt;
 
ARCHITECTURE behavior OF test_interrupt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT intrrupt_module
    PORT(
         clk : IN  std_logic;
         int_Pol : IN  std_logic;
         X_int : OUT  std_logic;
         IAR : IN  std_logic_vector(15 downto 0);
         IRR : IN  std_logic_vector(15 downto 0);
         IMR : IN  std_logic_vector(15 downto 0);
         IR : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal int_Pol : std_logic := '0';
   signal IAR : std_logic_vector(15 downto 0) := (others => '0');
   signal IRR : std_logic_vector(15 downto 0) := (others => '0');
   signal IMR : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal X_int : std_logic;
   signal IR : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: intrrupt_module PORT MAP (
          clk => clk,
          int_Pol => int_Pol,
          X_int => X_int,
          IAR => IAR,
          IRR => IRR,
          IMR => IMR,
          IR => IR
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

      IAR<="0000000000000000";
		IMR<="0000000000000000";
		IRR<="1111011101110111";
      wait for 100 ns;	
		IAR<="1110000000000000";
		IMR<="0000000000000000";
		IRR<="1111011101110111";
      wait for 100 ns;	

		IAR<="1111011100000000";
		IMR<="0000000000000000";
		IRR<="1111011101110111";
      wait for 100 ns;	

		IAR<="1111011101110000";
		IMR<="0000000000000111";
		IRR<="1111011101110111";
      wait for 100 ns;	


      wait;
   end process;

END;
