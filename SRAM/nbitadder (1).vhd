----------------------------------------------------------------------------------
-- Company: RIT
-- Engineer: HRISHIKESH MOHOLKAR
-- 
-- Create Date:    15:05:29 04/30/2017 
-- Design Name:   HALF ADDER
-- Module Name:    nbitadder - Behavioral 
-- Project Name: SRAM
-- Target Devices: NEXYS-3 BOARD
-- Tool versions: 
-- Description: THIS ADDS THE OFFSET AND THE ADDRESS AND THEN FEEDS IT TO THE SRAM
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Compile in Altera's Quartus
-- Compile Design > Analysis and Synthesis > 
--    Netlist Viewers > RTL Viewers
-- Right click and flatten design
--    Hold mouse to left of input pin to view design

entity nbitadder is
  
  port ( addr          : in  std_logic_vector(2 downto 0);
         offset         : in std_logic_vector (1 downto 0);
        sum           : out std_logic_vector(2 downto 0));
end nbitadder ;


architecture behavioral of Nbitadder is
  signal int_cout : std_logic_vector(2 downto 0);
  signal temp_in_offset : stD_logic_vector ( 1 downto 0);
  signal temp_out : std_logic_vector(2 downto 0);

begin
  temp_in_offset <= offset;
  temp_out <= '0' & temp_in_offset;

	sum <= std_logic_vector( unsigned(addr) + unsigned(temp_out) );



end behavioral ;