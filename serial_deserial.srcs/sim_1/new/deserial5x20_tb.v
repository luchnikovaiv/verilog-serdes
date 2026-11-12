`timescale 1ns / 1ps

module deserial5x20_tb;

	reg clkIn;
	reg [4:0] dataIn;

	wire [19:0] dataOut;
	wire WE;

	deserial5x20 uut (
		.clkIn(clkIn),
		.dataIn(dataIn),
		.dataOut(dataOut),
		.WE(WE)
	);

	initial begin
		clkIn  = 0;
		dataIn = 0;

		#100;
	end

	always begin #5  clkIn  = ~clkIn;      end
	always begin #10 dataIn = dataIn + 1;  end

endmodule