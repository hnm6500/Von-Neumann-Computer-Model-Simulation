----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: Prof. Cliver
-- 
-- Create Date:    16:03:53 04/27/2017 
-- Design Name:     SRAM
-- Module Name:    SRAM - Behavioral 
-- Project Name: SRAM
-- Target Devices: NEXYS-3 BOARD
-- Tool versions: 
-- Description: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SRAM is
	port (oe,we: in std_logic;
			addr: in std_logic_vector(2 downto 0);
			data_in: in std_logic_vector(3 downto 0);
			data_out : out std_logic_vector(3 downto 0));
end SRAM;

architecture Behavioral of SRAM is

--Signal Assignment
type data_type is array((2**3)-1 downto 0) of std_logic_vector(3 downto 0);
signal data : data_type;
signal oe_wr : std_logic_vector(1 downto 0);
signal data_temp : std_logic_vector(3 downto 0);

begin

oe_wr <= oe & we;

--Process to assign values to data_temp
process(oe_wr,data_temp,data_in,data) is begin
		case oe_wr is
			when "10" => data_temp <= data(to_integer(unsigned(addr)));     --data_temp gets the data at the address
			when "01" => data_temp <= data_in;								--data_temp gets the data_in
			when others => data_temp <=data_temp;
		end case;
end process;

--Process to assign values to data
process(oe_wr,addr,data_in,data) is begin
		if oe_wr = "01" then
			data(to_integer(unsigned(addr))) <= data_in;					--data_in goes to data
		end if;
end process;
		data_out <= data(to_integer(unsigned(addr)));						--data_out gets assigned
end Behavioral;

