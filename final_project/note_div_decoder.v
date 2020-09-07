`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/22 11:46:55
// Design Name: 
// Module Name: note_div_decoder
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


module note_div_decoder(pitch, note_div);
    input [3:0] pitch;
    output [21:0] note_div;
    
    reg [21:0] note_div;
    
    always @* begin
        case(pitch)
            4'd1: note_div = 22'd191170;
            4'd2: note_div = 22'd170265;
            4'd3: note_div = 22'd151685;
            4'd4: note_div = 22'd143172;
            4'd5: note_div = 22'd127551;
            4'd6: note_div = 22'd113636;
            4'd7: note_div = 22'd101239;
            4'd8: note_div = 22'd95557;    //high-pitched DO
            4'd9: note_div = 22'd255102;    //low-pitched SO
            default: note_div = 22'd0;
        endcase
    end
endmodule
