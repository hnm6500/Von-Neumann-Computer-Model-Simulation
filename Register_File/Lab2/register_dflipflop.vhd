----------------------------------------------------------------------------------
-- Company: Rochester Institute Of Technology
-- Engineer: Hrishikesh Nitin Moholkar
-- 
-- Create Date:    16:44:30 02/20/2017 
-- Design Name: register module (Array of d flip flop)
-- Module Name:    register_file - Behavioral 
-- Project Name: lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: Register module for storing multiple data
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;
-- register module declaration
entity register_dflipflop is
    generic ( N : integer := 4 ; R : integer := 0);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_enable : in  STD_LOGIC;
           data_in : in  STD_LOGIC_vector(N-1 downto 0);
           data_out : OUT  STD_LOGIC_vector(N-1 DOWNTO 0));
end register_dflipflop;
-- d flip flop working 
architecture Behavioral of register_dflipflop is
signal memory: std_logic_vector(n-1 downto 0);
begin
    process (clock, reset) is 
    begin
	 if(reset = '1') then
		memory <= std_logic_vector(to_unsigned(R, N));
		data_out <= std_logic_vector(to_unsigned(R, N));
	 elsif rising_edge(clock) then
	      if  write_enable = '1' then
		     memory <= data_in;
			  data_out <= data_in;
		   else 
				data_out<= memory;
		   end if;
		 end if;
	 end process;
end  Behavioral;
	      

