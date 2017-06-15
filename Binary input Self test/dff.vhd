----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    13:59:47 04/22/2017 
-- Design Name:   D FLIP FLOP
-- Module Name:    dff - Behavioral 
-- Project Name: BIST
-- Target Devices: Nexys3 board
-- Tool versions: 
-- Description: D FLIP FLOP A FUNDAMNETAL BUILDING BLOCK OF MISR AND LFSR
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

entity dff is

Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  in_data :in std_logic;
			  out_data : out std_logic;
           enable : in  STD_LOGIC);

end dff;

architecture Behavioral of dff is

begin

process(enable,clk,rst) is begin  


     
	  if ( rising_edge(clk) ) then  
    
         if (rst = '0') then
          
			    out_data <= '1';
				 
         elsif ( enable = '1') then 
              out_data <= in_data;
			 
         end if;
     end if;   
	  
  
  
end process;  

end Behavioral;

