----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    17:05:48 04/25/2017 
-- Design Name:    intermediate mux
-- Module Name:    mux_2_out - Behavioral 
-- Project Name: BIST 
-- Target Devices: NEXY3 BOARD
-- Tool versions: 
-- Description: INTERMEDIATE MUX BEFORE MULTIPLIER
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

entity mux_2_to_1 is
port ( output_multiplier : in std_logic_vector ( 7 downto 0);
       
		 : in std_logic_vector  ( 3 downto 0);
       sel_test_mode : in std_logic;
		 lfsr_output : in std_logic_vector ( 7 downto 0);
       out_data : out std_logic_vector( 7 downto 0));		 
end mux_2_to_1;

architecture Behavioral of mux_2_to_1 is

begin 

gen_reg :
   process(sel_test_mode,A,B,lfsr_output) is begin
	     if (sel_test_mode = '1' ) then
		       out_data <= lfsr_output;
				 
		  else 
		      
				out_data(0) <= A(0);
				out_data(1) <= A(1);
				out_data(2) <= A(2);
				out_data(3) <= A(3);
				out_data(4) <= B(0);
				out_data(5) <= B(1);
				out_data(6) <= B(2);
				out_data(7) <= B(3);
        end if;
		  
	end process;
end Behavioral;
