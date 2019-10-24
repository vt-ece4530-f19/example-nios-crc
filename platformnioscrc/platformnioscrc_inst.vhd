	component platformnioscrc is
		port (
			clk_clk       : in  std_logic                     := 'X'; -- clk
			hex_export    : out std_logic_vector(23 downto 0);        -- export
			reset_reset_n : in  std_logic                     := 'X'  -- reset_n
		);
	end component platformnioscrc;

	u0 : component platformnioscrc
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			hex_export    => CONNECTED_TO_hex_export,    --   hex.export
			reset_reset_n => CONNECTED_TO_reset_reset_n  -- reset.reset_n
		);

