----------------------------------------------------------------------------------
-- Company: Rochester Institute Of Technology
-- Engineer: Hrishikesh Nitin Moholkar
-- 
-- Create Date:    16:44:30 02/20/2017 
-- Design Name: register file
-- Module Name:    register_file - Behavioral 
-- Project Name: lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: combines all the modules required for register file.
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
library UNISIM;
use UNISIM.VComponents.all;
-- inputs to register file
entity register_file is
    generic ( N : integer := 16); 
    Port ( rd1 : in  STD_LOGIC_vector(2 downto 0);
           rd2 : in  STD_LOGIC_vector(2 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           wr : in  STD_LOGIC_vector(2 downto 0);
           In1 : in  STD_LOGIC_vector(N-1 downto 0);
           out1 : out  STD_LOGIC_vector(N-1 downto 0);
           out2 : out  STD_LOGIC_vector(N-1 downto 0);
           we : in  STD_LOGIC);
end register_file;


architecture Behavioral of register_file is
-- temporary signals to connect the internal outputs of the gates to the d flip flop register module
-- decoder output, and gate input
	signal temp_decoder_out :std_logic_vector(7 downto 0);
-- and gate output 
	signal temp_and_out1 :std_logic;
	signal temp_and_out2 :std_logic;
	signal temp_and_out3 :std_logic;
	signal temp_and_out4 :std_logic;
	signal temp_and_out5 :std_logic;
	signal temp_and_out6 :std_logic;
	signal temp_and_out7 :std_logic;
	signal temp_and_out8 :std_logic;
--register moduile input
	signal temp_register_dflipflop1: std_logic_vector(N-1 DOWNTO 0);
   signal temp_register_dflipflop2: std_logic_vector(N-1 DOWNTO 0); 
	signal temp_register_dflipflop3: std_logic_vector(N-1 DOWNTO 0);
	signal temp_register_dflipflop4: std_logic_vector(N-1 DOWNTO 0);
	signal temp_register_dflipflop5: std_logic_vector(N-1 DOWNTO 0);
	signal temp_register_dflipflop6: std_logic_vector(N-1 DOWNTO 0);
	signal temp_register_dflipflop7: std_logic_vector(N-1 DOWNTO 0);
	signal temp_register_dflipflop8: std_logic_vector(N-1 DOWNTO 0);
	
-- decoder (3:8) 
    component Decoder_3_to_8 is
	      Port ( Din: in  STD_LOGIC_VECTOR(2 DOWNTO 0);
               Dout: OUT  STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
--and gate
	component AND_GATE is 
	        Port ( in_x : in STD_LOGIC;
				in_y : in STD_LOGIC;
			  out_x : out std_logic);
			  
	end component;
--multiplexer 8:1
	component MUX_8_TO_1 IS 
			generic ( N : integer := N); 
	     PORT ( --Y: IN std_logic_vector(8* N-1 DOWNTO 0);
		        Y0 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				  Y1 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			     Y2 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			     Y3 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				  Y4 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			     Y5 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			     Y6 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			     Y7 : in  STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			     SEL : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
              Z : out  STD_LOGIC_VECTOR(N-1 DOWNTO 0));
    end component;
-- register module( dflip flop array)	 
	 component register_dflipflop is
	      generic ( N : integer := N); 
	      PORT ( clock : in  STD_LOGIC;
                reset : in  STD_LOGIC;
					write_enable : in  STD_LOGIC;
					data_in : in  STD_LOGIC_vector(N-1 DOWNTO 0);
					data_out : out  STD_LOGIC_vector(N-1 DOWNTO 0));
     end component;

begin
--  connecting internal components 
   decoder_registerfile_1 : Decoder_3_to_8 PORT MAP( Din => wr, Dout => temp_decoder_out);
	
	 AND_GATE1 : AND_GATE PORT MAP (in_x => temp_decoder_out(0), in_y=> we, out_x => temp_and_out1);
	 AND_GATE2 : AND_GATE PORT MAP (in_x => temp_decoder_out(1), in_y=> we, out_x => temp_and_out2);
	 AND_GATE3 : AND_GATE PORT MAP (in_x => temp_decoder_out(2), in_y=> we, out_x => temp_and_out3);
	 AND_GATE4 : AND_GATE PORT MAP (in_x => temp_decoder_out(3), in_y=> we, out_x => temp_and_out4);
	 AND_GATE5 : AND_GATE PORT MAP (in_x => temp_decoder_out(4), in_y=> we, out_x => temp_and_out5);
	 AND_GATE6 : AND_GATE PORT MAP (in_x => temp_decoder_out(5), in_y=> we, out_x => temp_and_out6);
	 AND_GATE7 : AND_GATE PORT MAP (in_x => temp_decoder_out(6), in_y=> we, out_x => temp_and_out7);
	 AND_GATE8 : AND_GATE PORT MAP (in_x => temp_decoder_out(7), in_y=> we, out_x => temp_and_out8);
	 
	 Dflip_flop1 :register_dflipflop PORT MAP ( write_enable => temp_and_out1, data_in => In1 , data_out => temp_register_dflipflop1, clock => clk ,reset => rst );
	 Dflip_flop2 :register_dflipflop PORT MAP ( write_enable => temp_and_out2, data_in => In1 , data_out => temp_register_dflipflop2, clock => clk ,reset => rst );
	 Dflip_flop3 :register_dflipflop PORT MAP ( write_enable => temp_and_out3, data_in => In1 , data_out => temp_register_dflipflop3, clock => clk ,reset => rst );
	 Dflip_flop4 :register_dflipflop PORT MAP ( write_enable => temp_and_out4, data_in => In1 , data_out => temp_register_dflipflop4, clock => clk ,reset => rst );
	 Dflip_flop5 :register_dflipflop PORT MAP ( write_enable => temp_and_out5, data_in => In1 , data_out => temp_register_dflipflop5, clock => clk ,reset => rst );
	 Dflip_flop6 :register_dflipflop PORT MAP ( write_enable => temp_and_out6, data_in => In1 , data_out => temp_register_dflipflop6, clock => clk ,reset => rst );
	 Dflip_flop7 :register_dflipflop PORT MAP ( write_enable => temp_and_out7, data_in => In1 , data_out => temp_register_dflipflop7, clock => clk ,reset => rst );
	 Dflip_flop8 :register_dflipflop PORT MAP ( write_enable => temp_and_out8, data_in => In1 , data_out => temp_register_dflipflop8, clock => clk ,reset => rst );
	 
	 Mux1: MUX_8_TO_1 PORT MAP ( Y0 =>temp_register_dflipflop1, Y1 => temp_register_dflipflop2 , Y2 => temp_register_dflipflop3, Y3 =>temp_register_dflipflop4, Y4 => temp_register_dflipflop5 , Y5 => temp_register_dflipflop6, Y6 => temp_register_dflipflop7, Y7 =>temp_register_dflipflop8 , SEL => rd1, z => out1);
	 Mux2: MUX_8_TO_1 PORT MAP ( Y0 =>temp_register_dflipflop1, Y1 => temp_register_dflipflop2 , Y2 => temp_register_dflipflop3, Y3 =>temp_register_dflipflop4, Y4 => temp_register_dflipflop5 , Y5 => temp_register_dflipflop6, Y6 => temp_register_dflipflop7, Y7 =>temp_register_dflipflop8 , SEL => rd2, z => out2);
	 
end Behavioral;

