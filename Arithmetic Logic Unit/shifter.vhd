----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    13:23:57 03/25/2017 
-- Design Name:  Shifter 
-- Module Name:    shifter - Behavioral 
-- Project Name:  Arithmetic Logic Unit
-- Target Devices: Nexys 3 board
-- Tool versions: Spartan 6
-- Description: 
--performs logical shift left, right and arithmetic shift right operation
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- input and output
entity shifter is
generic ( n : integer := 16);
   port ( A : in std_logic_vector( n-1 downto 0);
	       amt : in std_logic_vector( Integer (ceil(log2(real(n))))-1 downto 0);
			 Control : in std_logic_vector( 3 downto 0);
			 Output : out std_logic_vector ( n-1 downto 0 ));
end shifter;


-- inner working of the shifter 
architecture Behavioral of shifter is


begin


    process(Control,A,amt) is 
	 begin
	 
	 
		 case( Control ) is 

		    -- logical shift left
				when "1100" => Output <=(others => '0'); 
				      Output(  n-1 downto  to_integer ( unsigned(amt))   ) <= A( ( (n-1)-(to_integer (unsigned (amt))) ) downto 0 )    ;
			-- logical shift right
				when "1101" =>Output <=(others => '0');
				Output( ( (n-1)- to_integer (unsigned (amt)) ) downto 0) <=  A(n-1 downto to_integer (unsigned (amt)))   ;
			-- arithmetic shift right
				when others => Output <=(others => A(n-1));
				Output( ((n-1) - (to_integer (unsigned (amt)) ) ) downto 0 ) <=  A( (n-1) downto (to_integer (unsigned (amt) )) )  ;
		 end case ;
	
	

     end process;
end Behavioral;

