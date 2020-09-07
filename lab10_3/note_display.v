`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/26 22:02:52
// Design Name: 
// Module Name: note_display
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
`define SS_1 8'b1001_1111
`define SS_2 8'b0010_0101
`define SS_3 8'b0000_1101
`define SS_4 8'b1001_1001
`define SS_5 8'b0100_1001
`define SS_6 8'b0100_0001
`define SS_7 8'b0001_1011


module note_display(note_div_left, show, ssd_ctrl);
    input [21:0] note_div_left;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    reg [7:0] show;    
    
    assign ssd_ctrl = 4'b1110;
    
    always @* begin
        if(note_div_left == 22'd0)
            show = 8'b11111111;
        else begin
            case(note_div_left)
                22'd191570: show = `SS_1;
                22'd95420: show = `SS_1;
                
                22'd170648: show = `SS_2;
                22'd85034: show = `SS_2;
                
                22'd151515: show = `SS_3;
                22'd75758: show = `SS_3;
                
                22'd143266: show = `SS_4;
                22'd71633: show = `SS_4;
                
                22'd127551: show = `SS_5;
                22'd63776: show = `SS_5;
                
                22'd113636: show = `SS_6;
                22'd56818: show = `SS_6;
                
                22'd101215: show = `SS_7;
                22'd50607: show = `SS_7;
                
                default: show = 8'b11111111;
            endcase        
        end
    end
endmodule
