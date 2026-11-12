`timescale 1ns / 1ps
module deserial5x20(	input wire [in-1:0] dataIn,
					input wire clkIn,
					output reg [out-1:0] dataOut,
					output reg WE
    );

	parameter in  = 5;
	parameter out = 20;

	integer counterIn = 0;

	initial WE      = 0;
	initial dataOut = 0;

	always @(posedge clkIn) begin
		WE = 0;
		counterIn = counterIn + 1;
		if (counterIn > (out/in)) begin counterIn = 1; end
		case (counterIn)
			1: dataOut[4:0]   = dataIn;
			2: dataOut[9:5]   = dataIn;
			3: dataOut[14:10] = dataIn;
			4: dataOut[19:15] = dataIn;
			default: ;
		endcase;
		if (counterIn == (out/in)) begin
			WE = 1;
		end
	end
endmodule