LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;
ENTITY ASU IS

PORT (Cin : IN STD_LOGIC ;
X ,Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
Cout,neg : OUT STD_LOGIC ) ;
END ASU ;

ARCHITECTURE Behavior OF ASU IS
SIGNAL Sum : STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
PROCESS (Cin,X,Y)
BEGIN
if (Cin <= '1') then 
Sum <= ('0' & X) + ('0' & Y);
S <= Sum(3 DOWNTO 0);
Cout <= '1';
neg <='0';
end if;
if (Cin <= '0') then
if (X>Y) then
Sum <= ('0' & X) - ('0' & Y);
Cout <= '0';
neg <='0';
else
Sum <= ('0' & Y) - ('0' & X);
Cout <= '1';
neg <='1';
end if;
end if;

	
 END PROCESS;

 
END Behavior;