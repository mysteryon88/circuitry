`timescale 1ns / 1ps

module test_counts;

	reg CLK;
	reg EN;
	reg CLRBAR;
	
	wire [5:0] OUT;

	counts uut (
		.CLK(CLK), 
		.EN(EN), 
		.CLRBAR(CLRBAR), 
		.OUT(OUT)
	);

	initial begin
	
		CLK = 1;
		EN = 1;
		CLRBAR = 0;

		#1;

	end
      always begin #1 CLK=0; #1 CLK=1; end
endmodule

