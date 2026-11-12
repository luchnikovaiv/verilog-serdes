`timescale 1ns / 1ps
module serial20x6(
    input wire [in-1:0] dataIn,
    input wire clkIn,
    input wire clkToOut,
    output reg [out-1:0] dataOut,
    output wire clkOut               
);

    parameter in = 20;
    parameter out = 6;

    reg [in*out-1:0] data = 0;
    integer counterIn = 0;
    integer counterOut = 0;
    integer start = 0;

    always @(posedge clkIn) begin
        counterIn = counterIn + 1;
        if (counterIn > out) begin counterIn = 1; end
        if (counterIn > 1) begin start = 1; end
        case (counterIn)
            1: data[19:0]    = dataIn;
            2: data[39:20]   = dataIn;
            3: data[59:40]   = dataIn;
            4: data[79:60]   = dataIn;
            5: data[99:80]   = dataIn;
            6: data[119:100] = dataIn;
            default: ;
        endcase;
    end

    assign clkOut = (start == 1) ? clkToOut : 1'b0;

    always @(posedge clkToOut) begin
        if (start == 1) begin
            counterOut = counterOut + 1;
            if (counterOut > in) begin counterOut = 1; end
            case (counterOut)
                1:  dataOut = data[5:0];
                2:  dataOut = data[11:6];
                3:  dataOut = data[17:12];
                4:  dataOut = data[23:18];
                5:  dataOut = data[29:24];
                6:  dataOut = data[35:30];
                7:  dataOut = data[41:36];
                8:  dataOut = data[47:42];
                9:  dataOut = data[53:48];
                10: dataOut = data[59:54];
                11: dataOut = data[65:60];
                12: dataOut = data[71:66];
                13: dataOut = data[77:72];
                14: dataOut = data[83:78];
                15: dataOut = data[89:84];
                16: dataOut = data[95:90];
                17: dataOut = data[101:96];
                18: dataOut = data[107:102];
                19: dataOut = data[113:108];
                20: dataOut = data[119:114];
                default: ;
            endcase;
        end
    end
endmodule