----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology
-- Engineer: HRISHIKESH MOHOLKAR
-- 
-- Create Date:    12:55:41 04/02/2017 
-- Design Name:    SEVEN SEGMENT DECODER 
-- Module Name:    sevensegmentdecoder - Behavioral 
-- Project Name:   VENDING MACHINE
-- Target Devices: NEXYS-3 BOARD 
-- Tool versions: 
-- Description:  DISPLAYS THE AMOUNT DEPOSITED FROM COIN CONTROL ON LED DISPLAY.
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
use work.bin_bcd.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

 
-- SEVEN SEGMENT COMPONENT
entity sevensegmentdecoder is
	port (  BCD : in std_logic_vector (11 downto 0);
	        hund_disp_n : out std_logic_vector(6 downto 0);
			  tens_disp_n : out std_logic_vector(6 downto 0);
			  ones_disp_n : out std_logic_vector(6 downto 0));
	
end sevensegmentdecoder;


architecture Behavioral of sevensegmentdecoder is
-- TEMPORARY SIGNALS STORING SPLIT INPUT
signal bcd_vector : std_logic_vector (11 downto 0);
signal bcd_ones : std_logic_vector(3 downto 0);
signal bcd_tens : std_logic_vector(3 downto 0);
signal bcd_hundred : std_logic_vector(3 downto 0);

begin
bcd_vector <= bin_to_bcd( BCD);
bcd_ones<= BCD(3 downto 0);
bcd_tens<= BCD(7 downto 4);
bcd_hundred <= BCD (11 downto 8);


 process(bcd_ones,bcd_tens,bcd_hundred)
 begin
   --- CONVERSION OF 4 BITS TEMO[PORARY SIGNAL TO 7 BIT OUTPUT
	 case bcd_ones is 
	    when "0000"=> ones_disp_n <="0000001";  -- '0'
		 when "0001"=> ones_disp_n <="1001111";  -- '1'
       when "0010"=> ones_disp_n <="0010010";  -- '2'
       when "0011"=> ones_disp_n <="0000110";  -- '3'
       when "0100"=> ones_disp_n <="1001100";  -- '4' 
       when "0101"=> ones_disp_n <="0100100";  -- '5'
       when "0110"=> ones_disp_n <="0100000";  -- '6'
       when "0111"=> ones_disp_n <="0001111";  -- '7'
       when "1000"=> ones_disp_n <="0000000";  -- '8'
       when "1001"=> ones_disp_n <="0000100";  -- '9'
       when others=> ones_disp_n <="1111111"; 
		 
    end case;



     
      
   
	 
	   case bcd_tens is 
		
	    when "0000"=> tens_disp_n <="0000001";  -- '0'
		 when "0001"=> tens_disp_n <="1001111";  -- '1'
       when "0010"=> tens_disp_n <="0010010";  -- '2'
       when "0011"=> tens_disp_n <="0000110";  -- '3'
       when "0100"=> tens_disp_n <="1001100";  -- '4' 
       when "0101"=> tens_disp_n <="0100100";  -- '5'
       when "0110"=> tens_disp_n <="0100000";  -- '6'
       when "0111"=> tens_disp_n <="0001111";  -- '7'
       when "1000"=> tens_disp_n <="0000000";  -- '8'
       when "1001"=> tens_disp_n <="0000100";  -- '9'
       when others=> tens_disp_n <="1111111"; 
       end case;
     
    


   
   
	 case bcd_hundred is 
	    when "0000"=> hund_disp_n <="0000001";  -- '0'
		 when "0001"=> hund_disp_n <="1001111";  -- '1'
       when "0010"=> hund_disp_n <="0010010";  -- '2'
       when "0011"=> hund_disp_n <="0000110";  -- '3'
       when "0100"=> hund_disp_n <="1001100";  -- '4' 
       when "0101"=> hund_disp_n <="0100100";  -- '5'
       when "0110"=> hund_disp_n <="0100000";  -- '6'
       when "0111"=> hund_disp_n <="0001111";  -- '7'
       when "1000"=> hund_disp_n <="0000000";  -- '8'
       when "1001"=> hund_disp_n <="0000100";  -- '9'
       when others=> hund_disp_n <="1111111"; 
		 
    end case;
 	   
 end process;

end Behavioral;