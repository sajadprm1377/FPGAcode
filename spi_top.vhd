----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:37 03/01/2022 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
Port ( CLk 		: in  STD_LOGIC:='0';  --main clock
           XSS 		: in  STD_LOGIC:='1';
           MOSI 		: in  STD_LOGIC:='0';
			  clock_in  : in  STD_LOGIC:='0';  --SPI master clock
           MISO 		: out STD_LOGIC:='0');
			  --ledd : out std_logic:='0' );
--			  End_Shift_SPI 		: out STD_LOGIC:='0';
--           Read_Ram_in_Spi 	: in  STD_LOGIC_VECTOR (7 downto 0):= ( others => '0'); 
--           Out_Spi_Write_Ram 	: out STD_LOGIC_VECTOR (7 downto 0):= ( others => '0') );



end top;

architecture Behavioral of top is

component SPI 
    Port ( CLk 		: in  STD_LOGIC:='0';  --main clock
           XSS 		: in  STD_LOGIC:='1';
           MOSI 		: in  STD_LOGIC:='0';
			  clock_in  : in  STD_LOGIC:='0';  --SPI master clock
           MISO 		: out STD_LOGIC:='0';
			  End_Shift_SPI 		: out STD_LOGIC:='0';
           Read_Ram_in_Spi 	: in  STD_LOGIC_VECTOR (7 downto 0):= ( others => '0'); 
           Out_Spi_Write_Ram 	: out STD_LOGIC_VECTOR (7 downto 0):= ( others => '0'));
				--ledd : out std_logic:='0' 	  );
end component;

component adder 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0');
           En : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;

           B : out  STD_LOGIC_VECTOR (7 downto 0):=(others=>'0')
           );
end component;

signal Out_Spi_Write_Ram_temp 	:  STD_LOGIC_VECTOR (7 downto 0):= ( others => '0');
signal End_Shift_SPI_temp 		:  STD_LOGIC:='0';
signal Read_Ram_in_Spi_temp 	:   STD_LOGIC_VECTOR (7 downto 0):= ( others => '0'); 

begin



c0: SPI port map ( clk=>clk,XSS=>XSS,MOSI=>MOSI,clock_in=>clock_in,MISO=>MISO,End_Shift_SPI=>End_Shift_SPI_temp,Read_Ram_in_Spi=>Read_Ram_in_Spi_temp,Out_Spi_Write_Ram=>Out_Spi_Write_Ram_temp );

c1: adder port map (Out_Spi_Write_Ram_temp, End_Shift_SPI_temp,clk,Read_Ram_in_Spi_temp); 




end Behavioral;

