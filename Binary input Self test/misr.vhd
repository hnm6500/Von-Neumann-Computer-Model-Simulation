----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    15:33:47 04/22/2017 
-- Design Name:   MISR
-- Module Name:    misr - Behavioral 
-- Project Name: BIST
-- Target Devices: Nexys 3 board
-- Tool versions: 
-- Description: MISR which generates the signature from the multiplier output when  test enable set to 1
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

-- component declaration

entity misr is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           mult_result : in STD_LOGIC_vector( 7 downto 0);
           signature : out  STD_LOGIC_vector( 7 downto 0));
end misr;

architecture structural of misr is
--tap at 2,3,4,8 

COMPONENT dff is 
   Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  in_data :in std_logic;
			  enable : in std_logic;
			  out_data : out std_logic);

end component;


   
signal exorout, exorout1,exorout2, exorout3,exorout4,exorout5 ,exorout6, exorout7:std_logic;

signal out_data_temp,out_data_temp1,out_data_temp2,out_data_temp3,out_data_temp4,out_data_temp5,out_data_temp6,out_data_temp7 : std_logic;




begin

-- eight dff and eight exor gates 
 

Labeldff1 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout1 , out_data =>out_data_temp);
 exorout <= out_data_temp xor mult_result(0);
 
Labeldff2 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout , out_data =>out_data_temp1); 
 exorout2 <= out_data_temp1 xor mult_result(1) xor exorout1;
 
Labeldff3 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout2 , out_data =>out_data_temp2); 
 exorout3 <= out_data_temp2 xor mult_result(2) xor exorout1;
 
 Labeldff4 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout3 , out_data =>out_data_temp3);
 exorout4 <= out_data_temp3 xor mult_result(3) xor exorout1;
 
 Labeldff5 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout4 , out_data =>out_data_temp4);
 
 exorout5 <= out_data_temp4 xor mult_result(4) ;
 
 Labeldff6 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout5 , out_data =>out_data_temp5);
 
 exorout6 <= out_data_temp5 xor mult_result(5) ;
 
 Labeldff7 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout6 , out_data =>out_data_temp6);
 
 exorout7 <= out_data_temp6 xor mult_result(6) ;
 
 Labeldff8 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => exorout7 , out_data =>out_data_temp7);
 
 exorout1 <= out_data_temp7 xor mult_result(7) ;
 
 -- final signature passed to the output
 
signature <= out_data_temp & out_data_temp1 & out_data_temp2 & out_data_temp3 & out_data_temp4 & out_data_temp5 & out_data_temp6 & out_data_temp7;

end structural;

