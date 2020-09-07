`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/02 21:31:34
// Design Name: 
// Module Name: note_decoder
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


module note_decoder(Do_processed, Re_processed, Mi_processed, note_div);
    input Do_processed, Re_processed, Mi_processed;
    output [21:0] note_div;
    
    reg [21:0] note_div;
    
    always @* begin
        if(Do_processed == 1'b1)
            note_div = 22'd191571;
        else if(Re_processed == 1'b1)
            note_div = 22'd170648;
        else if(Mi_processed == 1'b1)
            note_div = 22'd151515;
        else
            note_div = 22'd0;
    end
endmodule
