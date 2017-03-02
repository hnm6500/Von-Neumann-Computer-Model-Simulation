--------------------------------------------------------------------------------
-- Company: Rochester Institute Of Technology
-- Engineer: Hrishikesh Moholkar
--
-- Create Date:   15:06:10 02/26/2017
-- Design Name:   register file
-- Module Name:   C:/Users/hnm6500/Downloads/lab2_dsd2_hnm6500_NEW-20170225T181425Z-001/lab2_dsd2_hnm6500_NEW/Lab2/register_file_tb.vhd
-- Project Name:  Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   test bench for verifying the internal working of the register file
-- 
-- VHDL Test Bench Created by ISE for module: register_file
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
--arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         rd1 : IN  std_logic_vector(2 downto 0);
         rd2 : IN  std_logic_vector(2 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         wr : IN  std_logic_vector(2 downto 0);
         In1 : IN  std_logic_vector(15 downto 0);
         out1 : OUT  std_logic_vector(15 downto 0);
         out2 : OUT  std_logic_vector(15 downto 0);
         we : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rd1 : std_logic_vector(2 downto 0) := (others => '0');
   signal rd2 : std_logic_vector(2 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal wr : std_logic_vector(2 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');
   signal we : std_logic := '0';

 	--Outputs
   signal out1 : std_logic_vector(15 downto 0);
   signal out2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
  --10 ns
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          rd1 => rd1,
          rd2 => rd2,
          rst => rst,
          clk => clk,
          wr => wr,
          In1 => In1,
          out1 => out1,
          out2 => out2,
          we => we
        );
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
    -- wait for the input to reach in order to prevent undefined value.		
	wait for 5 ns;
	wait for 5 ns;
   -- output read as zero
   rst <='1';
	wait for 40 ns;
	-- 20
	rst <= '0';
	
	wait for 40 ns;
        -- start writing the data
	   we <= '1';
	-- feeding input to the register module	
	for j in 0 to 7 loop
	   -- writing the data to the register module
	   wr  <= std_logic_vector(to_unsigned(j,3));
		--
		wait for 40 ns; 
		In1  <= std_logic_vector(to_unsigned(j,16));
		wait for 40 ns;	
		
	end loop ;
    -- set write enable to zero
    -- start reading data to the output .
	we <= '0';
	for i in 0 to 7  loop
	   -- feeding correct value to the select lines of the two multiplexer 
		wait for 40 ns; 
           
	   rd1 <= std_logic_vector(to_unsigned(i,3));
		rd2 <= std_logic_vector(to_unsigned(i,3));
		wait for 40 ns; 
  --50		
	end loop;
	
	rst <= '0';
	wait for 40 ns;
	rst <= '1' ;
	wait for 40 ns;
	
   rst <= '0';
    wait;
    end process;

END;
