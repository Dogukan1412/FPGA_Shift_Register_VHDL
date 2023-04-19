library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_register is
  GENERIC(m : integer := 4);
  Port (
        din,clk,rst : in std_logic;
        dout : out std_logic
        );
end shift_register;

architecture Behavioral of shift_register is
begin
    process(clk,rst)
        variable q : std_logic_vector(0 to m-1);
    begin
        if(rst = '0') then
            q := (others => '0');
        elsif(clk'event and clk = '1') then
            q := din & q(0 to m-2);
        end if;
        dout <= q(m-1);
    end process;

end Behavioral;
