----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:12:59 05/24/2020 
-- Design Name: 
-- Module Name:    MD - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MD is
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
           ENTREE : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SORTIE : out STD_LOGIC_VECTOR (7 downto 0));
end MD;

architecture Behavioral of MD is

	type data_array is array (integer range 31 downto 0) of std_logic_vector (7 downto 0);
	signal data: data_array := (others => X"00") ;

begin
process
begin

	wait until CLK'event and CLK = '0' ;
	
	if (RST='0') then
		data <= (others => X"00") ;
	else
		if (RW = '0') then
			data(to_integer(UNSIGNED(ADDRESS))) <= ENTREE; 
		else
			SORTIE <= data(to_integer(UNSIGNED(ADDRESS))) ; 
		end if ;
	end if ;
	
end process ;

end Behavioral;

