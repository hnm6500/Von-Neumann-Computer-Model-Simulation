----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    14:58:54 03/20/2017 
-- Design Name: Arithmetic Logic Unit
-- Module Name:    ALU - Behavioral 
-- Project Name: Arithmetic Logic Unit 
-- Target Devices: Nexys3 board
-- Tool versions: Spartan 6
-- Description: The top module of the Arithmetic logic unit.
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
use ieee.math_real.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- declaration for ALU input and output 
entity ALU is
generic ( n : integer := 16);
 port( input1 : in std_logic_vector(n-1 downto 0 );
       input2 : in std_logic_vector(n-1 downto 0);
		 Control1 : in std_logic_vector( 3 downto 0 );
		 Output1 : out std_logic_vector ( n-1 downto 0));
end ALU;
-- inner working of the ALU 
architecture Behavioral of ALU is
component Logic_Unit is

port ( A : in std_logic_vector(n-1 downto 0);
       B : in std_logic_vector (n-1 downto 0);
		 Control : in std_logic_vector(3 downto 0);
		 Output : out std_logic_vector(n-1 downto 0));
		 
end component;


component adder_subtractor is
 port( OP: in std_logic;
 A,B : in std_logic_vector(n-1 downto 0);
 R : out std_logic_vector(n-1 downto 0)
);

end component;

-- multiplier component
component  multiplier is

    port ( in_1 : in std_logic_vector ((n-1)/2 downto 0);
           in_2 : in std_logic_vector((n-1)/2 downto 0);
           product : out std_logic_vector ((n-1) downto 0));


end component;

-- shifter component 
component shifter is

   port ( A : in std_logic_vector( n-1 downto 0);
	       amt : in std_logic_vector( Integer (ceil(log2(real(n))))-1 downto 0);
			 Control : in std_logic_vector( 3 downto 0);
			 Output : out std_logic_vector ( n-1 downto 0 ));
end component;
-- temporary signals
signal temp_adder: std_logic_vector(n-1 downto 0);
signal temp_subtractor: std_logic_vector(n-1 downto 0);
signal temp_multiplier :std_logic_vector(n-1 downto 0);
signal temp_logicunitor: std_logic_vector(n-1 downto 0);
signal temp_logicunitnot: std_logic_vector(n-1 downto 0);
signal temp_logicunitand: std_logic_vector(n-1 downto 0);
signal temp_logicunitxor: std_logic_vector(n-1 downto 0);
signal temp_logicunitshiftleft: std_logic_vector(n-1 downto 0);
signal temp_logicunitshiftright: std_logic_vector(n-1 downto 0);
signal temp_arithmeticshiftright : std_logic_vector(n-1 downto 0);

begin

 -- port map for components 
 Adder_subtractor1: adder_subtractor port map ( OP => Control1(0), A => input1, B => input2, R=> temp_adder);
 Adder_subtractor2: adder_subtractor port map ( OP => Control1(0), A => input1, B => input2, R=> temp_subtractor);
 Multiplier1:  multiplier port map ( in_1 =>input1(n/2-1 downto 0) ,in_2 =>input2(n/2-1 downto 0) , product =>temp_multiplier );
 Logicalor : Logic_Unit port map (A => input1, B => input2, Output => temp_logicunitor, Control => Control1); 
 Logicalnot : Logic_Unit port map (A => input1, B => input2, Output =>temp_logicunitnot, Control => Control1);
 Logicaland : Logic_Unit port map (A => input1, B => input2, Output=> temp_logicunitand, Control => Control1);
 Logicalxor : Logic_Unit port map (A => input1, B => input2, Output => temp_logicunitxor, Control => Control1);
 Logicalshiftleft : shifter port map (A => input1, amt => input2( 3 downto 0), Output =>temp_logicunitshiftleft, Control => Control1);
 Logicalshiftright : shifter port map (A => input1, amt => input2(3 downto 0), Output => temp_logicunitshiftright, Control => Control1);
 Arithmeticshiftright : shifter port map ( A => input1, amt => input2(3 downto 0), Output => temp_arithmeticshiftright, Control => Control1);
 
 process(Control1) is 
 begin
 -- output selected based on the control
 case ( Control1) is 
	when "0100" => Output1 <= temp_adder;
	when "0101" => Output1 <= temp_subtractor;
	when "0110" => Output1 <= temp_multiplier;
	when "1000" => Output1 <= temp_logicunitor;
	when "1001" => Output1 <= temp_logicunitnot;
	when "1010" => Output1 <= temp_logicunitand;
	when "1011" => Output1 <= temp_logicunitxor;
	when "1100" => Output1 <= temp_logicunitshiftleft;
	when "1101"=>  Output1 <= temp_logicunitshiftright;
	when "1110" => Output1 <= temp_arithmeticshiftright;
	when others => Output1 <= temp_arithmeticshiftright;
 end case ;
 end process;

end Behavioral;

