`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/16 20:06:45
// Design Name: 
// Module Name: simple_keyboard
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


module simple_keyboard(PS2_DATA, PS2_CLK, clk, rst, dec, ssd_ctrl);
    input clk, rst;
    inout PS2_DATA, PS2_CLK;
    output [7:0] dec;
    output [3:0] ssd_ctrl;
    
    wire [8:0] last_change;
    wire key_valid;
    wire [511:0] key_down;
    reg [3:0] ssd_ctrl;
    
    always @* begin
        if(last_change == 9'b0_0101_1010)
            ssd_ctrl = 4'b1111;
        else 
            ssd_ctrl = 4'b1110;
    end
    
    KeyboardDecoder U0(.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(rst), .clk(clk), .last_change(last_change), .key_down(key_down), .key_valid(key_valid));
    seven_segment_decoder U1(.i(last_change), .D_ssd(dec));
endmodule
