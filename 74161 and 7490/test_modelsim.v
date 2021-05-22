`timescale 1ns / 1ps

module test_kurs;

reg clk, EN, RST;
	
wire [3:0] chet;
wire [3:0] one_zero_0;
wire one_two, one_ten_0, zero_five_3, zero_five_1, zero_five_2;

Kurs kursach(clk, EN, RST, chet, one_two, one_ten_0,zero_five_3, zero_five_1, zero_five_2,one_zero_0 );

initial begin
clk = 1;
EN = 1;
RST = 0;
end

always #10 clk = ~clk;

endmodule
