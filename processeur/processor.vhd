----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    9:03:08 05/16/2020 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
    Port ( aIP : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end processor;

architecture Behavioral of processor is

component MD
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
           ENTREE : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SORTIE : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MI
    Port ( ADDRESS : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           SORTIE : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component pipe
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Out_A : out  STD_LOGIC_VECTOR (7 downto 0);
           Out_OP : out  STD_LOGIC_VECTOR (7 downto 0);
           Out_B : out  STD_LOGIC_VECTOR (7 downto 0);
           Out_C : out  STD_LOGIC_VECTOR (7 downto 0);
	        CLK : in  STD_LOGIC);
end component;

component registre
    Port ( aA : in  STD_LOGIC_VECTOR (3 downto 0);
           aB : in  STD_LOGIC_VECTOR (3 downto 0);
		    aW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component UAL
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0));
end component;

component lc is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           W : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

for all: md					use entity work.MD(Behavioral);
for all: mi					use entity work.MI(Behavioral);
for all: registre			use entity work.registre(Behavioral);
for all: pipe		 	   use entity work.pipe(Behavioral);
for all: ual 				use entity work.UAL(Behavioral);
for all: lc 				use entity work.lc(Behavioral);

signal N, O, Z, C: STD_LOGIC;
signal ctrl_alu, RW, W: STD_LOGIC_VECTOR(3 downto 0);
signal SORTIE: STD_LOGIC_VECTOR(31 downto 0);
signal 	A1, OP1, B1, C1, MUX1,
        A2, OP2, B2, C2, MUX2,
        A3, OP3, B3, C3, MUX3,
        OP4, C4, MUX4,		
        QA1, QB1, aW, DATA, S, X, SORTIE2: STD_LOGIC_VECTOR(7 downto 0);

begin

	MEMINST: mi port map(aIP, CLK, SORTIE);

	LI_DI: pipe port map(SORTIE(31 downto 24), SORTIE(23 downto 16), SORTIE(15 downto 8), SORTIE(7 downto 0), A1, OP1, B1, C1, CLK);
	REG: registre port map(B1(3 downto 0), C1(3 downto 0), aW(3 downto 0), W(0), DATA, RST, CLK, QA1, QB1); 

	MUX1 <= QA1 when OP1=X"01" or OP1=X"02" or OP1=X"03" or OP1=X"04" or OP1=X"05" or OP1=X"08" else -- ADD MUL SOU DIV COP STORE
	B1 when OP1=X"06" or OP1=X"07"; -- AFC LOAD

	DI_EX: pipe port map(A1, OP1, MUX1, QB1, A2, OP2, B2, C2, CLK);
	LC1: lc port map(OP2, ctrl_alu); 
	ALU: ual port map(B2, C2, N, O, Z, C, S, ctrl_alu(3 downto 1));  

	MUX2 <= S when OP2=X"01" or OP2=X"02" or OP2=X"03" or OP2=X"04" else -- ADD MUL SOU DIV
	  B2 when OP2=X"05" or OP2=X"06" or  OP2=X"07" or OP2=X"08"; -- COP AFC LOAD STORE

	EX_Mem: pipe port map(A2, OP2, MUX2, C2, A3, OP3, B3, C3, CLK);

	MUX3 <= A3 when OP3=X"01" or OP3=X"02" or OP3=X"03" or OP3=X"04" or OP3=X"05" or OP3=X"06" or OP3=X"08" else -- STORE ADD MUL SOU DIV COP AFC
	  B3 when OP3=X"07"; -- LOAD

	LC2: lc port map(OP3, RW); 
	MEMDATA : md port map(MUX3, B3, RW(0), RST, CLK, SORTIE2);

	MUX4 <= SORTIE2 when OP3=X"07" or OP3=X"08" else -- LOAD STORE
	B3 when OP3=X"01" or OP3=X"02" or OP3=X"03" or OP3=X"04" or OP3=X"05" or OP3=X"06"; -- AFC COP ADD MUL DIV SOU

	Mem_RE: pipe port map(A3, OP3, MUX4, C3, aW, OP4, DATA, C4, CLK);
	LC3: lc port map(OP4, W);
	
end Behavioral;
