library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HexMod is
    Port (  CLK : in STD_LOGIC;
            SW : in STD_LOGIC_VECTOR(15 downto 0);
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            CT : out STD_LOGIC_VECTOR(6 downto 0));
end HexMod;

architecture HexMod of HexMod is

signal SW0: STD_LOGIC_VECTOR(0 downto 0);
signal digit: STD_LOGIC_VECTOR(6 downto 0);

begin

SW0 <= SW(0 downto 0);
digit <= "0001110";

process(SW(2 downto 1))
begin
    if SW(2 downto 1) = "01" then
        AN(7 downto 0) <= "11111000";
    elsif SW(2 downto 1) = "10" then
        AN(7 downto 0) <= "11110000";
    else
        AN(7 downto 0) <= "11111111";
    end if;
end process;

-- Mux to select cathode signals (activates led segments)
process(CLK, SW0, digit)
begin

    CT <= digit;

    if (SW0 = "1") and (CLK'event) and (CLK = '1') then
    
        -- Test sucessful to see if this if-statement has valid conditions
        -- CT <= "0000011";
        
        if (digit = "1000000") then digit <= "1111001";     -- When 0 go to 1
        elsif (digit = "1111001") then digit <= "0100100"; -- When 1 go to 2
        elsif (digit = "0100100") then digit <= "0110000"; -- When 2 go to 3
        elsif (digit = "0110000") then digit <= "0011001"; -- When 3 go to 4
        elsif (digit = "0011001") then digit <= "0010010"; -- When 4 go to 5
        elsif (digit = "0010010") then digit <= "0000010"; -- When 5 go to 6
        elsif (digit = "0000010") then digit <= "1011000"; -- When 6 go to 7
        elsif (digit = "1011000") then digit <= "0000000"; -- When 7 go to 8
        elsif (digit = "0000000") then digit <= "0010000"; -- When 8 go to 9
        elsif (digit = "0010000") then digit <= "1000000"; -- When 9 go to 0
        else digit <= "0001000";                           -- Go to A by default
        end if;
    end if;
end process;

end HexMod;