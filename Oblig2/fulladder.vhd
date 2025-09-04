library IEEE; use IEEE.STD_LOGIC_1164.all; 

entity fulladder is
    port (a, b, cin : in STD_LOGIC;
          s, cout : out STD_LOGIC
	);
end entity fulladder;

architecture dataflow of fulladder is
    begin
        s <= (a xor b) xor cin;
        cout <= ((a xor b) and cin) or (a and b);
end architecture dataflow;