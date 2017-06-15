--------------------------------------------------------------------------------
-- Company: RIT
-- Engineer:HRISHIKESH MOHOLKAR
--
-- Create Date:   19:59:19 04/25/2017
-- Design Name:   TEST BENCH FOR BIST
-- Module Name:   C:/Users/hnm6500/Downloads/lab5change-20170425T200935Z-001/lab5change/lab5/testbench_wrapper.vhd
-- Project Name:  lab5-BIST
-- Target Device:  NEXSYS-3 BOARD
-- Tool versions:  
-- Description:   THIS SIMULATES THE EXACT WORKING OF THE BIST.
-- 
-- VHDL Test Bench Created by ISE for module: wrapper
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
 
ENTITY testbench_wrapper IS
END testbench_wrapper;
 
ARCHITECTURE behavior OF testbench_wrapper IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wrapper
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         sel_test_mode : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         enable : IN  std_logic;
         unused_anode : OUT  std_logic;
         hund_anode : OUT  std_logic;
         tens_anode : OUT  std_logic;
         ones_anode : OUT  std_logic;
			output_temp : out std_logic_vector ( 7 downto 0);
         CAn : OUT  std_logic;
         CBn : OUT  std_logic;
         CCn : OUT  std_logic;
         CDn : OUT  std_logic;
         CEn : OUT  std_logic;
         CFn : OUT  std_logic;
         CGn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal sel_test_mode : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal unused_anode : std_logic;
   signal hund_anode : std_logic;
   signal tens_anode : std_logic;
   signal ones_anode : std_logic;
   signal CAn : std_logic;
   signal CBn : std_logic;
   signal CCn : std_logic;
   signal CDn : std_logic;
   signal CEn : std_logic;
   signal CFn : std_logic;
   signal CGn : std_logic;
	----------
	signal output_temp : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wrapper PORT MAP (
          A => A,
          B => B,
          sel_test_mode => sel_test_mode,
          clk => clk,
          rst => rst,
          enable => enable,
          unused_anode => unused_anode,
          hund_anode => hund_anode,
          tens_anode => tens_anode,
          ones_anode => ones_anode,
          CAn => CAn,
          CBn => CBn,
          CCn => CCn,
          CDn => CDn,
          CEn => CEn,
          CFn => CFn,
			 ---
			 output_temp => output_temp,
          CGn => CGn
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      
    -- INTIAL INPUT

      A <= "0010";
	   wait for clk_period ;
		
	 	B <= "0100";
		
	   wait for clk_period;
	   
	   --RESET
		
		rst <= '0';
		
		wait for clk_period;
		
		---ENABLE LOW
		
		enable <= '0';
		
		wait for clk_period;
		
		
		-- TEST MODE OFF
		
		sel_test_mode <= '0';
		
		wait for clk_period*2;
		
		-----------------
		--TEST MODE ON AND ENABLE HIGH
		
		sel_test_mode <= '1';
		enable <= '1';
		rst <= '1';
		
		wait for clk_period*101;
		
	  -----------------------------
		
		wait for clk_period;
			---ENABLE LOW, AND RESET THE LFSR
		rst <= '0';
		enable <= '0';
		sel_test_mode <= '0';
		wait for clk_period*10;
		--------------------------------
		--TEST MODE ON AND ENABLE HIGH
		sel_test_mode <= '1';
		enable <= '1';
		rst <= '1';
		
		wait for clk_period*101;
		-----------------------------
		
		
		rst <= '0';
		enable <= '0';
		sel_test_mode <= '0';
		wait for clk_period*10;
		----------------------------
		sel_test_mode <= '1';
		enable <= '1';
		rst <= '1';
		
		wait for clk_period*101;
		
	   -----------------------------
		
		rst <= '0';
		enable <= '0';
		sel_test_mode <= '0';
		wait for clk_period*10;
		--------------------------------
		
		sel_test_mode <= '1';
		enable <= '1';
		rst <= '0';
		
		wait for clk_period*101;
		-----------------------------
		
		rst <= '0';
		enable <= '1';
		sel_test_mode <= '1';
		wait for clk_period*101;
		----------------------------
		
		-- DIFFERENT INPUTS 
		
		A <= "0011";
	   wait for clk_period ;
	 	B <= "0010";
		
	   wait for clk_period;
		rst <= '0';
		enable <= '0';
		sel_test_mode <= '0';
		wait for clk_period*101;
		wait;
   end process;

END;
