library IEEE; use IEEE.STD_LOGIC_1164.all;

entity tb_CLA_block is
end entity tb_CLA_block;
architecture behavioral of tb_CLA_block is
    component CLA_block is
        port(
            a, b : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    signal tb_a, tb_b : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal tb_cin : STD_LOGIC := '0';
    signal tb_s : STD_LOGIC_VECTOR(3 downto 0);
    signal tb_cout : STD_LOGIC;

begin
    DUT: CLA_block
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
        tb_a <= "0000";
        tb_b <= "0000";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "0000" and tb_cout = '0') report ("Output er feil") severity failure;
        
        wait for 10 ns;
        tb_a <= "0001";
        tb_b <= "0010";
        tb_cin <= '1';
        wait for 10 ns;
        assert (tb_s = "0100" and tb_cout = '0') report ("Output er feil") severity failure;
        
        wait for 10 ns;
        tb_a <= "0000";
        tb_b <= "0111";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "0111" and tb_cout = '0') report ("Output er feil") severity failure;
        
        wait for 10 ns;
        tb_a <= "1000";
        tb_b <= "1001";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "0001" and tb_cout = '1') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "0111";
        tb_b <= "1010";
        tb_cin <= '0';
        wait for 10 ns;
        assert (tb_s = "0001" and tb_cout = '1') report ("Output er feil") severity failure;

        wait for 10 ns;
        tb_a <= "1111";
        tb_b <= "0000";
        tb_cin <= '1';
        wait for 10 ns;
        assert (tb_s = "0000" and tb_cout = '1') report ("Output er feil") severity failure;
    
        report ("Ferdig!") severity note;
        std.env.stop;
    end process;
end architecture behavioral;
