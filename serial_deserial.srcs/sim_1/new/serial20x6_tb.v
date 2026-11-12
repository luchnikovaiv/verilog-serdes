`timescale 1ns / 1ps
module serial20x6_tb;

	reg [19:0] dataIn;
	reg clkIn;
	reg clkToOut;

	wire [5:0] dataOut;
	wire clkOut;

	serial20x6 uut (
		.dataIn(dataIn),
		.clkIn(clkIn),
		.clkToOut(clkToOut),
		.dataOut(dataOut),
		.clkOut(clkOut)
	);

	initial begin
		clkIn = 1;
		clkToOut = 0;

		dataIn = 20'b00111111000000111111;

		#100;


	end

	always begin #10 clkIn = ~clkIn; end
	always begin #3 clkToOut = ~clkToOut; end

endmodule
