module combo( 
	input wire [1:0] choice,dec_in,
	input wire sel, I0, I1,
	input wire [3:0] enc_in,
	output reg mux_out,
	output reg [1:0] enc_out,
	output reg [3:0] dec_out
);
wire mux;
wire [1:0] enc;
wire [3:0] dec;

mux_2_1 MUX(
	.sel(sel),
     	.I0(I0),
        .I1(I1),
        .mux_out(mux)
);

encoder ENC(
	.enc_in(enc_in),
        .enc_out(enc)
);

 decoder DEC(
	 .dec_in(dec_in),
	 .dec_out(dec)
);

always @(*) begin 
	mux_out=0;
	enc_out=0;
	dec_out=0;

	case(choice)
		2'b00: mux_out=mux;
		2'b01: enc_out= enc;
		2'b10: dec_out= dec;
	endcase
end
endmodule
