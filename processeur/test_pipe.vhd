--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:11:08 05/26/2020
-- Design Name:   
-- Module Name:   C:/Users/HAL/PSI2/test_pipe.vhd
-- Project Name:  PSI2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pipe
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
 
ENTITY test_pipe IS
END test_pipe;
 
ARCHITECTURE behavior OF test_pipe IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pipe
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         OP : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         C : IN  std_logic_vector(7 downto 0);
         Out_A : OUT  std_logic_vector(7 downto 0);
         Out_OP : OUT  std_logic_vector(7 downto 0);
         Out_B : OUT  std_logic_vector(7 downto 0);
         Out_C : OUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal OP : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal C : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal Out_A : std_logic_vector(7 downto 0);
   signal Out_OP : std_logic_vector(7 downto 0);
   signal Out_B : std_logic_vector(7 downto 0);
   signal Out_C : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pipe PORT MAP (
          A => A,
          OP => OP,
          B => B,
          C => C,
          Out_A => Out_A,
          Out_OP => Out_OP,
          Out_B => Out_B,
          Out_C => Out_C,
          CLK => CLK
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

		A <= X"00";
		OP <= X"01";
		B <= X"02";
		C <= X"03";

      wait;
   end process;

END;
