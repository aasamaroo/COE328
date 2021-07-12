LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY ALU2 IS
PORT (Clock : IN STD_LOGIC ;
A ,B : IN UNSIGNED(7 DOWNTO 0);

OP: IN UNSIGNED(15 downto 0);
Neg: OUT STD_LOGIC;
R1: OUT UNSIGNED(3 DOWNTO 0);
R2: OUT UNSIGNED(3 DOWNTO 0));
END ALU2;

ARCHITECTURE Behavior OF ALU2 IS
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');
SIGNAL Reg4: UNSIGNED(0 TO 7);
SIGNAL Sum : UNSIGNED(8 DOWNTO 0);
SIGNAL  compReg2: UNSIGNED(7 DOWNTO 0);
SIGNAL temp: UNSIGNED(7 DOWNTO 0);

BEGIN
Reg1 <= A;
Reg2 <= B;
PROCESS (Clock, OP,A,B)
BEGIN
IF (rising_edge(Clock)) THEN
CASE OP IS
WHEN "0000000000000001" => --Difference A and B
if (Reg1 < Reg2) then
neg <= '1';
Result <= Reg2 - Reg1;
else
neg <= '0';
Result <= Reg1 - Reg2;
end if;
WHEN "0000000000000010"  => --2s complement of B
neg <= '0';
Result <= NOT(Reg2) + 1;
WHEN "0000000000000100" =>--Swap Lower 4 Bits A & B
neg <= '0';
temp(0)<=Reg2(0);
temp(1)<=Reg2(1);
temp(2)<=Reg2(2);
temp(3)<=Reg2(3);
temp(4)<=Reg1(4);
temp(5)<=Reg1(5);
temp(6)<=Reg1(6);
temp(7)<=Reg1(7);
Result <= temp;
WHEN "0000000000001000" =>--Produce Null
neg <= '0';
Result <= null;
WHEN "0000000000010000" =>--Decrement B by 5
neg <= '0';
Result <= Reg2 - "0101";
WHEN "0000000000100000" =>--Invert bit significance of A
neg <= '0';
temp(0)<=Reg1(7);
temp(1)<=Reg1(6);
temp(2)<=Reg1(5);
temp(3)<=Reg1(4);
temp(4)<=Reg1(3);
temp(5)<=Reg1(2);
temp(6)<=Reg1(1);
temp(7)<=Reg1(0);
Result <= temp;
WHEN "0000000001000000" =>--Shift B to the left by 3 bits
neg <= '0';
Result <= (Reg2 sll 3);
WHEN "0000000010000000" =>--Increment A by 3 
neg <= '0';
Result <= (Reg1 + "011");
WHEN "0000000100000000" =>--Invert B
neg <= '0';
Result <= NOT(Reg2);
WHEN OTHERS =>-- Don't Care
END CASE;
END IF;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;