----------------------------------------------------------------------------------
-- Company: Rochester 	Institute of Technology
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    14:32:28 03/19/2017 
-- Design Name: Adder/subtractor circuit
-- Module Name:    adder_subtractor - Behavioral 
-- Project Name:  Arithmetic logic unit
-- Target Devices: Nexys 3 board 
-- Tool versions: spartan 6
-- Description: 
--Addition and subtraction operation of arithmetic logic unit
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
-- input and output
entity adder_subtractor is
  generic ( n : integer := 16);
 port( OP: in std_logic;
 A,B : in std_logic_vector(n-1 downto 0);
 R : out std_logic_vector(n-1 downto 0)

 );

end adder_subtractor;
-- structure of the adder
architecture struct of adder_subtractor is

	component full_Adder is

			port( X, Y, Cin : in std_logic;
					sum, Cout : out std_logic);

	end component;

-- internal signals
signal C1: std_logic_vector(n-1 downto 0);
signal TMP: std_logic_vector(n-1 downto 0);

-- ripple adder/subtractor  functioning
begin
         TMP(0) <= OP xor B(0);
         FA1: full_adder port map(X=>A(0),Y=>TMP(0),Cin => OP, sum => R(0),Cout => C1(0));      
GEN_REG:
               
        for i in 1 to n-1 generate
        
					TMP(i) <= OP xor B(i);
			
					
					FA2: full_adder port map( X=> A(i),Y => TMP(i) ,Cin => C1(i-1), sum => R(i),Cout => C1(i) );
					
			
			
        
        end generate;
	     
end struct;
