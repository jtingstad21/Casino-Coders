library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ClockMod is
    Port (
        CLK100MHZ : in std_logic;
        
        -- Outputs for our diffrent clock signals, one for each changing segment display
        C0 : out std_logic;
        C1 : out std_logic;
        C2 : out std_logic;
        C3 : out std_logic
        );
end ClockMod;

architecture ClockMod of Clockmod is

signal q : std_logic_vector (23 downto 0);

begin
    process (CLK100MHZ)
    begin
        if CLK100MHZ'event and CLK100MHZ = '1' then
            q <= q + 1;
        end if;
    end process;
    
    C0 <= q(22);    -- 11.92 Hz clock signal
    C1 <= q(21);    -- 23.84 Hz clock signal
    C2 <= q(20);    -- 47.68 Hz clock signal
    C3 <= q(19);    -- 95.37 Hz clock signal

end ClockMod;