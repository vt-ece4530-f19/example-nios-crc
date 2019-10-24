module hexdecoder(
    input wire [3:0] b,
    output wire [7:0] seg);
   
   reg [7:0] 	      iseg;
   
   always @*
     case(b)
       4'h0 : iseg = 8'h3F;
       4'h1 : iseg = 8'h06;
       4'h2 : iseg = 8'h5B;
       4'h3 : iseg = 8'h4F;
       4'h4 : iseg = 8'h66;
       4'h5 : iseg = 8'h6D;
       4'h6 : iseg = 8'h7D;
       4'h7 : iseg = 8'h07;
       4'h8 : iseg = 8'h7F;
       4'h9 : iseg = 8'h6F;
       4'ha : iseg = 8'h77;
       4'hb : iseg = 8'h7C;
       4'hc : iseg = 8'h39;
       4'hd : iseg = 8'h5E;
       4'he : iseg = 8'h79;
       4'hf : iseg = 8'h71;
     endcase
   
   assign seg = ~iseg;
   
endmodule
