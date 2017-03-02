----------------------------------------------------------------------------------
-- Company:  Rochester Institute of technology
-- Engineer: Hrishikesh Nitin Moholkar
-- 
-- Create Date:    15:12:42 02/25/2017 
-- Design Name:  Register File 
-- Module Name:    AND_GATE - Behavioral 
-- Project Name: Lab2 
-- Target Devices: 
-- Tool versions: 
-- Description: And gate used for the controlling write enable signal
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

-- inputs to the gate 
entity AND_GATE is
    Port ( in_x : in  STD_LOGIC;
				in_y: in std_logic;
           out_x : out  STD_LOGIC);
end AND_GATE;
-- internal fucntioning of the and gate 
architecture Behavioral of AND_GATE is

begin
out_x <= in_x and in_y;	

end Behavioral;

