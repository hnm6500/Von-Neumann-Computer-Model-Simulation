----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: HRISHIKESH MOHOLKAR
-- 
-- Create Date:    17:28:01 04/25/2017 
-- Design Name:  LAST MUX
-- Module Name:    mux_out - Behavioral 
-- Project Name: BIST
-- Target Devices: Nexys3 board
-- Tool versions: 
-- Description: last mux which sends the output to seven segment decoder
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

entity mux_out is
port (
   misr_output : in std_logic_vector(7 downto 0);
	multiplieroutput : in std_logic_vector(7 downto 0);
	sel_test_mode : in std_logic;
	out_data_lastmux  :out std_logic_vector(7 downto 0)
  );
end mux_out;


architecture Behavioral of mux_out is

begin
gen_reg :
   process(sel_test_mode,misr_output,multiplieroutput) is begin
	     if (sel_test_mode = '1' ) then
		       out_data_lastmux <= misr_output;
				 
		  else 
		      
				 out_data_lastmux <= multiplieroutput;
        end if;
		  
	end process;


end Behavioral;

