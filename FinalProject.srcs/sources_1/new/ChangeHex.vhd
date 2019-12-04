library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ChangeHex is
    Port (  CLK : in STD_LOGIC;
            SW : in STD_LOGIC_VECTOR(15 downto 0);
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            CT : out STD_LOGIC_VECTOR(6 downto 0));
end ChangeHex;

architecture ChangeHex of ChangeHex is

component HexMod is
    Port (  CLK : in STD_LOGIC;
            SW : in STD_LOGIC_VECTOR(15 downto 0);
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            CT : out STD_LOGIC_VECTOR(6 downto 0));
end component;

component ClockMod is
    Port (
        CLK100MHZ : in std_logic;
        C0 : out std_logic;
        C1 : out std_logic;
        C2 : out std_logic;
        C3 : out std_logic
        );
end component;

signal C0, C1, C2, C3: STD_LOGIC;

begin

H1 : HexMod port map(CLK=>C0, SW=>SW, AN=>AN, CT=>CT);
Clock : ClockMod port map(CLK100MHZ=>CLK, C0=>C0, C1=>C1, C2=>C2, C3=>C3);



end ChangeHex;