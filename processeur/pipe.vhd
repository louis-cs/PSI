----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:33 05/19/2020 
-- Design Name: 
-- Module Name:    pipe - Behavioral 
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

entity pipe is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Out_A : out  STD_LOGIC_VECTOR (7 downto 0);
           Out_OP : out  STD_LOGIC_VECTOR (7 downto 0);
           Out_B : out  STD_LOGIC_VECTOR (7 downto 0);
			  Out_C : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
end pipe;

architecture Behavioral of pipe is
begin

process
begin

	wait until CLK'event and CLK='1' ;
	
	Out_A <= A;
	Out_OP <= OP;
	Out_B <= B;
	Out_C <= C;
	
end process;

end Behavioral;

