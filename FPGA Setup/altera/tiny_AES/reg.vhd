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

--
--		D1
--		|
--	+---------------+
--  D0->|			|->Q0
--	+---------------+
--		|
--		Q1
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
	generic (NBITS_D0: integer;
		 NBITS_D1: integer);
	port(
		clk	: in std_logic;
		sel	: in std_logic;
		en	: in std_logic;
		D0	: in std_logic_vector(NBITS_D0 - 1 downto 0);
		D1	: in std_logic_vector(NBITS_D1 - 1 downto 0);
		Q0	: out std_logic_vector(NBITS_D0 -1 downto 0);
		Q1	: out std_logic_vector(NBITS_D1 -1 downto 0)
		);

end entity reg;


architecture dfl of reg is

	signal int_D0, int_Q 	: std_logic_vector(NBITS_D1 - 1 downto 0);

component flipflop_en is
	generic (NBITS: integer);
	port(
		clk	: in std_logic;
		sel	: in std_logic;
		en	: in std_logic;
		D0	: in std_logic_vector(NBITS-1 downto 0);
		D1	: in std_logic_vector(NBITS-1 downto 0);
		Q	: out std_logic_vector(NBITS-1 downto 0)
		);

end component flipflop_en;

begin


gen_ff:
FOR i in 1 to NBITS_D1/NBITS_D0 GENERATE
ff: flipflop_en
	generic map(NBITS=>NBITS_D0)
	port map(
		clk => clk,
		en => en,
		sel => sel,
		D0 => int_D0(NBITS_D0*i - 1 downto (i-1)*NBITS_D0),
      D1 => D1(NBITS_D0*i - 1 downto (i-1)*NBITS_D0),
      Q => int_Q(NBITS_D0*i - 1 downto (i-1)*NBITS_D0)
		);
		
		
END GENERATE gen_ff;

--regular case
int_D0 <= int_Q(NBITS_D1 - NBITS_D0 - 1 downto 0)&D0;

--special case for NBITS_D0 = NBITS_D1
--int_D0 <= D0;

Q0 <= int_Q(NBITS_D1 - 1 downto NBITS_D1 - NBITS_D0);
Q1 <= int_Q;


end architecture;
