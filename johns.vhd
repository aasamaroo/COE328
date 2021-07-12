LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY johns IS
PORT (Clrn, E, Clkn : IN STD_LOGIC; --clrn is your reset button
STUDENT_ID : out std_logic_vector(3 downto 0);
Q : OUT STD_LOGIC_VECTOR (0 TO 2));
END johns;
ARCHITECTURE Behavior OF johns IS
signal Qreg : STD_LOGIC_VECTOR (0 TO 2);
signal Qtemp : STD_LOGIC;
BEGIN
PROCESS (Clrn, Clkn)
BEGIN
IF Clrn = '1' THEN
Qreg <= "000";
ELSIF (Clkn'EVENT AND Clkn = '1') THEN
IF E = '1' THEN
Qreg(2) <= Qreg(1);
Qreg(1) <= Qreg(0);
Qreg(0) <= not Qreg(2);
ELSE
Qreg <= Qreg;
END IF;
END IF;
-- STUDENT_ID variable represents the last 6 digits of your student ID
--hence d4 is the fourth digit of your
--student ID in four bits, d5 is the fifth and so on. For example, for
--Student ID 500435429,
--d4 is 0100, d5 is 0011 and so on
CASE Qreg IS
WHEN "000" =>
STUDENT_ID <=  "1000"; --d1
WHEN "100" => 
STUDENT_ID <=  "0111"; --d2
WHEN "110" =>
STUDENT_ID <=  "1000"; --d3
WHEN "111" =>
STUDENT_ID <=  "0100"; --d4
WHEN "011" =>
STUDENT_ID <=  "1000"; --d5
WHEN "001" => 
STUDENT_ID <=  "0010"; --d6

WHEN OTHERS => STUDENT_ID <= "----"; --error
END CASE;
END PROCESS;
Q <= Qreg;
END Behavior;