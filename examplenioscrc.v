module examplenioscrc(
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	input 		     [3:0]		KEY,
	output		     [9:0]		LEDR
);

 wire [23:0] hex_export;
 
 platformnioscrc u0 (
   .clk_clk(CLOCK_50),
	.reset_reset_n(KEY[0]),
	.hex_export(hex_export)
	);

  hexdecoder h0(hex_export[ 3: 0], HEX0);
  hexdecoder h1(hex_export[ 7: 4], HEX1);
  hexdecoder h2(hex_export[11: 8], HEX2);
  hexdecoder h3(hex_export[15:12], HEX3);
  hexdecoder h4(hex_export[19:16], HEX4);
  hexdecoder h5(hex_export[23:20], HEX5);

  reg [23:0] 	      heartbeat;

  // heartbeat indicator
  always @(posedge CLOCK_50, negedge KEY[0])
  if (KEY[0] == 1'b0)
       heartbeat <= 24'b0;
  else
       heartbeat <= heartbeat + 1'b1;
		 
  assign LEDR[0] = heartbeat[23];
    
endmodule
