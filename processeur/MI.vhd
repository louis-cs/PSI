----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:54 05/18/2020 
-- Design Name: 
-- Module Name:    mi - Behavioral 
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

entity MI is
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           SORTIE : out  STD_LOGIC_VECTOR (31 downto 0));
end MI;

architecture Behavioral of mi is

	type instructions is array (integer range 255 downto 0) of std_logic_vector (31 downto 0);
	signal instru: instructions := (0 => X"04060700", 1 => X"05060800", 2 => X"06020405", others => X"00000000");
	
begin
process
begin

	wait until CLK'event and CLK='1'; 
		SORTIE <= instru(to_integer(unsigned(ADDRESS))); 
	end process ; 

end Behavioral;
