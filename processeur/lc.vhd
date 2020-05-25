----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:55:17 05/24/2020 
-- Design Name: 
-- Module Name:    lc - Behavioral 
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

entity lc is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           W : out  STD_LOGIC_VECTOR (3 downto 0));
end lc;

architecture Behavioral of lc is

begin
W <= 	"0011" when OP = X"01" else	-- ADD 
		"0101" when OP = X"02" else 	-- MUL
		"0111" when OP = X"03" else 	-- SOU
		"1001" when OP = X"04" else	-- DIV
		"0001" when OP = X"06" or OP=X"05" or OP = X"07" else --AFC COP LOAD
		"0000" when OP=X"08"; 			-- STORE
		
end Behavioral;
