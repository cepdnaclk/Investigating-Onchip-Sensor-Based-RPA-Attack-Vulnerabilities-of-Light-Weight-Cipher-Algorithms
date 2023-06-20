----------------------------------------------------------------------------------
--
-- Copyright 2019 Ruhr University Bochum, Horst Görtz Institute for IT Security
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software
-- and associated documentation files (the "Software"), to deal in the Software without restriction, 
-- including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
-- and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do 
-- so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial 
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity rcon is
    Port ( count : in  STD_LOGIC_VECTOR (3 downto 0);
           rcon_msb8 : out  STD_LOGIC_VECTOR (7 downto 0));
end rcon;

architecture Behavioral of rcon is
	
begin
	
	COMPUTE_RCON: process(count)
		begin
			case count is
				when x"0" => rcon_msb8 <= x"01";
				when x"1" => rcon_msb8 <= x"02";
				when x"2" => rcon_msb8 <= x"04";
				when x"3" => rcon_msb8 <= x"08";
				when x"4" => rcon_msb8 <= x"10";
				when x"5" => rcon_msb8 <= x"20";
				when x"6" => rcon_msb8 <= x"40";
				when x"7" => rcon_msb8 <= x"80";
				when x"8" => rcon_msb8 <= x"1b";
				when x"9" => rcon_msb8 <= x"36";
				when others => rcon_msb8 <= x"00";
			end case;
		end process;
		

end Behavioral;

