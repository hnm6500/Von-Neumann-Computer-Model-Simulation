----------------------------------------------------------------------------------
-- Company: RIT 
-- Engineer: Hrishikesh Moholkar
-- 
-- Create Date:    12:38:49 04/30/2017 
-- Design Name:     MEMORY CONTROLLER
-- Module Name:    MemoryController - Behavioral 
-- Project Name:   SRAM
-- Target Devices: NEXYS 3 BOARD
-- Tool versions: 
-- Description: SYNCHRONOUS  MEMORY CONTROLLER WHICH READS AND WRITES DATA TO THE SRAM.
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

entity MemoryController is
port (clk : in std_logic;
      reset : in std_logic;
		bus_id : in std_logic;
		rw : in std_logic;
		ready : in std_logic;
		burst : in std_logic;
		addr : in std_logic_vector( 2 downto 0);
		oe : out std_logic;
		we : out std_logic;
		offset : out std_logic_vector( 1 downto 0));
end MemoryController;

architecture Behavioral of MemoryController is
type state_type is ( IDLE, READ1, WRITE1,READY1,b1, b2, b3, b4) ;
signal current_state, next_state : state_type;
signal enabled1, writeenable : std_logic;
begin 

-- synchronisation process
next_stateprocess: process (clk,reset)
		begin 
				if rising_edge(clk) then
					if (reset = '0') then
						current_state <= idle;			--default state
					else
						current_state <= next_state;	--current state
					end if;
				end if;
		end process;
		

--Output Assignment

	--Process to assign values to oe for different states
	enabled1_proc: process (clk)
	begin
		if rising_edge(clk) then
				if (current_state = READ1 or current_state = WRITE1 or current_state = b1 or current_state = b2  or current_state = b3) then
					enabled1 <= '1';
				elsif (current_state = READY1) then
					enabled1 <= enabled1;
				else
					enabled1 <= '0';
				end if;
		end if;
	end process;


--Process to assign values to we for different states
writeenable_proc: process (clk)
	begin
		if rising_edge(clk) then
			if (current_state = WRITE1) then
				writeenable <= '1';
			elsif (current_state = READY1) then
				writeenable <= writeenable;
			else
				writeenable <= '0';
			end if;
		end if;
	end process;


--Process to assign values to offset for different states	
	offset1_proc: process (clk)
	begin
		if rising_edge(clk) then
			if (current_state = b1) then
				offset <= "01";						--Offset for state b1
			elsif (current_state = b2) then
				offset <= "10";						--Offset for state b2
			elsif (current_state = b3) then
				offset <= "11";						--Offset for state b3
			elsif (current_state = b4 or current_state = WRITE1  or current_state = READY1) then
				offset <= offset ;
			else
				offset <= "00";
			end if;
		end if;
	end process;

	
-- next state assignment   
  process (clk,rw,ready,burst)
  begin
    if (rising_edge(clk) ) then
     case current_state is 
	    when IDLE =>
		   genreg:
		      if ( ready = '1' ) THEN 
				genreg1:
				   if ( rw = '1') then
					   
						next_state <= READ1;
						
               else 
                  next_state <= WRITE1;
                  

                end if;
			   else 
				    next_state <= IDLE;
            end if;
				
      when 	WRITE1 =>
          GENREG2:
               next_state <=  READY1;
					
      WHEN READY1 =>
          GENREG3:
					if ( ready = '0') then
                	next_state <= IDLE;
		         else 
					   next_state <= READY1;
					END IF;
				      
		when READ1 =>
         GENREG4 :
               
					IF ( burst = '1' ) then 
					    next_state <=  b1;
				    else 
					     next_state <= READY1;
					end if;
					
		when b1 =>
		        
				genreg5:
				    
					 if (ready = '1') then 
					    
						 next_state <= b2;
					 else
					    next_state <= b1;
						 
					 end if;
		when b2 =>
		    
		      genreg6:
				   
					if (ready = '1') then
					    next_state <= b3 ;
					else
					    next_state <= b2;
					end if;
		when b3 => 
		     
		      genreg7 :
				   
					if (ready = '1') then 
					    next_state <= b4;
				   else 
					    next_state <= b3;
						 
					end if ;
					
	  when b4 => 
	        
	        genreg8 :
			      if ( ready = '1' ) then 
					    
						 next_state <= READY1;
					else 
					     
						  next_state <= b4;
						  
					end if;
					     
	 end case;
end if;
end process;

end Behavioral;

