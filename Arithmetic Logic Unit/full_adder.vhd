----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:12 03/19/2017 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is

port( X, Y, Cin : in std_logic;
 sum, Cout : out std_logic);
 
end full_adder;

architecture Behavioral of full_adder is

begin
 sum <= (X xor Y) xor Cin;
 Cout <= (X and (Y or Cin)) or (Cin and Y);
end Behavioral;

