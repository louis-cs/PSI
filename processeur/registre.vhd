----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:39 05/04/2020 
-- Design Name: 
-- Module Name:    registre - Behavioral 
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

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registre is
    Port ( aA : in  STD_LOGIC_VECTOR (3 downto 0);
           aB : in  STD_LOGIC_VECTOR (3 downto 0);
			  aW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end registre;

architecture Behavioral of registre is

type reg_array is array (15 downto 0) of STD_LOGIC_VECTOR (7 downto 0);
signal reg : reg_array := (others => (others=>'0'));

signal tmp_QA : STD_LOGIC_VECTOR (8 downto 0):= (Others => '0');
signal tmp_QB : STD_LOGIC_VECTOR (8 downto 0):= (Others => '0');

begin		
	write: process
	begin
			wait until CLK'event and CLK = '1';	
			if RST = '0' then
				reg <= (others => X"00");
			elsif W = '1' then
				reg(to_integer(unsigned(aW))) <= DATA;
			end if;
	end process write;

	read: process(aA, aB)
	begin	

		if W = '1' then 
			-- si ecriture et lecture sur le même registre 
			if (aW = aA) then
				QA <= DATA; 
				QB <= reg(to_integer(unsigned(aB)));
			
			-- si ecriture et lecture sur le même registre 
			elsif (aW = aB) then
				QA <= reg(to_integer(unsigned(aA)));
				QB <= DATA;
			else
				QA <= reg(to_integer(unsigned(aA)));
				QB <= reg(to_integer(unsigned(aB)));
			end if;			
		else 
			QA <= reg(to_integer(unsigned(aA)));
			QB <= reg(to_integer(unsigned(aB)));
		end if;
		
	end process read;
	
end Behavioral;
