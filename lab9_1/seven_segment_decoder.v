`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/16 20:56:10
// Design Name: 
// Module Name: seven_segment_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`define SS_0 8'b0000_0011
`define SS_1 8'b1001_1111
`define SS_2 8'b0010_0101
`define SS_3 8'b0000_1101
`define SS_4 8'b1001_1001
`define SS_5 8'b0100_1001
`define SS_6 8'b0100_0001
`define SS_7 8'b0001_1011
`define SS_8 8'b0000_0001
`define SS_9 8'b0000_1001
`define SS_A 8'b0001_0001
`define SS_S 8'b1100_0101
`define SS_M 8'b1101_0101
`define SS_ELSE 8'b1111_0101


module seven_segment_decoder(i, D_ssd);
    input [8:0] i;
    output [7:0] D_ssd;
    reg [7:0] D_ssd;
    always @* begin
        case(i)
            9'b0_0100_0101: D_ssd = `SS_0;    //45
            9'b0_0111_0000: D_ssd = `SS_0;    //70
            
            9'b0_0001_0110: D_ssd = `SS_1;    //16
            9'b0_0110_1001: D_ssd = `SS_1;    //69
            
            9'b0_0001_1110: D_ssd = `SS_2;    //1E
            9'b0_0111_0010: D_ssd = `SS_2;    //72
            
            9'b0_0010_0110: D_ssd = `SS_3;    //26
            9'b0_0111_1010: D_ssd = `SS_3;    //7A
            
            9'b0_0010_0101: D_ssd = `SS_4;    //25
            9'b0_0110_1011: D_ssd = `SS_4;    //6B
            
            9'b0_0010_1110: D_ssd = `SS_5;    //2E
            9'b0_0111_0011: D_ssd = `SS_5;    //73
            
            9'b0_0011_0110: D_ssd = `SS_6;    //36
            9'b0_0111_0100: D_ssd = `SS_6;    //74
            
            9'b0_0011_1101: D_ssd = `SS_7;    //3D
            9'b0_0110_1100: D_ssd = `SS_7;    //6C
            
            9'b0_0011_1110: D_ssd = `SS_8;    //3E
            9'b0_0111_0101: D_ssd = `SS_8;    //75
            
            9'b0_0100_0110: D_ssd = `SS_9;    //46
            9'b0_0111_1101: D_ssd = `SS_9;    //7D
            
            9'b0_0001_1100: D_ssd = `SS_A;    //1C
            9'b0_0001_1011: D_ssd = `SS_S;    //1B
            9'b0_0011_1010: D_ssd = `SS_M;    //3A
            
            default: D_ssd = `SS_ELSE;                                    
        endcase
    end
endmodule
