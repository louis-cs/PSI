-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY proc_test IS
  END proc_test;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT processor
					 Port ( aIP : in  STD_LOGIC_VECTOR (7 downto 0);
							  CLK : in  STD_LOGIC;
							  RST : in  STD_LOGIC;
							  QA : out  STD_LOGIC_VECTOR (7 downto 0);
							  QB : out  STD_LOGIC_VECTOR (7 downto 0));
          END COMPONENT;

			SIGNAL aIP 	: STD_LOGIC_VECTOR (7 downto 0);
			SIGNAL CLK 	: STD_LOGIC;
			SIGNAL RST 	: STD_LOGIC;
			SIGNAL QA 	: STD_LOGIC_VECTOR (7 downto 0);
			SIGNAL QB 	: STD_LOGIC_VECTOR (7 downto 0);
          
			constant CLK_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: processor PORT MAP(
                  aIP => aIP,
                  CLK => CLK,
						RST => RST,
						QA	 => QA,
						QB	 => QB
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here
		  
		  aIP <= X"00";
		  wait for 100 ns;
		  aIP <= X"01";
		  wait for 100 ns;
		  aIP <= X"02";
		  wait for 100 ns;
		  aIP <= X"03";

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
