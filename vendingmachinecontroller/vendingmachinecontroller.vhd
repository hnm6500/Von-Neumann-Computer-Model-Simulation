----------------------------------------------------------------------------------
-- Company: ROCHESTER INSTITUTE OF TECHNOLOGY
-- Engineer: HRISHIKESH MOHOLKAR
-- 
-- Create Date:    13:37:35 04/02/2017 
-- Design Name:  VENDING MACHINE CONTROLLER
-- Module Name:    vendingmachinecontroller - Behavioral 
-- Project Name:  Vending machine
-- Target Devices:   	Nexys 3 Board
-- Tool versions: 
-- Description:     Wrapper class for coin controller and seven segment decoder
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
use work.bin_bcd.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


-- wrapper class
entity vending_machine_controller is
port (
   Clk : in std_logic;
	Reset_n : in std_logic;
	Qp : in std_logic;
	Dp : in std_logic;
	Np : in std_logic;
	Soda_req: in std_logic;
	Amt_err :  out std_logic;
	Drop_soda :out std_logic;
	Soda_price : in std_logic_vector(3 downto 0);
	hund_disp_n : out std_logic_vector(6 downto 0);
	tens_disp_n : out std_logic_vector(6 downto 0);
	ones_disp_n : out std_logic_vector(6 downto 0));

end vending_machine_controller;

-- coin controller
architecture structural of vending_machine_controller is
component state_machine_coincontroller is 
  port(Clk : in std_logic;
	    Reset_n : in std_logic;
	    Qp : in std_logic;
	    Dp : in std_logic;
	    Np : in std_logic;
	    Soda_req : in std_logic;
	    Soda_price : in std_logic_vector(3 downto 0);
	    Drop_soda : out std_logic;
	    Amt_err : out std_logic;
	   Amt_dep : out std_logic_vector(11 downto 0) );
end component;

-- seven segment decoder
component sevensegmentdecoder is 
    port (  BCD : in std_logic_vector (11 downto 0);
	        hund_disp_n : out std_logic_vector(6 downto 0);
			  tens_disp_n : out std_logic_vector(6 downto 0);
			  ones_disp_n : out std_logic_vector(6 downto 0));
	
end component;



signal bcd_vector,amt_dep1 :std_logic_vector(11 downto 0);

begin
   
  Coin_controller_generate : state_machine_coincontroller port map (Clk => Clk, Reset_n =>Reset_n, Qp=>Qp, Dp=>Dp, Np=>Np, Soda_req=>Soda_req, Soda_price=>Soda_price, Drop_soda =>Drop_soda, Amt_err=>Amt_err, Amt_dep=> amt_dep1);
  
  bcd_vector <= bin_to_bcd( amt_dep1);
  Sevensegmentdecoder_generate :  sevensegmentdecoder port map (BCD => bcd_vector,hund_disp_n=>hund_disp_n, tens_disp_n=>tens_disp_n,ones_disp_n=>ones_disp_n ); 
  


end structural;

