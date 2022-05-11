--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:49:18 03/01/2022
-- Design Name:   
-- Module Name:   C:/Users/Asak Computer/Desktop/SPIVHDL/spiiii/top_test.vhd
-- Project Name:  spiiii
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_test IS
END top_test;
 
ARCHITECTURE behavior OF top_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         CLk : IN  std_logic;
         XSS : IN  std_logic;
         MOSI : IN  std_logic;
         clock_in : IN  std_logic;
         MISO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLk : std_logic := '0';
   signal XSS : std_logic := '0';
   signal MOSI : std_logic := '0';
   signal clock_in : std_logic := '0';

 	--Outputs
   signal MISO : std_logic;

   -- Clock period definitions
   constant CLk_period : time := 10 ns;
   constant clock_in_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          CLk => CLk,
          XSS => XSS,
          MOSI => MOSI,
          clock_in => clock_in,
          MISO => MISO
        );

   -- Clock process definitions
   CLk_process :process
   begin
		CLk <= '0';
		wait for CLk_period/2;
		CLk <= '1';
		wait for CLk_period/2;
   end process;
 
   clock_in_process :process
   begin
		clock_in <= '0';
		wait for clock_in_period/2;
		clock_in <= '1';
		wait for clock_in_period/2;
   end process;
	xssprocess : process
	begin
 XSS<= '1' ;
 wait for 13 ns ;
 XSS<= '0';
 wait;



end process;
   -- Stimulus process
  
	stim_proc1: process
   begin	
	wait for 20 ns;
	   MOSI<='1';
	 wait for 100 ns;
	   MOSI<='0';
wait for 100 ns;
	   MOSI<='1';
wait for 100 ns;
	   MOSI<='0';
wait for 100 ns;
	   MOSI<='0';
		wait for 100 ns;
	   MOSI<='1';
		wait for 100 ns;
	   MOSI<='0';
		wait for 100 ns;
	   MOSI<='1';
		 wait for 100 ns;
	   MOSI<='0';
wait for 100 ns;
	   MOSI<='1';
wait for 100 ns;
	   MOSI<='0';
wait for 100 ns;
	   MOSI<='0';
		wait for 100 ns;
	   MOSI<='1';
		wait for 100 ns;
	   MOSI<='0';
		wait for 100 ns;
	   MOSI<='1';
		 wait for 100 ns;
	   MOSI<='0';
wait for 100 ns;
	   MOSI<='1';
wait for 100 ns;
	   MOSI<='0';
wait for 100 ns;
	   MOSI<='0';
		wait for 100 ns;
	   MOSI<='1';
		wait for 100 ns;
	   MOSI<='0';
		wait for 100 ns;
	   MOSI<='1';
		
		
      wait;
		end process;

END;
