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

entity dataBody is
    Port (	
			clk : in  STD_LOGIC;
         ctrl : in  STD_LOGIC_VECTOR (2 downto 0);
         data_in_ser : in  STD_LOGIC_VECTOR (31 downto 0);
         data_in_par : in  STD_LOGIC_VECTOR (127 downto 0);
         data_out_ser : out  STD_LOGIC_VECTOR (31 downto 0);
         data_out_par : out  STD_LOGIC_VECTOR (127 downto 0)
			);
end dataBody;

architecture dfl of dataBody is


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

	COMPONENT shiftrows
		PORT(
			encrypt : IN std_logic;
			in_c0 : IN std_logic_vector(31 downto 0);
			in_c1 : IN std_logic_vector(31 downto 0);
			in_c2 : IN std_logic_vector(31 downto 0);
			in_c3 : IN std_logic_vector(31 downto 0);          
			out_c0 : OUT std_logic_vector(31 downto 0);
			out_c1 : OUT std_logic_vector(31 downto 0);
			out_c2 : OUT std_logic_vector(31 downto 0);
			out_c3 : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;


----------------------------------------------------------
-- signal declaration
----------------------------------------------------------

	signal inputSer, outputSer : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal inputPar, outputPar : STD_LOGIC_VECTOR(127 DOWNTO 0);

	signal sc0 : std_logic_vector(31 downto 0);
	signal sc1 : std_logic_vector(31 downto 0);
	signal sc2 : std_logic_vector(31 downto 0);
	signal sc3 : std_logic_vector(31 downto 0);

-- 4x32bit (inv)shiftrow (out) signals
	signal sr_c0 : std_logic_vector(31 downto 0);
	signal sr_c1 : std_logic_vector(31 downto 0);
	signal sr_c2 : std_logic_vector(31 downto 0);
	signal sr_c3 : std_logic_vector(31 downto 0);
	
begin

----------------------------------------------------------
-- component instantiation
----------------------------------------------------------
			
	state_FF: reg
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

	Inst_shiftrows: shiftrows PORT MAP(
		encrypt => '1',
		in_c0 => sc0,
		in_c1 => sc1,
		in_c2 => sc2,
		in_c3 => sc3,
		out_c0 => sr_c0,
		out_c1 => sr_c1,
		out_c2 => sr_c2,
		out_c3 => sr_c3
	);
	

	--direct assignment
	sc0 <= outputPar(127 downto 96);
	sc1 <= outputPar(95 downto 64);
	sc2 <= outputPar(63 downto 32);
	sc3 <= outputPar(31 downto 0);

	--serial routing
	inputSer <= data_in_ser;
	data_out_ser <= outputSer;

	--parallel routing -> 128 2:1 Mux -> 128 luts / 64 slices.
  inputPar <= data_in_par when ctrl(2) = '1'
		else (sr_c0 & sr_c1 & sr_c2 & sr_c3);

  data_out_par <= outputPar;	
  
end dfl;

