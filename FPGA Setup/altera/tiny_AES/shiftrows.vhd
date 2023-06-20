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

entity shiftrows is
    Port ( encrypt : in STD_LOGIC;
			  in_c0 : in  STD_LOGIC_VECTOR (31 downto 0);
           in_c1 : in  STD_LOGIC_VECTOR (31 downto 0);
           in_c2 : in  STD_LOGIC_VECTOR (31 downto 0);
           in_c3 : in  STD_LOGIC_VECTOR (31 downto 0);
           out_c0 : out  STD_LOGIC_VECTOR (31 downto 0);
           out_c1 : out  STD_LOGIC_VECTOR (31 downto 0);
           out_c2 : out  STD_LOGIC_VECTOR (31 downto 0);
           out_c3 : out  STD_LOGIC_VECTOR (31 downto 0));
end shiftrows;

architecture Behavioral of shiftrows is

		--alias 32->8bit input
	alias i00 : std_logic_vector(7 downto 0) is in_c0(31 downto 24); 
	alias i10 : std_logic_vector(7 downto 0) is in_c0(23 downto 16);
	alias i20 : std_logic_vector(7 downto 0) is in_c0(15 downto  8); 
	alias i30 : std_logic_vector(7 downto 0) is in_c0( 7 downto  0); 
	alias i01 : std_logic_vector(7 downto 0) is in_c1(31 downto 24); 
	alias i11 : std_logic_vector(7 downto 0) is in_c1(23 downto 16);
	alias i21 : std_logic_vector(7 downto 0) is in_c1(15 downto  8); 
	alias i31 : std_logic_vector(7 downto 0) is in_c1( 7 downto  0); 
	alias i02 : std_logic_vector(7 downto 0) is in_c2(31 downto 24); 
	alias i12 : std_logic_vector(7 downto 0) is in_c2(23 downto 16);
	alias i22 : std_logic_vector(7 downto 0) is in_c2(15 downto  8); 
	alias i32 : std_logic_vector(7 downto 0) is in_c2( 7 downto  0); 
	alias i03 : std_logic_vector(7 downto 0) is in_c3(31 downto 24); 
	alias i13 : std_logic_vector(7 downto 0) is in_c3(23 downto 16);
	alias i23 : std_logic_vector(7 downto 0) is in_c3(15 downto  8); 
	alias i33 : std_logic_vector(7 downto 0) is in_c3( 7 downto  0); 

	--aliases 32->8bit output
	alias o00 : std_logic_vector(7 downto 0) is out_c0(31 downto 24); 
	alias o10 : std_logic_vector(7 downto 0) is out_c0(23 downto 16);
	alias o20 : std_logic_vector(7 downto 0) is out_c0(15 downto  8); 
	alias o30 : std_logic_vector(7 downto 0) is out_c0( 7 downto  0); 
	alias o01 : std_logic_vector(7 downto 0) is out_c1(31 downto 24); 
	alias o11 : std_logic_vector(7 downto 0) is out_c1(23 downto 16);
	alias o21 : std_logic_vector(7 downto 0) is out_c1(15 downto  8); 
	alias o31 : std_logic_vector(7 downto 0) is out_c1( 7 downto  0); 
	alias o02 : std_logic_vector(7 downto 0) is out_c2(31 downto 24); 
	alias o12 : std_logic_vector(7 downto 0) is out_c2(23 downto 16);
	alias o22 : std_logic_vector(7 downto 0) is out_c2(15 downto  8); 
	alias o32 : std_logic_vector(7 downto 0) is out_c2( 7 downto  0); 
	alias o03 : std_logic_vector(7 downto 0) is out_c3(31 downto 24); 
	alias o13 : std_logic_vector(7 downto 0) is out_c3(23 downto 16);
	alias o23 : std_logic_vector(7 downto 0) is out_c3(15 downto  8); 
	alias o33 : std_logic_vector(7 downto 0) is out_c3( 7 downto  0); 

begin

--mux shiftrow/invshiftrow
	
	--row_0 is never shifted
	o00 <= i00;
	o01 <= i01;
	o02 <= i02;
	o03 <= i03;
	
	--shift row_1 by 1 to the left(encrypt) or to the right (decrypt)
	o10 <= i11 when encrypt = '1' else i13;
	o11 <= i12 when encrypt = '1' else i10;
	o12 <= i13 when encrypt = '1' else i11;
	o13 <= i10 when encrypt = '1' else i12;
	
	--shift row_2 by 2 to the left(encrypt) or to the right (decrypt) -> always swap
	o20 <= i22;
	o21 <= i23;
	o22 <= i20;
	o23 <= i21;
	
	--shift row_3 by 3 to the left(encrypt) or to the right (decrypt)
	o30 <= i33 when encrypt = '1' else i31;
	o31 <= i30 when encrypt = '1' else i32;
	o32 <= i31 when encrypt = '1' else i33;
	o33 <= i32 when encrypt = '1' else i30;
	

end Behavioral;

