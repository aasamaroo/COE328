LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab2 IS
PORT (
a, b, c, d : IN STD_LOGIC ;
f : OUT STD_LOGIC );
end lab2;

ARCHITECTURE Behavior OF lab2 IS
BEGIN
f <= (a and b and not c and not d) or (not a and not b) or (c and d and a);
END Behavior;