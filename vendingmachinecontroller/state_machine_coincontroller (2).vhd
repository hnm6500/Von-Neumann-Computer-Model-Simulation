---------------------------------------------------------------------------------
-- Company: Hrishikesh Moholkar
-- Engineer: Rochester Institute of Technology
-- 
-- Create Date:    18:36:32 03/29/2017 
-- Design Name:    coin controller
-- Module Name:    state_machine_coincontroller - Behavioral 
-- Project Name:   vending machine
-- Target Devices:  nexys 3 board
-- Tool versions:    
-- Description:   coin controller performs main function of 
-- accepting money, giving soda, giving error etc.
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
 use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity state_machine_coincontroller is
port (
   Clk : in std_logic;
	Reset_n : in std_logic;
	Qp : in std_logic;
	Dp : in std_logic;
	Np : in std_logic;
	Soda_req : in std_logic;
	Soda_price : in std_logic_vector(3 downto 0);
	Drop_soda : out std_logic;
	Amt_err : out std_logic;
	Amt_dep : out std_logic_vector(11 downto 0));
	
	
end state_machine_coincontroller;

architecture Behavioral of state_machine_coincontroller is

type state_type is (RESET,IDLE,WAIT1,SODA_REQ1,DROP_SODA1,ERROR,DIME1,QUARTER1,NICKEL1);  --type of state machine.
signal current_s,next_s: state_type;  --current and next state declaration.
signal q,d,n :std_logic;
signal led_success : std_logic;
signal led_failure : std_logic;
begin


process ( Clk,Reset_n)
begin
 if (Reset_n = '0') then
  current_s <= RESET;  --default state on reset.
  
  
 elsif (rising_edge(Clk)) then
  current_s <= next_s;   --state change.
  
 end if;
 
end process;


process (current_s,Qp,Dp,Np,Soda_req,Soda_price,Reset_n,q,n,d)
-- temporarty variables for quarters, dime, nickel
variable quarter : integer := 0;
variable dime : integer := 0;
variable nickel : integer := 0;
variable price : integer := 0;
-- temporary signal for balance
variable balance : integer :=0;
begin
		   
			 
		  -- soda price
            Label23:			  
					 case (Soda_price) is 
					   
						when "0000" =>
						  if price = 0 then 
						   price := price + 55;
						  else 
						    price := 0;
							 price := price + 55;
						  end if;
						  
						when "0001" => 
						  if price = 0 then 
						    price := price + 85;
						  else 
						     price := 0;
							  price := price + 85;
			           end if;
						  
					   when "0010" => 
						  if price = 0 then 
						   price := price + 95;
						  else 
						    price := 0;
							 price := price + 95;
			           end if;
						  
				      when "0011" => 
						  if price = 0 then
						   price := price + 125;
						  else 
						    price := 0;
							 price := price + 125;
						  end if;
						  
						when "0100" => 
						  if price = 0 then
						   price := price + 135;
						  else 
						     price := 0;
							  price := price + 135; 
						  end if;	
						  
						when "0101" => 
						  if price = 0 then 
						   price := price + 150;
						  else 
						     price := 0;
							  price := price + 150; 
						  end if;
						  
						when "0110" => 
						 if price = 0 then 
						   price := price + 225;
						 else 
						     price := 0;
							  price := price + 225;
						 end if;	
						 
						when "0111" => 
						  if price = 0 then 
						   price := price + 250;
						  else 
						     price := 0;
							  price := price + 250;
						  end if;	
						  
						when "1000" => 
						 if price = 0 then 
						   price := price + 300;
						 else  
						     price := 0;
							  price := price + 300;
						 end if;	
						 
						when others =>
						  if price  = 0 then 
						   price := price + 700;
						  else 
						     price := 0;
							  price := price + 700;
						  end if;
				   end case;
		

     --  evaluating conditions based on currnet state      
    case current_s is 
	 
	   when RESET => 
		   
				balance := 0;
				led_success<= '0'; -- drop soda successful
				led_failure<='0';	 -- drop soda failed
				next_s <=WAIT1;
		   
	   when IDLE =>
		  Drop_soda <= '0';
		  Amt_err <= '0';
		  if (Soda_req = '1' and Qp = '0' AND Dp = '0' AND Np ='0' ) then 
		     next_s <= SODA_REQ1;
		  elsif ( Qp = '1' AND Dp = '0' AND Np ='0') then 
		      q<='1';
		      next_s <= QUARTER1;
				
		  elsif (Dp = '1' AND Qp = '0' AND Np ='0' ) then 
		       d<='1';
		       next_s <= DIME1;
				
		  elsif (Np = '1' and Qp = '0' AND Dp ='0') then
             n<='1';		  
		       next_s <= NICKEL1;
				 
			 
		  end if;
		  
		  
		when QUARTER1 => 
		  
		  if (Qp = '1' AND Dp = '0' AND Np ='0') then 
		     quarter := 25;
			  balance := balance + 25;
			  Amt_dep <= std_logic_vector(to_unsigned(balance,12));
			  next_s <= WAIT1; 
			 
		  else
           q <= '0';		  
		     
		     next_s <= WAIT1;   
				
		  end if; 		
		   
		 when DIME1 => 
		 
			if (Dp = '1' AND Qp = '0' AND Np ='0') then 
		     dime := 10;
			  balance := balance + 10;
			  Amt_dep <=std_logic_vector(to_unsigned(balance,12));
			  next_s <= WAIT1; 
			  
		   else 
			  d <= '0';
			  
			  next_s <= WAIT1;
		      
		   end if; 	
		  
		 when NICKEL1 => 
		 
			if (Np = '1' and Qp = '0' AND Dp ='0') then 
		     nickel :=  5;
			  balance := balance + 5;
			  Amt_dep <= std_logic_vector(to_unsigned(balance,12));
			  next_s <= WAIT1; 
			 
		 
		      
		   end if; 
        
           		  
		
        when WAIT1 => 		
		     
				if(Np = '0' and Dp = '0' and Qp = '0'  and Soda_req = '0' and reset_n = '1') then 
			          q <='0';
						 d<='0';
						 n<='0';
						 
						 quarter := 0;
						 dime := 0;
						 nickel := 0;
						 next_s <= IDLE;
			  else 
			    
				  next_s <= WAIT1;
			  
			  end if;
		   

			  
			when ERROR =>
			    
				  
				      led_failure <= '1' ; 
						led_success<= '0';
						Drop_soda <= '0';
						Amt_err <= '1';
						next_s <= WAIT1;
				  
				      
				  
			when SODA_REQ1 =>
				 Label14: 
			       if (price <= balance ) then 
					     
						  balance := balance - price ;
						  Amt_dep <= std_logic_vector(to_unsigned(balance,12));
						  
						  next_s <= DROP_SODA1;
						  --Amt_err <= '0';
						 
					 else 
					     
						  next_s <= ERROR;
						  
				    end if;
			  
			when DROP_SODA1 =>
                
					
					   --led_success <= '1';
						
						--led_failure <= '0';
						 
						Drop_soda <= '1';
						Amt_err <= '0';
						next_s <= WAIT1;
						
				  
				      
			when others =>
			     led_failure <= '0';
				  led_success <= '0';
			     next_s <= IDLE;
				  
       end case;            
			
end process;						  
   
end Behavioral;