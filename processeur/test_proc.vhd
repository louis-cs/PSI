--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:56:22 05/25/2020
-- Design Name:   
-- Module Name:   C:/Users/HAL/PSI2/test_proc.vhd
-- Project Name:  PSI2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processor
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
 
ENTITY test_proc IS
END test_proc;
 
ARCHITECTURE behavior OF test_proc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processor
    PORT(
         aIP : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aIP : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '1';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processor PORT MAP (
          aIP => aIP,
          CLK => CLK,
          RST => RST,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		-- hold reset state for 100 ns.
		wait for 100 ns;	

		wait for CLK_period*10;

		aIP <= X"00";
		wait for 100 ns;
		aIP <= X"01";
		wait for 100 ns;
		aIP <= X"02";
		wait for 100 ns;
		aIP <= X"03";
		wait for 100 ns;
		aIP <= X"04";
		wait for 100 ns;
		aIP <= X"05";
		wait for 100 ns;
		aIP <= X"06";
		wait for 100 ns;
		aIP <= X"07";
		wait for 100 ns;
		aIP <= X"08";
		wait for 100 ns;
		aIP <= X"09";
		wait for 100 ns;
		aIP <= X"10";
		wait for 100 ns;
		aIP <= X"11";

		wait;
   end process;
END;
