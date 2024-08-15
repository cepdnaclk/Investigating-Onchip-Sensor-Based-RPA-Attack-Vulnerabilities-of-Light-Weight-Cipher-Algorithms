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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flipflop_en is
	generic (NBITS: integer);
	port(
		clk		: in std_logic;
		sel	: in std_logic;
		en	: in std_logic;
		D0	: in std_logic_vector(NBITS-1 downto 0);
		D1	: in std_logic_vector(NBITS-1 downto 0);
		Q	: out std_logic_vector(NBITS-1 downto 0)
		);

end entity flipflop_en;

architecture dfl of flipflop_en is

	signal d, s_current_state, s_next_state	: std_logic_vector(NBITS-1 downto 0);
	
begin
s_next_state	<= d;
q <= s_current_state;

FLIP_FLOP:	Process(clk, s_next_state, en, s_current_state)
	begin
		if en = '1' AND (clk'event AND clk = '1') then
			s_current_state <= s_next_state;
		else
			s_current_state <= s_current_state;
		end if;
end process;

d <= D0 when sel = '0'
		else D1;
end architecture dfl;
