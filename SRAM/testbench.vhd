--------------------------------------------------------------------------------
-- Company: RIT
-- Engineer:HRISHIKESH MOHOLKAR
--
-- Create Date:   19:36:03 05/01/2017
-- Design Name:   TEST BENCH FOR IOBUS
-- Module Name:   C:/Users/hnm6500/Downloads/lab6-20170501T190129Z-001/lab6/lab6/testbench.vhd
-- Project Name:  lab6
-- Target Device:  NEXYS-3 BOARD
-- Tool versions:  
-- Description:   TEST BENCH
-- 
-- VHDL Test Bench Created by ISE for module: IObus
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
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IObus
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         bus_id : IN  std_logic;
         rw : IN  std_logic;
         ready : IN  std_logic;
         burst : IN  std_logic;
         addr : IN  std_logic_vector(2 downto 0);
         Data : IN  std_logic_vector(3 downto 0);
		
         unused_anode : OUT  std_logic;
         hund_anode : OUT  std_logic;
         tens_anode : OUT  std_logic;
         ones_anode : OUT  std_logic;
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
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal bus_id : std_logic := '0';
   signal rw : std_logic := '0';
   signal ready : std_logic := '0';
   signal burst : std_logic := '0';
   signal addr : std_logic_vector(2 downto 0) := (others => '0');

	--BiDirs
   signal Data : std_logic_vector(3 downto 0);
	

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
 
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IObus PORT MAP (
          clk => clk,
          rst => rst,
          bus_id => bus_id,
          rw => rw,
          ready => ready,
          burst => burst,
          addr => addr,
          Data => Data,
			
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

      wait for clk_period*10;

      -- insert stimulus here 
		
		
		--write data
		rst <= '0';
		Data <= "ZZZZ";
		wait for 150 ns;
		
		
		rst <= '1';
		wait for 150 ns;
		
		-- WRITE DATA
		Data <= "0101";
		addr <= "000";
		wait for 150 ns;
		
		rw <= '0';
		ready <= '1';
		wait for 150 ns;
		
		
		ready <= '0';
		wait for 150 ns;
		
		-- WRITE DATA
		rw <= '0';
		ready <= '1';
		Data <= "1101";
		addr <= "010";
		wait for 150 ns;
		
		ready <= '0';
		wait for 150 ns;
		
		-- WRITE DATA
		rw <= '0';
		ready <= '1';
		Data <= "1010";
		addr <= "010";
		wait for 150 ns;
		
		ready <= '0';
		wait for 150 ns;
		
		-- READ DATA
		addr <= "000";
		rw <= '1';
		ready <= '1';
		wait for 150 ns;
		
		ready <= '0';
		wait for 150 ns;
		
		-- READ DATA
		addr <= "010";
		rw <= '1';
		ready <= '1';
		wait for 150 ns;
		
		--READ BURST DATA
		ready <= '0';
		wait for 100 ns;
		addr <= "000";
      ready <= '1';
		burst <= '1';
		wait for 150 ns;
		
		ready <= '0';
		-- BURST READ 1
		wait for 150 ns;
		 ready <= '1';
		 
		 wait for 150 ns;
		 
		 ready <= '0';
		 --BURST READ 2
		 wait for 150 ns;
		 
		 ready <= '1';
		 
		 wait for 150 ns;
		 ready <= '0';
		 -- BURST READ 3
		 
		 
		  
		 ready <= '1';
		 
		 wait for 150 ns;
		 ready <= '0';
		 -- BURST READ 4
		 burst <= '0';
		 
		 
		
--		
      wait;
   end process;

END;
