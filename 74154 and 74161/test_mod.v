`timescale 1ns / 1ps

module test_mod;

	reg CLK;
	reg ENT;
	reg CLRBAR;

	wire [15:0] OUT;
	
	mod uut (
		.CLK(CLK), 
		.ENT(ENT), 
		.CLRBAR(CLRBAR), 
		.OUT(OUT)
	);

	initial begin
	
		CLK = 1;
		ENT = 1;
		CLRBAR = 0;

		#1;
        
	end
      always begin #1 CLK=0; #1 CLK=1; end
endmodule

