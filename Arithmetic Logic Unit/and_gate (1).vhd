----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:11 03/19/2017 
-- Design Name: 
-- Module Name:    and_gate - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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

entity and_gate is

     port ( and_in_1 : in std_logic;
            and_in_2 : in std_logic;
            and_out_1 :out std_logic);


end and_gate;

architecture Behavioral of and_gate is

begin
    and_out_1 <= and_in_1 and and_in_2;

end Behavioral;

