`timescale 1ns / 1ps

module tst;

	reg CLK;
	reg LOAD;
	reg CE;
	reg Up_Down;
	reg P0;
	reg P1;
	reg P2;
	reg P3;

	wire [3:0] Q;
	wire RC;
	wire max_min;
	
	cnt74190 uut (
		.CLK(CLK), 
		.LOAD(LOAD), 
		.CE(CE), 
		.Up_Down(Up_Down), 
		.P0(P0), 
		.P1(P1), 
		.P2(P2), 
		.P3(P3), 
		.Q(Q), 
		.RC(RC), 
		.max_min(max_min)
	);

	initial begin
	
		CLK = 1;
		LOAD = 0; 
		CE = 0; //разрешение на 0
		Up_Down = 1; //0 прямой счет 1 обратный
		//загрузочное значение
		{P0, P1, P2, P3} = {0, 0, 0, 1};
		
	end
		
	always begin #10 CLK<=0; #10 CLK<=1; end 
	always begin #10 LOAD<=1; end 
	
endmodule

