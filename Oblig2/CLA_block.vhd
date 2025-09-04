library IEEE; use IEEE.STD_LOGIC_1164.all;

    entity CLA_block is
        port(
            a, b : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end entity CLA_block;

architecture mixed of CLA_block is
    component fulladder is
        port(
            a, b, cin : in STD_LOGIC;
            s, cout : out STD_LOGIC
	    );
    end component;

    signal p, g : STD_LOGIC_VECTOR(3 downto 0);
    signal c : STD_LOGIC_VECTOR(4 downto 0);
    signal p30, g30 : STD_LOGIC;

begin
    p <= a or b;
    g <= a and b;
    p30 <= p(3) and p(2) and p(1) and p(0);
    g30 <= g(3) or (p(3) and g(2)) or (p(2) and g(1)) or (p(1) and g(0));    

    cout <= (p30 and cin) or g30;
    c(0) <= cin; 

    Gen: for i in 0 to 3 generate
        fulladderx : fulladder port map(
            a => a(i),
            b => b(i),
            cin => c(i),
            s => s(i),
            cout => c(i+1)
        );
    end generate Gen;  
end architecture mixed;

--F1: fulladder port map(a(0), b(0), c(0), s(0), c(1));
--F2: fulladder port map(a(1), b(1), c(1), s(1), c(2));
--F3: fulladder port map(a(2), b(2), c(2), s(2), c(3));
--F4: fulladder port map(a(3), b(3), c(3), s(3), c(4));   