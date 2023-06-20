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

entity keyschedule is
		Port ( clk : in  STD_LOGIC;
           ctrl : in  STD_LOGIC_VECTOR (2 downto 0);
			  counterRound : in STD_LOGIC_VECTOR(3 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           sboxOut : in  STD_LOGIC_VECTOR (31 downto 0);
			  sboxIn : out  STD_LOGIC_VECTOR (31 downto 0);
           roundkey : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end keyschedule;

architecture dfl of keyschedule is

----------------------------------------------------------
-- component declaration
----------------------------------------------------------
component reg is
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
end component reg;

	COMPONENT rcon
	PORT(
		count : IN std_logic_vector(3 downto 0);          
		rcon_msb8 : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
----------------------------------------------------------
-- signal declaration
----------------------------------------------------------

signal inputSer, outputSer : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal inputPar, outputPar : STD_LOGIC_VECTOR(127 DOWNTO 0);

signal rcon_msb8 : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal outXor, inXor, sboxOutXorRcon : STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
----------------------------------------------------------
-- component instantiation
----------------------------------------------------------

keystate: reg
generic map(NBITS_D0=>32,
				NBITS_D1=>128)
	port map(
				clk => clk,
				sel => ctrl(1),
				en => ctrl(0),
				D0 => inputSer,
				D1 => inputPar,
				Q0 => outputSer,
				Q1 => outputPar
				);
				
--rcon_lut:
	Inst_rcon: rcon PORT MAP(
		count => counterRound,
		rcon_msb8 => rcon_msb8
	);				

inputPar <= key;

--serial:
inputSer <= outXor;

outXor <= outputSer XOR inXor;

inXor <= sboxOutXorRcon when ctrl(2) = '1'
		else outputPar(31 downto 0);

sboxOutXorRcon <= (sboxOut(31 downto 24) xor rcon_msb8) & sboxOut(23 downto 0);
		
sboxIn <= outputPar(23 downto 0) & outputPar(31 downto 24);
roundkey <= outputPar(31 downto 0);
		
end dfl;

