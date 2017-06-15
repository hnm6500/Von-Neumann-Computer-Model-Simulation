----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    13:58:36 04/22/2017 
-- Design Name: LFSR
-- Module Name:    lfsr - Behavioral 
-- Project Name: BIST
-- Target Devices: Nexys 3 board
-- Tool versions: 
-- Description: The linear feedback shift register which produces random values when 
 -- test enable is set to 1
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

-- declaration of component
entity lfsr is 
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           
           bit_pattern : out  STD_LOGIC_vector(7 downto 0));
end lfsr;

architecture structural of lfsr is
-- d flip flop
COMPONENT dff is 
   Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  in_data :in std_logic;
			  enable : in std_logic;
			  out_data : out std_logic
           );

end component;

-- exor gate

component exorgate is
port ( A_1 : in std_logic ;
       B_1: in std_logic ;
		 C_1 : in std_logic;
		 D_1 : in std_logic;
		 out_data_1  : out std_logic);
end component;
--
-- internal wires
signal in_data_temp :std_logic;
signal out_data_temp :std_logic;
signal in_data_temp2 :std_logic;
signal out_data_temp1  :std_logic;
signal in_data_temp3  :std_logic;
signal out_data_temp2 :std_logic;
signal in_data_temp4  :std_logic;
signal out_data_temp3 :std_logic;
signal in_data_temp5  :std_logic;
signal exor_1in :std_logic;
signal exor_2in :std_logic;
signal out_data_temp4 :std_logic;
signal in_data_temp6 :std_logic;

signal in_data_temp7 :std_logic;
signal out_data_temp5 :std_logic;
signal exor_3in  :std_logic;
signal out_data_temp6 :std_logic;
signal in_data_temp8 :std_logic;
signal exor_4in :std_logic;
signal out_data_temp7 :std_logic;
signal exorout2  :std_logic;
signal exorout1 :std_logic;
signal exorout3,exorout  :std_logic;


begin
--tap at 8,6,5,4

-- eight dff and 3 exor gates

Labeldff1 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => in_data_temp, out_data =>out_data_temp);
in_data_temp2 <= out_data_temp;

Labeldff2 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => in_data_temp2, out_data =>out_data_temp1);

in_data_temp3 <= out_data_temp1;


exor_1in <= in_data_temp3;

Labeldff3 : dff port map(clk => clk, rst =>rst,enable => enable,in_data => in_data_temp3, out_data =>out_data_temp2);

in_data_temp4 <= out_data_temp2;

exor_2in <= in_data_temp4;

Labeldff4 : dff port map(clk => clk, rst =>rst, enable => enable,in_data => in_data_temp4, out_data =>out_data_temp3);

in_data_temp5 <= out_data_temp3;

exor_3in <= in_data_temp5;

Labeldff5 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => in_data_temp5, out_data =>out_data_temp4);

in_data_temp6 <= out_data_temp4;


Labeldff6 : dff port map(clk => clk, rst =>rst,enable => enable,in_data => in_data_temp6, out_data =>out_data_temp5);

in_data_temp7 <= out_data_temp5;



Labeldff7 : dff port map(clk => clk, rst =>rst,enable => enable, in_data => in_data_temp7, out_data =>out_data_temp6);

in_data_temp8 <= out_data_temp6;

Labeldff8 : dff port map(clk => clk, rst =>rst,enable => enable,in_data => in_data_temp8, out_data =>out_data_temp7);

exor_4in <= out_data_temp7;

exorgatelabel : exorgate port map ( A_1 =>exor_1in , B_1=>exor_2in ,C_1 =>exor_3in,D_1 => exor_4in, out_data_1 => exorout);


in_data_temp <= exorout;

-- output of lfsr

bit_pattern(0) <= out_data_temp;
bit_pattern(1) <= out_data_temp1;
bit_pattern(2) <= out_data_temp2;
bit_pattern(3) <= out_data_temp3;
bit_pattern(4) <= out_data_temp4;
bit_pattern(5) <= out_data_temp5;
bit_pattern(6) <= out_data_temp6;
bit_pattern(7) <= out_data_temp7;


end structural;

