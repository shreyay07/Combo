module mux_2_1(
	input sel, I0, I1,
	output mux_out
);
assign mux_out= sel? I1 :I0;
endmodule

