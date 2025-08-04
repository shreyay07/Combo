module combo_tb;

reg [1:0] choice,dec_in;
reg sel, I0, I1;
reg [3:0] enc_in;
wire mux_out;
wire [1:0] enc_out;
wire [3:0] dec_out;

combo uut(
	.choice(choice),
       	.dec_in(dec_in),
	.sel(sel),
       	.I0(I0),
       	.I1(I1),
	.enc_in(enc_in),
	.mux_out(mux_out),
	.enc_out(enc_out),
	.dec_out(dec_out)
);	

integer i;
initial begin
	choice=2'b00;
	$monitor("time=%0t \t choice=%b \t sel=%b \t I0=%b \t I1=%b \t mux_out=%b",$time, choice, sel, I0, I1,mux_out);
        for (i=0; i<8; i++) begin
		{sel,I0,I1}= i;
		#10;
	end

        $monitor("time=%0t \t choice=%b \t enc_in=%b \t enc_out=%b",$time, choice, enc_in, enc_out); 

	choice= 2'b01;
	enc_in= 4'b0001; #10;
	enc_in= 4'b0010; #10;
	enc_in= 4'b0100; #10;
	enc_in= 4'b1000; #10;
	enc_in= 4'b0000; #10;

       $monitor("time=%0t \t choice=%b \t dec_in=%b \t dec_out=%b",$time, choice, dec_in, dec_out);

       choice= 2'b10; 
       dec_in= 2'b00; #10;
       dec_in= 2'b10; #10;
       dec_in= 2'b10; #10;
       dec_in= 2'b11; #10;
       
       $finish;
end

initial begin
	$dumpfile("combo.vcd");
	$dumpvars();
end
endmodule

