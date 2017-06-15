----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: HRISHIKESH MOHOLKAR
-- 
-- Create Date:    15:47:45 04/30/2017 
-- Design Name:    COMPARATOR
-- Module Name:    tristatebuffer - Behavioral 
-- Project Name:   SRAM
-- Target Devices:   NEXYS3-BOARD
-- Tool versions: 
-- Description: THIS COMPARATOR CONTROLS THE OUTPUT TO DECODER AND INPUT TO THE SRAM
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

entity tristatebuffer is
port ( X  : IN STD_LOGIC_vector( 3 DOWNTO 0);
       Y :  OUT STD_LOGIC_VECTOR ( 3 DOWNTO 0);
		 CONTROL  : IN STD_LOGIC);

end tristatebuffer;

architecture Behavioral of tristatebuffer is

begin
  PROCESS ( CONTROL,X ) IS BEGIN
     IF (CONTROL = '1' ) THEN 
	      Y <= X;
	 ELSE 
	      Y <= "0000";
			
    END IF;
	 
	END PROCESS;
	


end Behavioral;

