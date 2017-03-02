----------------------------------------------------------------------------------
-- Company: Rochester Institute Of Technology
-- Engineer: Hrishikesh Nitin Moholkar
-- 
-- Create Date:    16:44:30 02/20/2017 
-- Design Name: register file
-- Module Name:    multiplexer module  
-- Project Name: lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: 8:1 multiplexer for sending data
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
-- initializing ports for the mux
entity MUX_8_TO_1 is
    generic ( N : integer := 4);
    Port ( Y0 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	        Y1 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  Y2 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  Y3 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  Y4 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  Y5 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  Y6 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  Y7 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			  SEL : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
           Z : out  STD_LOGIC_VECTOR(N-1 DOWNTO 0));
end MUX_8_TO_1;
-- internal working for the mux
architecture Behavioral of MUX_8_TO_1 is
BEGIN
PROCESS (SEL)
BEGIN
	 CASE SEL IS 
			WHEN "000" => Z <= Y0;
			WHEN "001" => Z <= Y1;
			WHEN "010" => Z <= Y2;
			WHEN "011" => Z <= Y3;
			WHEN "100" => Z <= Y4;
			WHEN "101" => Z <= Y5;
			WHEN "110" => Z <= Y6;
			WHEN "111" => Z <= Y7;
			WHEN OTHERS => Z <= Y0;
	  END CASE;
END PROCESS;

end Behavioral;

