library IEEE; use IEEE.STD_LOGIC_1164.all; use IEEE.numeric_std.all;

entity CLA_top is
    port(
        a, b : in STD_LOGIC_VECTOR(31 downto 0);
        cin : in STD_LOGIC;
        s : out STD_LOGIC_VECTOR(31 downto 0);
        cout : out STD_LOGIC
    );
end entity CLA_top;

architecture mixed of CLA_top is
    component CLA_block is
        port(
            a, b : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;

    signal p, g : STD_LOGIC_VECTOR(31 downto 0);
    signal c : STD_LOGIC_VECTOR(32 downto 0);
    begin
        p <= a or b;
        g <= a and b;
        c(0) <= cin;

        gen: for i in 0 to 7 generate
            CLA_blockx : CLA_block port map(
                a => a(4*i + 3 downto 4*i),
                b => b(4*i + 3 downto 4*i),
                cin => c(i),
                s => s(4*i + 3 downto 4*i),
                cout => c(i + 1)
            );
        end generate gen;
	cout <= c(8);
end architecture mixed;   

--CLABlock1 : CLA_block port map(a(3 downto 0), b(3 downto 0), c(0), s(3 downto 0), c(1));
--CLABlock2 : CLA_block port map(a(7 downto 4), b(7 downto 4), c(1), s(7 downto 4), c(2));
--CLABlock3 : CLA_block port map(a(11 downto 8), b(11 downto 8), c(2), s(11 downto 8), c(3));
--CLABlock4 : CLA_block port map(a(15 downto 12), b(15 downto 12), c(3), s(15 downto 12), c(4));
--CLABlock5 : CLA_block port map(a(19 downto 16), b(19 downto 16), c(4), s(19 downto 16), c(5));
--CLABlock6 : CLA_block port map(a(23 downto 20), b(23 downto 20), c(5), s(23 downto 20), c(6));
--CLABlock7 : CLA_block port map(a(27 downto 24), b(27 downto 24), c(6), s(27 downto 24), c(7));
--CLABlock8 : CLA_block port map(a(31 downto 28), b(31 downto 28), c(7), s(31 downto 28), c(8));

--cout <= c(8);