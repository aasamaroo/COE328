LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU1 IS
PORT (Clock : IN STD_LOGIC ;
A ,B : IN UNSIGNED(7 DOWNTO 0);
Student_id: IN UNSIGNED(3 DOWNTO 0);
OP: IN UNSIGNED(15 downto 0);
Neg: OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);--lower 4bits of 8bits Result
R2: OUT UNSIGNED(3 DOWNTO 0));--higher 4bits of 8bits Result
END ALU1;

ARCHITECTURE Behavior OF ALU1 IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);
SIGNAL Sum : UNSIGNED(8 DOWNTO 0);
SIGNAL  compReg2: UNSIGNED(7 DOWNTO 0);

BEGIN
Reg1 <= A;
Reg2 <= B;
PROCESS (Clock, OP,A,B)
BEGIN
IF (rising_edge(Clock)) THEN
CASE OP IS
WHEN "0000000000000001" => --funtion 1 - addition
Result <= Reg2 + Reg1;
WHEN "0000000000000010"  => --function 2 - subtraction
if (Reg1 < Reg2) then
neg <= '1';
Result <= Reg2 - Reg1;
else
neg <= '0';
Result <= Reg1 - Reg2;
end if;
WHEN "0000000000000100" =>--Function 3 - NOT
neg <= '0';
Result <= NOT(Reg1);
WHEN "0000000000001000" =>--Function 4 -NAND
neg <= '0';
Result <= NOT(Reg1 AND Reg2);
WHEN "0000000000010000" =>--Function 5 -NOR
neg <= '0';
Result <= NOT(Reg1 OR Reg2);
WHEN "0000000000100000" =>--Function 6 -AND
neg <= '0';
Result <= (Reg1 AND Reg2);
WHEN "0000000001000000" =>--Function 7 -XOR
neg <= '0';
Result <= (Reg1 XOR Reg2);
WHEN "0000000010000000" =>--Function 8 -OR
neg <= '0';
Result <= (Reg1 OR Reg2);
WHEN "0000000100000000" =>--Function 9 -XNOR
neg <= '0';
Result <= NOT(Reg1 XOR Reg2);
WHEN OTHERS =>-- Don't care
END CASE;
END IF;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;