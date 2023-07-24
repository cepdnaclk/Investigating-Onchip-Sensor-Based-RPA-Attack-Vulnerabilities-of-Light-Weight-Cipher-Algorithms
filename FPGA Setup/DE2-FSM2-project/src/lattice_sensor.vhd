----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:13 11/13/2019 
-- Design Name: 
-- Module Name:    TDCProcess - Behavioral 
-- Project Name: 
-- Target Devices: 
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
use IEEE.NUMERIC_STD.ALL;

entity tdc_decode is
    generic ( input_len : integer := 160; output_width : integer := 8 );
    port ( clk : in std_ulogic;
           rst : in std_ulogic;
		   chainvalue_i : in std_logic_vector(input_len-1 downto 0);
		   coded_o : out std_logic_vector(output_width-1 downto 0));
end tdc_decode;

architecture beh of tdc_decode is
  
  signal dec_reg : std_logic_vector(output_width-1 downto 0) := (others => '0');
  signal tdc_input_buf_reg : std_logic_vector(input_len-1 downto 0);

begin
  
  decodeLogic : process(tdc_input_buf_reg, clk, rst)
  --  variable one_sum : integer := 0;
    variable one_sum : unsigned(7 downto 0) := "00000000";
    variable sel0 : std_logic_vector(1 downto 0);
  begin
    -- combinational
    one_sum := "00000000";
     
    for k in 0 to input_len-1 loop
        --if tdc_input_buf_reg(k) = '1' then
            one_sum := one_sum+ ("0000000" & tdc_input_buf_reg(k));
        --else
				--exit;
		  --end if;
    end loop;
    
    --if (one_msb > 1) then
     --   sel0 :=  tdc_input_buf_reg(one_msb-1) & tdc_input_buf_reg(one_msb-2);
      --  case sel0 is 
       --     when "10" => 
        --        one_msb := one_msb-1;
         --   when others => 
          --      one_msb := one_msb;
        --end case;
    --end if;

    -- sequential
    if rising_edge(clk) then
      if rst = '0' then
       dec_reg <= (others => '1');
       tdc_input_buf_reg <= (others => '1');
      else
       dec_reg <= std_logic_vector(one_sum);
       tdc_input_buf_reg <= chainvalue_i;
      end if;
    end if;
    
  end process;
  
  coded_o <= dec_reg;

end beh;