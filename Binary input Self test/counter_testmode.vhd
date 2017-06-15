----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    16:01:48 04/26/2017 
-- Design Name:    Counter for BIST
-- Module Name:    counter_testmode - Behavioral 
-- Project Name:   BIST
-- Target Devices: NEXYS 3 BOARD 
-- Tool versions: 
-- Description: INCREMENTS WHENEVER TEST MODE IS ENABLED AND DOES TILL 100 TH COUNT
-- AFTER THAT IT SETS ENABLE TO ZERO WHICH LATCHES THE LFSR TO ONE FIX VALUE.
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
use ieee.std_logic_unsigned.all;

use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_testmode is
port ( enable_input : in std_logic;
       test_mode_input : in std_logic;
		 out_enable : out std_logic;
		 out_test_mode : out std_logic);
end counter_testmode;

architecture Behavioral of counter_testmode is

signal counter : std_logic_vector (19 downto 0):= "00000000000000000000";
 
begin

   label_genreg : 
	        process(enable_input,test_mode_input) is begin
			     
					if (enable_input = '1' and test_mode_input ='1') then
					    label_genreg1 : 
						     
						       if ( counter < 100) then 
						           out_enable <= enable_input;
								 
								     out_test_mode <= test_mode_input;
						       else 
						           out_enable <= '0';
								 
								     out_test_mode <= '0';
						 
						       end if;
						
						  
						  counter <= std_logic_vector(to_unsigned(to_integer(unsigned(counter)),20 ));
					else 
					
					     out_enable <= enable_input;
								 
						  out_test_mode <= test_mode_input;
						  
      
              end if;
            counter <= counter + "00000000000000000001";
   end process;				  
							

end Behavioral;

