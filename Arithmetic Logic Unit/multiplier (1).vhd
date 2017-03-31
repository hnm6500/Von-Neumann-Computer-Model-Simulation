----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    15:51:38 03/19/2017 
-- Design Name:   Multiplier 
-- Module Name:    multiplier - Structural 
-- Project Name: Arithmetic Logic Unit
-- Target Devices: Nexys 3 board
-- Tool versions: spartan 6
-- Description: multiplication operation of the inputs 
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
-- input/output
entity multiplier is
generic ( n : integer := 16);
    port ( in_1	 : in std_logic_vector ((n/2 - 1) downto 0);
           in_2 : in std_logic_vector((n/2 - 1) downto 0);
           product : out std_logic_vector ((n - 1) downto 0));


end multiplier;
-- functioning of the multiplier
architecture struct of multiplier is
-- and gate component 
	component and_gate is 
     port ( and_in_1 : in std_logic;
            and_in_2 : in std_logic;
            and_out_1 :out std_logic);
	end component;
   
-- full adder component 
	component full_adder is 
    port ( X, Y, Cin : in std_logic;
           sum, Cout : out std_logic);
 
	end component;
-- 2d array formation for storing the inputs and storing the output in the last row 
type and_output_n is array (n-1 downto 0) of std_logic_vector(n-1 downto 0);
signal  and_level1 : and_output_n;
signal full_adder_output : and_output_n;
signal carry_output :and_output_n;
begin 

 
gen_reg : 
     --i : column ,j: row
     for i in 0 to n/2-1 generate  
	       and_gate1 : and_gate port map ( and_in_1 => in_1(i) ,and_in_2 => in_2(0) , and_out_1=>full_adder_output(0)(i));
	  end generate;
product(0) <=full_adder_output(0)(0);
gen_reg1 :
     for i  in 1 to n/2-1 generate 
	      gen_reg2:
			    for j in 0 to n/2-1 generate 
				       and_gate2 : and_gate port map ( and_in_1 => in_1(j) ,and_in_2 => in_2(i) , and_out_1=>and_level1(i)(j));
				 
				 end generate;
	end generate;
	
gen_reg2:
     for i in 1 to n/2 -1 generate 
	          full_adder1: full_adder port map (X=>full_adder_output(i-1)(1),Y=>and_level1(i)(0), Cin =>'0', Cout=>carry_output(i)(0) , sum=>product(i));
	  end generate;
	  
				 
gen_reg3:
    for i in 1 to n/2-1 generate 
        gen_reg4:
             for j in 1 to n/2-2 generate
                  full_adder2: full_adder port map (X=>full_adder_output(i-1)(j+1),Y=>and_level1(i)(j), Cin =>carry_output(i)(j-1) , Cout=>carry_output(i)(j) , sum=>full_adder_output(i)(j));
	    					  
				end generate;
    end generate;				
		carry_output(0)(n/2-1)<='0';	 
gen_reg4 :
     for i in 1 to n/2 -1 generate 
	          full_adder3: full_adder port map (X=>carry_output(i-1)(n/2-1),Y=>and_level1(i)(n/2-1), Cin =>carry_output(i)(n/2-2) ,Cout=>carry_output(i)(n/2-1) , sum=>full_adder_output(i)(n/2-1));
	  end generate;
gen_reg5 :	  
	  for i in 1 to n/2-1  generate
	         product (n/2 + i - 1) <= full_adder_output (n/2-1)(i);
	  end generate ;
	  product(n-1)<= carry_output(n/2-1)(n/2-1);
       	 
	              
end struct;
