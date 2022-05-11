----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:43 03/01/2022 
-- Design Name: 
-- Module Name:    spi - Behavioral 
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

entity spi is
Port ( CLk 		: in  STD_LOGIC:='0';
           XSS 		: in  STD_LOGIC:='1';
           MOSI 		: in  STD_LOGIC:='0';
			  clock_in  : in  STD_LOGIC:='0';  --SPI master clock
           MISO 		: out STD_LOGIC:='0';
			  End_Shift_SPI 		: out STD_LOGIC:='0';
           Read_Ram_in_Spi 	: in  STD_LOGIC_VECTOR (7 downto 0):= ( others => '0'); 
           Out_Spi_Write_Ram 	: out STD_LOGIC_VECTOR (7 downto 0):= ( others => '0') );
end spi;

architecture Behavioral of spi is

signal ShiftCounter  : integer range 0 to 8 := 0;
signal ShiftRegister : std_logic_vector( 7 downto 0) := ( others => '0');
signal StartSpi : std_logic := '0';
signal SPIclock : std_logic := '0';
signal SPI_clock : std_logic_vector(1 downto 0) :=(others => '0');

begin

clock_in_SPI:process(CLK)
begin
if rising_edge (CLK) then
SPI_clock(0) <= clock_in;
spi_clock(1) <= SPI_clock(0);
end if;
end process;

SPIclock <= SPI_clock(0) and (SPI_clock(0) xor SPI_clock(1));
startspi <= not(XSS);
SPI_control : process(CLK)
begin
if rising_edge (CLK) then

	if (startspi = '1') then
		if (shiftcounter =0) then
		shiftregister <= Read_ram_in_spi;
		MISO <=Read_ram_in_spi(7);
		end if;
		if (shiftcounter > 0) then
		MISO <=shiftregister(7);
		end if;
		if (SPIclock = '1') then
			--MISO <=shiftregister(6);
			ShiftRegister <=  ShiftRegister(6 downto 0) & MOSI;
			
			ShiftCounter <= ShiftCounter + 1;
			if ( shiftcounter = 7 ) then
				End_Shift_SPI<= '1';
				Out_Spi_Write_Ram <=  ShiftRegister(6 downto 0) & MOSI;
			end if;
			else if (shiftcounter = 8 ) then
				--shiftregister <= Read_ram_in_spi;
				End_Shift_SPI<= '0';
				shiftcounter <= 0;
			end if;
		end if;
	end if;
end if;

end process;

end Behavioral;

