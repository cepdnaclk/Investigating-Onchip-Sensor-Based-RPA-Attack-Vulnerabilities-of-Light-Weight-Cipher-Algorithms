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

entity aes_tiny is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (127 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           dout : out  STD_LOGIC_VECTOR (127 downto 0);
           done : out  STD_LOGIC
			 );
end aes_tiny;

architecture Behavioral of aes_tiny is

	COMPONENT sbox
	PORT(
		encrypt : IN std_logic;
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT mix_column
	PORT(
		i : IN std_logic_vector(31 downto 0);          
		o : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	component dataBody is
		Port ( 
			clk : in  STD_LOGIC;
         ctrl : in  STD_LOGIC_VECTOR (2 downto 0);
         data_in_ser : in  STD_LOGIC_VECTOR (31 downto 0);
         data_in_par : in  STD_LOGIC_VECTOR (127 downto 0);
         data_out_ser : out  STD_LOGIC_VECTOR (31 downto 0);
         data_out_par : out  STD_LOGIC_VECTOR (127 downto 0)--;
			);
	end component dataBody;

	COMPONENT keyschedule
	PORT(
		clk : IN std_logic;
		ctrl : IN std_logic_vector(2 downto 0);
		counterRound : IN std_logic_vector(3 downto 0);
		key : IN std_logic_vector(127 downto 0);
		sboxOut : IN std_logic_vector(31 downto 0);          
		sboxIn : OUT std_logic_vector(31 downto 0);
		roundKey : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	component controler is
		port(
			clk	: in std_logic;
			n_reset	: in std_logic;
			selAddKeyOnly : out std_logic;
			selSbox : out std_logic;
			ctrlData: out std_logic_vector(2 downto 0);
			ctrlKey : out std_logic_vector(2 downto 0);
			round : out std_logic_vector(3 downto 0);
			done    : out std_logic
		);
end component controler;

----------------------------------------------------------
-- data signals
----------------------------------------------------------
signal sboxIn, sboxOut : STD_LOGIC_VECTOR (31 downto 0);
signal sboxInKS : STD_LOGIC_VECTOR (31 downto 0);
signal state : STD_LOGIC_VECTOR (31 downto 0);

signal roundkey : std_logic_vector(31 downto 0);

signal full_state : STD_LOGIC_VECTOR (127 downto 0);
signal dinXORkey : STD_LOGIC_VECTOR (127 downto 0);
	signal mixcol_in : std_logic_vector(31 downto 0);
	signal mixcol_out, mcXORin : std_logic_vector(31 downto 0);
	signal mixcolXORroundkey : std_logic_vector(31 downto 0);
----------------------------------------------------------
-- control signals
----------------------------------------------------------
signal selSbox, selAddKeyOnly : std_logic;
signal countRound : STD_LOGIC_VECTOR (3 downto 0);
signal ctrlData: STD_LOGIC_VECTOR (2 downto 0);
signal ctrlKey: STD_LOGIC_VECTOR (2 downto 0);

signal n_reset : std_logic;

begin
n_reset <= NOT rst;

dinXORkey <= din XOR key;
----------------------------------------------------------
-- component instantiation
----------------------------------------------------------
----------------------------------------------------------
-- FSM
----------------------------------------------------------
fsm: controler
		port map(
			clk => clk,
			n_reset => n_reset,
			selSbox => selSbox,
			selAddKeyOnly => selAddKeyOnly,
			ctrlData => ctrlData,
			ctrlKey => ctrlKey,
			round => countRound,
			done => done
		);


----------------------------------------------------------
-- STATE register
----------------------------------------------------------
Inst_dataBody: dataBody
    Port map ( clk => clk,
           ctrl => ctrlData,
           data_in_ser => mixcolXORroundkey,
           data_in_par => dinXORkey,
			  data_out_ser => state,
           data_out_par => full_state
			  );

----------------------------------------------------------
-- Key register
----------------------------------------------------------
	Inst_keyschedule: keyschedule PORT MAP(
		clk => clk,
		ctrl => ctrlKey,
		counterRound => countRound,
		key => key,
		sboxOut => sboxOut,
		sboxIn => sboxInKS,
		roundkey => roundkey
	);

	
----------------------------------------------------------
-- S-box component
----------------------------------------------------------

Inst_sbox: sbox 
	PORT MAP(
			  encrypt => '1',	
           input => sboxIn,
           output => sboxOut
	);			  

----------------------------------------------------------
-- Sbox input MUX
----------------------------------------------------------

sboxIn <= sboxInKS when selSbox = '1'
        else state;

----------------------------------------------------------
-- MixColumn component
----------------------------------------------------------
Inst_mix_column: mix_column PORT MAP(
		i => mixcol_in,
		o => mixcol_out
	);

mixcol_in <= sboxOut;

mcXORin <= mixcol_in when selAddKeyOnly = '1'
		else mixcol_out;
		
mixcolXORroundkey <= mcXORin XOR roundkey;

----------------------------------------------------------
-- output
----------------------------------------------------------
dout<=  full_state;

end Behavioral;

