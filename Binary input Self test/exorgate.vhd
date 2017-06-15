----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    14:56:57 04/26/2017 
-- Design Name:    EXOR GATE 
-- Module Name:    exorgate - Behavioral 
-- Project Name:  BIST
-- Target Devices: Nexys 3 board
-- Tool versions: 
-- Description: exor gate for the wrapper
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

entity exorgate is
port ( A_1 : in std_logic ;
       B_1 : in std_logic ;
		 C_1 : in std_logic;
		 D_1 : in std_logic;
		 out_data_1  : out std_logic);
end exorgate;

architecture Behavioral of exorgate is

begin

   out_data_1 <= A_1	xor B_1 xor C_1 xor D_1;


end Behavioral;

