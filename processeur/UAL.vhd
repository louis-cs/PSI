----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:58:33 04/20/2020 
-- Design Name: 
-- Module Name:    UAL - Behavioral 
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

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0));
end UAL;

architecture Behavioral of UAL is

signal tmp : STD_LOGIC_VECTOR (15 downto 0):= (Others => '0');
signal tmp_A : STD_LOGIC_VECTOR (8 downto 0):= (Others => '0');
signal tmp_B : STD_LOGIC_VECTOR (8 downto 0):= (Others => '0');

begin

	tmp_A <= (b"0" & A);
	tmp_B <= (b"0" & B);
	
	tmp <=  (b"0000000"&(tmp_A + tmp_B)) when Ctrl_Alu = "001" -- ADD 
	else (b"0000000"&(tmp_A - tmp_B)) when Ctrl_Alu = "011" -- SOU 
	else A * B when Ctrl_Alu = "010" -- MUL
	else "0000000000000000";
	
	S <= tmp(7 downto 0);
	O <= '0';
	Z <= '1' when tmp(7 downto 0) = "00000000" else '0'; 
	C <= tmp(8);
	N <= '0';
	
end Behavioral;

