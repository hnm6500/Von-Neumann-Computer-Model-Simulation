----------------------------------------------------------------------------------
-- Company: Rochester Institute Of Technology
-- Engineer: Hrishikesh Nitin Moholkar
-- 
-- Create Date:    16:44:30 02/20/2017 
-- Design Name: register file
-- Module Name:    decoder 3:8 module  
-- Project Name: lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: 3: 8 decoder  for writing commands to write and read data.
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
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- deoder declaration
entity Decoder_3_to_8 is
    Port ( Din: in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Dout: out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
-- internal working of decoder
begin
   Dout <="00000001" when Din <= "000" else
			 "00000010" when Din <= "001" else
			 "00000100" when Din <= "010" else
			 "00001000" when Din <= "011" else
			 "00010000" when Din <= "100" else
			 "00100000" when Din <= "101" else
			 "01000000" when Din <= "110" else
			 "10000000" when Din <= "111" else
			 "00000000" ;
end Behavioral;

