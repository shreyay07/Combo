module encoder(
	input [3:0] enc_in,
	output reg [1:0] enc_out
);
always @(*) begin
	case(enc_in)
		4'b0000: enc_out<= 2'bxx;
		4'b0001: enc_out<= 2'b00;
		4'b0010: enc_out<= 2'b01;
		4'b0100: enc_out<= 2'b10;
		4'b1000: enc_out<= 2'b11;
		default: enc_out<= 2'bxx;
	endcase
end
endmodule
