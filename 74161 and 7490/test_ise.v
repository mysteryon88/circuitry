`timescale 1ns / 1ps


module test;

	// Inputs
	reg clk;
	reg EN;
	reg RST;

	// Outputs
	wire [3:0] chet;
	wire one_two;
	wire one_ten_0;
	wire zero_five_3;
	wire zero_five_1;
	wire zero_five_2;
	wire [3:0] one_zero_0;

	// Instantiate the Unit Under Test (UUT)
	Kurso uut (
		.clk(clk), 
		.EN(EN), 
		.RST(RST), 
		.chet(chet), 
		.one_two(one_two), 
		.one_ten_0(one_ten_0), 
		.zero_five_3(zero_five_3), 
		.zero_five_1(zero_five_1), 
		.zero_five_2(zero_five_2), 
		.one_zero_0(one_zero_0)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		EN = 1;
		RST = 0;
	end
   	
 always #1
		begin
		clk = clk+1;
		end
   
endmodule

