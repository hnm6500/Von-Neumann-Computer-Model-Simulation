----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: HRISHIKESH MOHOLKAR
-- 
-- Create Date:    12:45:31 04/30/2017 
-- Design Name:  IO BUS
-- Module Name:    IObus - Behavioral 
-- Project Name:  SRAM
-- Target Devices: NEXYS-3 BOARD
-- Tool versions: 
-- Description: THIS IS THE WRAPPER FOR THE MEMORY UNIT
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

-- IOBUS INPUTS
entity IObus is
port (
      clk : in std_logic;
      rst : in std_logic;
      ----outdataconnector : inout std_logic_vector(3 downto 0) ;
		bus_id : in std_logic;
		rw : in std_logic;
		ready : in std_logic;
		burst : in std_logic;
		addr : in std_logic_vector( 2 downto 0);
		Data : in std_logic_vector(3 downto 0) ;
		unused_anode : out STD_LOGIC; 
	   hund_anode   : out STD_LOGIC; 
	   tens_anode   : out STD_LOGIC; 
	   ones_anode   : out STD_LOGIC; 
	   CAn,CBn,CCn,CDn,CEn,CFn,CGn : out STD_LOGIC );
end IObus;

architecture structural of IObus is


component Memory_Controller is
port (clk : in std_logic;
      rst : in std_logic;
		bus_id : in std_logic;
		rw : in std_logic;
		ready : in std_logic;
		burst : in std_logic;
		addr : in std_logic_vector( 2 downto 0);
		oe : out std_logic;
		we : out std_logic;
		offset : out std_logic_vector( 1 downto 0));
end component;

component sram is
port (oe : in std_logic ;
      we : in std_logic;
		addr: in std_logic_vector(2 downto 0);
		data_in : in std_logic_vector(3 downto 0);
		data_out : out std_logic_vector (3 downto 0));
end component;


component tristatebuffer is
port ( X  : IN STD_LOGIC_vector( 3 DOWNTO 0);
       Y :  OUT STD_LOGIC_VECTOR ( 3 DOWNTO 0);
		 CONTROL  : IN STD_LOGIC);

end component;

component nbitadder is
  
  port ( addr          : in  std_logic_vector(2 downto 0);
         offset         : in std_logic_vector (1 downto 0);
        sum           : out std_logic_vector(2 downto 0));
end component ;

component sevensegmentdecoder is
	port (  BCD : in std_logic_vector (11 downto 0);
	        hund_disp_n : out std_logic_vector(6 downto 0);
			  tens_disp_n : out std_logic_vector(6 downto 0);
			  ones_disp_n : out std_logic_vector(6 downto 0));
	
end component;


component seven_seg_disp is
    Port ( hund_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
	        tens_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
           ones_disp_n  : in  STD_LOGIC_VECTOR (6 downto 0);
	        clk          : in  STD_LOGIC; -- digilent board generated clock
			  reset_n      : in  STD_LOGIC; -- switch input
			  unused_anode : out STD_LOGIC; -- unused an3
			  hund_anode   : out STD_LOGIC; -- digilent an2
	        tens_anode   : out STD_LOGIC; -- digilent an3
	        ones_anode   : out STD_LOGIC; -- digilent an4
			  CAn,CBn,CCn,CDn,CEn,CFn,CGn : out STD_LOGIC); -- digilent cathode - used for all displays
end component;

-- INTERNAL SIGNALS

signal temp_oe, temp_we : std_logic;
signal temp_offset : std_logic_vector(1 downto 0);
signal temp_sum : std_logic_vector (2 downto 0) ;
signal temp_carry : std_logic;
signal temp_datain : std_logic_vector(3 downto 0);
signal temp_dataout : std_logic_vector(3 downto 0);
signal temp_COMPARATOR_dataout,temp_COMPARATOR_dataout1,temp_COMPARATOR_dataout2 : std_logic_vector(3 downto 0);
signal we_temp,oe_temp  : std_logic;
signal ones,tens,hundreds : std_logic_vector( 6 downto 0);
signal bcd_vector : std_logic_vector(11 downto 0);
signal bcd_vector11 : std_logic_vector(11 downto 0);
signal ones_d,tens_d,hundreds_d : std_logic_vector( 6 downto 0);
signal out_data_lastmux11  : std_logic_vector(11 downto 0);
signal inoutdataconnector1 : std_logic_vector(3 downto 0) ;
signal inoutdataconnector2 : std_logic_vector(3 downto 0) ;
begin


genreg_memory_controller:Memory_Controller port map ( clk => clk, rst =>rst, bus_id => bus_id, rw =>rw , ready =>ready , burst =>burst , addr =>addr, oe =>oe_temp , we =>we_temp , offset =>temp_offset);
genreg2adder : nbitadder port map (addr =>addr  , offset=>temp_offset , sum =>temp_sum);

genreg3 : sram port map (oe => oe_temp, we => we_temp, addr => temp_sum, data_in =>Data , data_out=> temp_dataout );

genregcomparator1 : tristatebuffer  port map (X => temp_dataout, Y =>temp_COMPARATOR_dataout1, Control => oe_temp); 
genregcomparator2 : tristatebuffer  port map (X => Data, Y =>temp_COMPARATOR_dataout2, Control => we_temp);
inoutdataconnector2 <= temp_COMPARATOR_dataout1;
bcd_vector <= "0000"& temp_COMPARATOR_dataout2& inoutdataconnector2;
genregdecoder : sevensegmentdecoder port map (BCD =>bcd_vector , hund_disp_n=>hundreds ,tens_disp_n =>tens ,ones_disp_n=>ones   );
ones_d <= ones;
tens_d <= tens;
hundreds_d <= hundreds;
genregdisplay : seven_seg_disp port map ( hund_disp_n=>hundreds_d , tens_disp_n=>tens_d ,ones_disp_n=>ones_d ,tens_anode=>tens_anode,clk=>clk, reset_n=>rst ,unused_anode=>unused_anode,hund_anode=>hund_anode,ones_anode=>ones_anode,CAn=>CAn ,CBn=>CBn ,CCn=>CCn ,CDn=>CDn ,CEn=>CEn ,CFn=>CFn ,CGn=>CGn );


end structural;



