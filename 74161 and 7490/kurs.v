`timescale 1ns / 1ps

module Kurso(
    input clk,
    input EN,
    input RST,
    output [3:0] chet,
    output one_two,
    output one_ten_0,
    output zero_five_3,
    output zero_five_1,
    output zero_five_2,
    output [3:0] one_zero_0
    );
dec7490 from_zero_to_five(.MR(0),.MS(0),.CK0(0),.CK1(chet[3]),.QB(zero_five_1),.QC(zero_five_2),.QD(zero_five_3));

dec7490 from_zero_to_two(.MR(0),.MS(0),.CK0(chet[2]),.CK1(0),.QA(one_two));

dec7490 one_in_ten(.MR(0),.MS(0),.QD(s1),.CK0(s1),.CK1(chet[1]),.QA(one_ten_0));

dec7490 from_zero_to_nine(.MR(0),.MS(0),.CK0(chet[0]),.CK1(one_zero_0[0]),.QA(one_zero_0[0]),
.QB(one_zero_0[1]),.QC(one_zero_0[2]),.QD(one_zero_0[3]));

counter from_zero_to_fifteen(.CLRBAR(RST),.CLK(clk),.ENT(EN),.Q(chet[3:0]), .RCO(RCO));
endmodule

module dec7490(
	output reg QA=0,
	output reg QB=0,
	output reg QC=0,
	output reg QD=0,
    input [1:0] MR,
    input [1:0] MS,
    input RST,	
	 input CK0,
	 input CK1
	 );
	 
always @(negedge CK0 or posedge RST)
begin
	if(RST) QA<=1'b0;
	else begin
		if(!MR&&!MS) QA<=QA+1;
	end
end	

always @(negedge CK1 or posedge RST)
begin
	if(RST) {QD,QC,QB}<=3'b000;
	else begin
		if(!MR&&!MS) {QD,QC,QB}<={QD,QC,QB}+3'b001;
		if({QD,QC,QB} == 3'b100){QD,QC,QB}<=3'b000;
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
	
	
	
	
	
	
	