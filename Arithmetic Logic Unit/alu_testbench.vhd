--------------------------------------------------------------------------------
-- Company: Rochester Institute of technology
-- Engineer: Hrishikesh Moholkar
--
-- Create Date:   17:42:00 03/25/2017
-- Design Name:   
-- Module Name:   C:/Users/hnm6500/Desktop/HRISHIKESH/alu/lab3_alu/SHIFTER_TESTBENCH.vhd
-- Project Name:  Test bench for ALU
-- Target Device:  nexys 3 board
-- Tool versions:  spartan 6  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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


-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT ALU
          PORT(
                 input1 : IN std_logic_VECTOR(15 downto 0) ;
                 input2 : IN std_logic_vector(15 downto 0);
					  Control1 : IN STD_LOGIC_VECTOR( 3 DOWNTO 0);
					  Output1 : out std_logic_vector(15 downto 0)
                  );
          END COMPONENT;

          SIGNAL input1 :  std_logic_VECTOR(15 downto 0):=(others =>'0');
          SIGNAL input2 :  std_logic_VECTOR(15 downto 0):=(others =>'0');
			 SIGNAL Control1 :STD_LOGIC_VECTOR( 3 DOWNTO 0):=(others =>'0');
          SIGNAL Output1 :  std_logic_VECTOR(15 downto 0):=(others =>'0');
			 

  BEGIN

  -- Component Instantiation
          uut: ALU PORT MAP(
                  input1 => input1,
                  input2 => input2,
						Control1 => Control1,
						Output1 => Output1
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 10 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here
		  --Contro11 <= "0100";
		  -- addition
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  -- addition
		  Control1 <= "0100";
		  
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  -- subtraction
		  Control1 <= "0101";
		  wait for 200 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --multiplication
		  Control1 <="0110";
		  wait for 300 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --or
		  Control1 <="1000";
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --not
		  Control1 <="1001";
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --and
		  Control1 <= "1010";
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --xor
		  Control1  <= "1011";
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --logical left
		  Control1  <= "1100";
		  --Contro11 <= "1100";
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --logical right
		  Control1<= "1101";
		  wait for 100 ns;
		  input1<="0000001111001111";
		  input2<="0000000000000011";
		  --arithmetic shift right
		  Control1 <="1110";
		  wait for 100 ns;
		  

        wait; 
     END PROCESS tb;
  

  END;
