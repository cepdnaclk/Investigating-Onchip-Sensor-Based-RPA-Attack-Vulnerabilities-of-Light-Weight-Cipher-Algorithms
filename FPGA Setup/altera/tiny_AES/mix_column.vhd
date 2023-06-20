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

entity mix_column is
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end mix_column;

architecture Behavioral of mix_column is

------------------------------------------------------------------
-- Components
------------------------------------------------------------------ 

component timesx is
	port(	
		a			  : in  std_logic_vector(7 downto 0);
		b			  : out std_logic_vector(7 downto 0));
end component timesx;

	signal a0        : std_logic_vector(7 downto 0);
	signal a1        : std_logic_vector(7 downto 0);
	signal a2        : std_logic_vector(7 downto 0);
	signal a3        : std_logic_vector(7 downto 0);
	signal a0_a1     : std_logic_vector(7 downto 0);
	signal a1_a2     : std_logic_vector(7 downto 0);
	signal a2_a3     : std_logic_vector(7 downto 0);
	signal a3_a0     : std_logic_vector(7 downto 0);
	signal t	        : std_logic_vector(7 downto 0);
	signal xa0_a1    : std_logic_vector(7 downto 0);
	signal xa1_a2    : std_logic_vector(7 downto 0);
	signal xa2_a3    : std_logic_vector(7 downto 0);
	signal xa3_a0    : std_logic_vector(7 downto 0);
	signal a0xa0_a1  : std_logic_vector(7 downto 0);
	signal a1xa1_a2  : std_logic_vector(7 downto 0);
	signal a2xa2_a3  : std_logic_vector(7 downto 0);
	signal a3xa3_a0  : std_logic_vector(7 downto 0);

------------------------------------------------------------------
-- Begin
------------------------------------------------------------------ 

begin

x01:	timesx
 	 port map(
 	 	a => a0_a1,
 	 	b => xa0_a1);
x12:	timesx
 	 port map(
 	 	a => a1_a2,
 	 	b => xa1_a2);
x23:	timesx
 	 port map(
 	 	a => a2_a3,
 	 	b => xa2_a3);
x30:	timesx
 	 port map(
 	 	a => a3_a0,
 	 	b => xa3_a0);

	a0 <= i(31 downto 24);
	a1 <= i(23 downto 16);
	a2 <= i(15 downto 8);
	a3 <= i(7 downto 0);

	a0_a1 <= a0 xor a1;
	a1_a2 <= a1 xor a2;
	a2_a3 <= a2 xor a3;
	a3_a0 <= a3 xor a0;

	t <= a0_a1 xor a2_a3;

	a0xa0_a1 <= a0 xor xa0_a1;
	a1xa1_a2 <= a1 xor xa1_a2;
	a2xa2_a3 <= a2 xor xa2_a3;
	a3xa3_a0 <= a3 xor xa3_a0;

	o(31 downto 24) <= a0xa0_a1 xor t;
	o(23 downto 16) <= a1xa1_a2 xor t;
	o(15 downto 8) <= a2xa2_a3 xor t;
	o(7 downto 0) <= a3xa3_a0 xor t;

end Behavioral;