library IEEE; use IEEE.STD_LOGIC_1164.all;

entity tb_CLA_top is
end entity tb_CLA_top;
architecture behavioral of tb_CLA_top is
    component CLA_top is
        port(
            a, b : in STD_LOGIC_VECTOR(31 downto 0);
            cin : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR(31 downto 0);
            cout : out STD_LOGIC
        );
    end component;

    signal tb_a, tb_b : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal tb_cin : STD_LOGIC := '0';
    signal tb_s : STD_LOGIC_VECTOR(31 downto 0);
    signal tb_cout : STD_LOGIC;

begin
    DUT: CLA_top
    port map(
        a => tb_a,
        b => tb_b,
        cin => tb_cin,
        s => tb_s,
        cout => tb_cout
    );

    process
    begin
        wait for 10 ns;
        tb_a <= "00000000000000000000000000000000";
        tb_b <= "00000000000000000000000000000000";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "00000000000000000000000000000000" and tb_cout = '0') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "00000000000000000000000000000000";
        tb_b <= "11111111111111111111111111111111";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "11111111111111111111111111111111" and tb_cout = '0') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "00000000000000000000000000000000";
        tb_b <= "11111111111111111111111111111111";
        tb_cin <= '1';
        wait for 10 ns;
        assert (tb_s = "00000000000000000000000000000000" and tb_cout = '1') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "00000000000100000000000001001000";
        tb_b <= "00000000000000000000000000000000";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "00000000000100000000000001001000" and tb_cout = '0') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "10000000000100000000000001001000";
        tb_b <= "10000000000000000000000000000000";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "00000000000100000000000001001000" and tb_cout = '1') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "10000000000100000000000001001000";
        tb_b <= "10000000000000000000000000000000";
        tb_cin <= '1';
        wait for 10 ns;
        assert (tb_s = "00000000000100000000000001001001" and tb_cout = '1') report ("Output er feil") severity failure;
        
        wait for 10 ns;
        tb_a <= "00100011110000000111111100000000";
        tb_b <= "10000000000100000000000001001000";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "10100011110100000111111101001000" and tb_cout = '0') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "00100011110000000111111100000000";
        tb_b <= "10000000000100000000000001001000";
        tb_cin <= '1';
        wait for 10 ns;
        assert (tb_s = "10100011110100000111111101001001" and tb_cout = '0') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "00000000000000000000000000000000";
        tb_b <= "11111111111111111111111111111111";
        tb_cin <= '1';
        wait for 10 ns;
        assert (tb_s = "00000000000000000000000000000000" and tb_cout = '1') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "00000000000100000000000001001000";
        tb_b <= "00000000000000000000000000000000";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "00000000000100000000000001001000" and tb_cout = '0') report ("Output er feil") severity failure;

        

        report ("Ferdig!") severity note;
        std.env.stop;
    end process;
end architecture behavioral;


