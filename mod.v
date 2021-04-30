`timescale 1ns / 1ps

module mod(
    input CLK,
    input ENT,
    input CLRBAR,
    output [15:0] OUT
    );
	 
	 wire [5:0] si;
	 counter counter_1(.CLK(CLK), .Q(si[3:0]), .RCO(q), .ENT(ENT), .CLRBAR(CLRBAR), .LOADBAR(0));
    counter counter_2(.CLK(CLK), .Q(si[5:4]), .RCO(), .ENT(q), .CLRBAR(CLRBAR), .LOADBAR(0));
	 decoder decoder_1(.sel(OUT), .A(si[0]), .B(si[1]), .C(si[2]), .D(si[3]), .G1BAR(si[4]), .G2BAR(si[5]));

endmodule

module counts(
    input CLK,
    input EN,
    input CLRBAR,
    output [5:0] OUT
    );
	 counter counter_1(.CLK(CLK), .Q(OUT[3:0]), .RCO(q), .ENT(EN));
    counter counter_2(.CLK(CLK), .Q(OUT[5:4]), .ENT(q));
	 
endmodule

module decoder(
	input A,
	input B,
	input C,
	input D,	
	input G1BAR,
	input G2BAR,
	output reg[15:0] sel
	);
	always @(A or B or C or D or G1BAR or G2BAR) begin
	case({D,C,B,A})
	4'b0000: sel=~16'b0000000000000001;
	4'b0001: sel=~16'b0000000000000010;
	4'b0010: sel=~16'b0000000000000100;
	4'b0011: sel=~16'b0000000000001000;
	4'b0100: sel=~16'b0000000000010000;
	4'b0101: sel=~16'b0000000000100000;
	4'b0110: sel=~16'b0000000001000000;
	4'b0111: sel=~16'b0000000010000000;
	4'b1000: sel=~16'b0000000100000000;
	4'b1001: sel=~16'b0000001000000000;
	4'b1010: sel=~16'b0000010000000000;
	4'b1011: sel=~16'b0000100000000000;
	4'b1100: sel=~16'b0001000000000000;
	4'b1101: sel=~16'b0010000000000000;
	4'b1110: sel=~16'b0100000000000000;
	4'b1111: sel=~16'b1000000000000000;
	endcase
	if(G1BAR || G2BAR) begin
			sel=~16'b0000000000000000;
	end
	end
endmodule

	module counter(
		 input ENT,
		 input CLK,
		 input LOADBAR,
		 input CLRBAR,
		 input[3:0] IN = 4'b0000,
		 output reg RCO = 1,
		 output reg [3:0] Q = -1
		 );
		 
		 always @(posedge CLRBAR or posedge CLK) begin
		 if (CLRBAR) begin
			Q = 4'b0000;
		 end
		 else begin
			if (ENT) begin
			 Q = Q + 1;
			 RCO = Q[0] & Q[1] & Q[2] & Q[3];
			end
			if(LOADBAR) begin
				Q = IN;
				RCO = Q[0] & Q[1] & Q[2] & Q[3];
			end
		 end
		 end
	endmodule
