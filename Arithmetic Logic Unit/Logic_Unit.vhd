----------------------------------------------------------------------------------
-- Company: Rochester Institute of technology 
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    15:02:49 03/20/2017 
-- Design Name:  Logical unit 
-- Module Name:    Logic_Unit - Behavioral 
-- Project Name: arithmetic logic unit
-- Target Devices: nexys 3 board 
-- Tool versions: spartan 6
-- Description:
--performing logical operations such as or ,and, exor  and not.
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
-- input and output
entity Logic_Unit is
generic ( n : integer := 16);
port ( A : in std_logic_vector(n-1 downto 0);
       B : in std_logic_vector (n-1 downto 0);
		 Control : in std_logic_vector(3 downto 0);
		 Output : out std_logic_vector(n-1 downto 0));
		 
end Logic_Unit;
-- inner working of the logic unit
architecture Behavioral of Logic_Unit is


begin
-- monitoring the changes of the outputs based on the inputs 
PROCESS( A,B,Control) is 
begin
   C1:

     case Control is 
       -- or operation
		  when "1000" => Output <= A or B;
		  --and operation
		  when "1010" => Output <= A and B;
		  -- xor operation
		  when "1011" => Output <= A xor B;
		  -- not operation
		  when "1001" =>  Output <= not A;  
		  when others => Output<=A;

     end case C1;
end process;
end Behavioral;

