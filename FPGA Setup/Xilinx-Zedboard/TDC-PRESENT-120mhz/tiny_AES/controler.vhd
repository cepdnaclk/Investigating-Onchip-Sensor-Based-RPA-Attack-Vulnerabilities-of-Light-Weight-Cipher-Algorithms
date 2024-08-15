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

entity controler is
port(
	clk	: in std_logic;
	n_reset	: in std_logic;
	selSbox : out std_logic;
	selAddKeyOnly : out std_logic;
	ctrlData: out std_logic_vector(2 downto 0);
	ctrlKey : out std_logic_vector(2 downto 0);
	round : out std_logic_vector(3 downto 0);
   done    : out std_logic
);
end entity controler;

	
architecture fsm of controler is

----------------------------------------------------------
-- component declaration
----------------------------------------------------------

component counter is
	generic(NBITS: integer);
	port(
		clk	: in std_logic;
		n_reset	: in std_logic;
		en      : in std_logic;
		q	: out std_logic_vector(NBITS - 1 downto 0)
		);
end component counter;

----------------------------------------------------------
-- finite state stuff
----------------------------------------------------------
	
	type AES_STATES is (S_IDLE, S_GAMMEL, S_DATA_IN, S_KEYSCHED_SHIFTROWS, S_ROUND, S_DONE);
 
  	signal aes_state  		: AES_STATES;
  	signal next_state 		: AES_STATES;

----------------------------------------------------------
-- signal declaration
----------------------------------------------------------

--control data
signal muxParData, selSerData, enData : std_logic;


--control key
signal selUseSbox, selKey, enKey : std_logic;


--counter stuff
signal countRound  : std_logic_vector(3 downto 0);
signal countBlock : std_logic_vector(1 downto 0);
signal en_countBlock, rst_countBlock : std_logic;
signal en_countRound, rst_countRound : std_logic;

begin

----------------------------------------------------------
-- component instantiation
----------------------------------------------------------

cnt_round: counter
  generic map(NBITS => 4)
  port map(
            clk => clk,
            n_reset => rst_countRound,
            en => en_countRound,
            q => countRound
            );
              
cnt_block: counter
  generic map(NBITS => 2)
  port map(
            clk => clk,
            n_reset => rst_countBlock,
            en => en_countBlock,
            q => countBlock
            );

----------------------------------------------------------
-- finite state stuff
----------------------------------------------------------

state_change:	process(clk, next_state, n_reset)
begin
	if (rising_edge(clk)) then
		if (n_reset = '0') then
			aes_state <= S_IDLE;
		else 
			aes_state <= next_state;
		end if;
	end if;
end process;


----------------------------------------------------------
-- FSM
----------------------------------------------------------

state_compute:  process(aes_state, countBlock, countRound)

begin

----------------------------------------------------------
-- finite state stuff
----------------------------------------------------------

next_state <= aes_state;
rst_countRound <= '1';
rst_countBlock <= '1';
en_countRound <= '0';
en_countBlock <= '0';

muxParData <= '0';
selSerData <= '0';
enData <= '0';

selSbox <= '0';

selAddKeyOnly <= '0';

selUseSbox <= '0';
selKey <= '0';
enKey <= '0';

done <= '0';


case aes_state is

			when S_IDLE =>
				rst_countBlock <= '0';
				rst_countRound <= '0';
				next_state <= S_GAMMEL;

			when S_GAMMEL =>
				next_state <= S_DATA_IN;
				
			when S_DATA_IN =>
				--data
				muxParData <= '1';
				selSerData <= '1';
				enData <= '1';
				--key
				enKey <= '1';
				selKey <= '1';
				--state
				next_state <= S_KEYSCHED_SHIFTROWS;

			when S_KEYSCHED_SHIFTROWS =>
				--keysched				
				enKey <= '1';
				-- REDUNDANT? YES!--
				selSbox <= '1';
				selUseSbox <= '1';
				-- ENDREDUNDANT --
		
				--data->shiftrows
				enData <= '1';
				selSerData <= '1';

				--fsm
				next_state <= S_ROUND;

			when S_ROUND =>
				--keysched
				if countBlock="11" then
					enKey <= '0';
				else
					enKey <= '1';
				end if;
			
				--key addition
				if countRound = x"9" then
					selAddKeyOnly <= '1';
				end if;
				
				--data
				enData <= '1';
			
				--counter & fsm
				en_countBlock <= '1';
				if countBlock="11" then
					en_countRound <= '1';
					if countRound = x"9" then
						next_state <= S_DONE;
					else
						next_state <= S_KEYSCHED_SHIFTROWS;
					end if;
				end if;

			when S_DONE => 
				done <= '1';
end case;
        
end process;

round <= countRound;

ctrlData <= muxParData & selSerData & enData;
ctrlKey  <= selUseSbox & selKey & enKey;
end;
