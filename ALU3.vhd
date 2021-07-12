LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU3 IS
PORT (Clock : IN STD_LOGIC ;
A ,B : IN UNSIGNED(7 DOWNTO 0);
Student_id: IN UNSIGNED(3 DOWNTO 0);
OP: IN UNSIGNED(15 downto 0);
Neg: OUT STD_LOGIC;
Result: OUT UNSIGNED(3 DOWNTO 0));--higher 4bits of 8bits Result
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS
SIGNAL Reg1: UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);
SIGNAL Sum : UNSIGNED(8 DOWNTO 0);
SIGNAL  compReg2: UNSIGNED(7 DOWNTO 0);

BEGIN
PROCESS (Clock, OP,A,B)
BEGIN
IF (rising_edge(Clock)) THEN
CASE OP IS
WHEN "0000000000000001" => 
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000000000010"  => 
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000000000100" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000000001000" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000000010000" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000000100000" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000001000000" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000010000000" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN "0000000100000000" =>
if (Student_id mod 2 = 0) then
Reg1 <= "0000";
else
Reg1 <= "0001";
end if;
WHEN OTHERS =>-- Don't care
END CASE;
END IF;
END PROCESS;
Result <= Reg1;

END Behavior;