--------------------------------------------------------------------------------
-- Company: Rochester Institute of technology
-- Engineer: Hrishikesh Moholkar
--
-- Create Date:   18:55:30 04/04/2017
-- Design Name:   vending machine testbench
-- Module Name:   C:/Users/hnm6500/Downloads/vendingmachine-20170404T221348Z-001/vendingmachine/vendingmachine_testbench.vhd
-- Project Name:  vendingmachine
-- Target Device:  nexys 3 board 
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Usr_interaction
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
 
ENTITY vendingmachine_testbench IS
END vendingmachine_testbench;
 
ARCHITECTURE behavior OF vendingmachine_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Usr_interaction
    PORT(
         Qrcd_in : IN  std_logic;
         Drcd_in : IN  std_logic;
         Nrcd_in : IN  std_logic;
         Clk_in : IN  std_logic;
         Reset_n_in : IN  std_logic;
         Soda_req_in : IN  std_logic;
         Soda_price_in : IN  std_logic_vector(3 downto 0);
         Drop_soda_out : OUT  std_logic;
         Qrcd_out : OUT  std_logic;
         Drcd_out : OUT  std_logic;
         Nrcd_out : OUT  std_logic;
         Amt_err : OUT  std_logic;
         unused_anode : OUT  std_logic;
         hund_anode_out : OUT  std_logic;
         tens_anode_out : OUT  std_logic;
         ones_anode_out : OUT  std_logic;
         CAn_out : OUT  std_logic;
         CBn_out : OUT  std_logic;
         CCn_out : OUT  std_logic;
         CDn_out : OUT  std_logic;
         CEn_out : OUT  std_logic;
         CFn_out : OUT  std_logic;
         CGn_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Qrcd_in : std_logic := '0';
   signal Drcd_in : std_logic := '0';
   signal Nrcd_in : std_logic := '0';
   signal Clk_in : std_logic := '0';
   signal Reset_n_in : std_logic := '0';
   signal Soda_req_in : std_logic := '0';
   signal Soda_price_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Drop_soda_out : std_logic;
   signal Qrcd_out : std_logic;
   signal Drcd_out : std_logic;
   signal Nrcd_out : std_logic;
   signal Amt_err : std_logic;
   signal unused_anode : std_logic;
   signal hund_anode_out : std_logic;
   signal tens_anode_out : std_logic;
   signal ones_anode_out : std_logic;
   signal CAn_out : std_logic;
   signal CBn_out : std_logic;
   signal CCn_out : std_logic;
   signal CDn_out : std_logic;
   signal CEn_out : std_logic;
   signal CFn_out : std_logic;
   signal CGn_out : std_logic;

   -- Clock period definitions
   constant Clk_in_period : time := 10 ns;--40.9us ;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Usr_interaction PORT MAP (
          Qrcd_in => Qrcd_in,
          Drcd_in => Drcd_in,
          Nrcd_in => Nrcd_in,
          Clk_in => Clk_in,
          Reset_n_in => Reset_n_in,
          Soda_req_in => Soda_req_in,
          Soda_price_in => Soda_price_in,
          Drop_soda_out => Drop_soda_out,
          Qrcd_out => Qrcd_out,
          Drcd_out => Drcd_out,
          Nrcd_out => Nrcd_out,
          Amt_err => Amt_err,
          unused_anode => unused_anode,
          hund_anode_out => hund_anode_out,
          tens_anode_out => tens_anode_out,
          ones_anode_out => ones_anode_out,
          CAn_out => CAn_out,
          CBn_out => CBn_out,
          CCn_out => CCn_out,
          CDn_out => CDn_out,
          CEn_out => CEn_out,
          CFn_out => CFn_out,
          CGn_out => CGn_out
        );

   -- Clock process definitions
   Clk_in_process :process
   begin
		Clk_in <= '0';
		wait for Clk_in_period/2;
		Clk_in <= '1';
		wait for Clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		   -- active low reset
		   Reset_n_in <= '0';
		   wait for  200 us;
			
			Reset_n_in <= '1';
			wait for  200 us;
			-- accept one type of currency at a time
			Nrcd_in <= '0';
			Drcd_in <= '1';
			Qrcd_in <= '0';
			
			wait for  200 us;
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '1';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '1';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for  200 us;
			
			Nrcd_in <= '1';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for  200 us;
			-- request soda 
			wait for  200 us;
			Soda_price_in <= "0000";
			Soda_req_in <= '1';
			wait for  200 us;
			Soda_req_in <= '0';
			-- resetting vending machine
			wait for  200 us;
			Reset_n_in <= '0';
			wait for 200 us;
			
			Reset_n_in <= '1';
			wait for 200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '1';
			Qrcd_in <= '0';
			
			wait for  200 us;
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '1';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for  200 us;
			
			-- request soda 
			wait for  200 us;
			Soda_price_in <= "0000";
			Soda_req_in <= '1';
			
			wait for  200 us;
			
			
			
			
			Reset_n_in <= '0';
		   wait for  200 us;
			
			Reset_n_in <= '1';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '1';
			
			wait for  200 us;
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			
			wait for 200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '1';
			wait for  200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for  200 us;
			
			
			Nrcd_in <= '1';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for 200 us;
			
			Nrcd_in <= '0';
			Drcd_in <= '0';
			Qrcd_in <= '0';
			wait for 200 us;
			
			wait for  200 us;
			--changed from 0000 to 1000
			Soda_price_in <= "1000";
			Soda_req_in <= '1';
		
      wait;
   end process;

END;
