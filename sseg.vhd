LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY sseg IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
neg : IN STD_LOGIC;
leds, ledn : OUT STD_LOGIC_VECTOR(1 TO 7) ) ;
END sseg ;

ARCHITECTURE Behavior OF sseg IS
BEGIN
PROCESS ( bcd, neg )

BEGIN

IF (neg ='0') then
	ledn <= NOT("0000000");
end if;
if (neg = '1') then
	ledn <= NOT ("0000001");
END IF;

CASE bcd IS --abcdefg
WHEN "0000" =>leds <= NOT ("1111110");
WHEN "0001" =>leds <= NOT ("0110000");
WHEN "0010" =>leds <= NOT ("1101101") ;
WHEN "0011" =>leds <= NOT ("1111001") ;
WHEN "0100" =>leds <= NOT ("0110011") ;
WHEN "0101" =>leds <= NOT ("1011011") ;
WHEN "0110" =>leds <= NOT ("1011111") ;
WHEN "0111" =>leds <= NOT ("1110000") ;
WHEN "1000" =>leds <= NOT ("1111111") ;
WHEN "1001" =>leds <= NOT ("1110011") ;
WHEN "1010" =>leds <= ("0001000") ;
WHEN "1011" =>leds <= ("1100000") ;
WHEN "1100" =>leds <= ("0110001") ;
WHEN "1101" =>leds <= ("1000010") ;
WHEN "1110" =>leds <= ("0110000") ;
WHEN "1111" =>leds <= ("0111000") ;
WHEN OTHERS =>leds <= ("-------") ;
END CASE ;
END PROCESS ;
END Behavior ;