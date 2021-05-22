`timescale 1ns / 1ps

module cnt74190(
    input CLK, 
    input LOAD,
    input CE,
    input Up_Down,
    input P0,
    input P1,
    input P2,
    input P3,
    output reg [3:0] Q = 0,
    output reg RC = 1, 
	 output reg max_min = 0
    );
	 always @(posedge CLK or negedge LOAD) begin
		
		if (CE) begin
		end
		else if (!LOAD) begin
			Q <= {P0, P1, P2, P3};
			max_min <= 0;
		end
		else if (!Up_Down) begin
			max_min <= 0;
			Q <= Q + 1;
			if (Q == 8)	max_min <= 1;
			if (Q == 9) Q <= 0;
		end
		else begin 
			max_min <= 0;
			Q <= Q - 1;
			if (Q == 1) max_min <= 1;
			if (Q == 0) Q <= 10;
		end
	 end
	 
	 always @(CLK) begin
		if (max_min) RC <= 0;
		else RC <= 1;
		if (CLK) RC <= 1;
	 end
	 
endmodule
