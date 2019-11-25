library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HexMod is
    Port (  SW : in STD_LOGIC_VECTOR(15 downto 0);
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            CT : out STD_LOGIC_VECTOR(6 downto 0));
end HexMod;

architecture HexMod of HexMod is

begin

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

CT(6 downto 0) <= "0000000"; -- Make 8's.

end HexMod;