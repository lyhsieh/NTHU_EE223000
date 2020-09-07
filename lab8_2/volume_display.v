`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/02 22:15:56
// Design Name: 
// Module Name: volume_display
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


module volume_display(clk_quick, state, show, ssd_ctrl);
    input [1:0] clk_quick;
    input [3:0] state;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    reg [3:0] left;
    reg [3:0] right;    
    wire [7:0] left_dec;
    wire [7:0] right_dec;
    
    reg [3:0] ssd_ctrl;
    reg [7:0] show;
    
    always @* begin
        left = state / 10;
        right = state % 10;
    end
    
    always @* begin
        if(clk_quick == 2'b00) begin
            ssd_ctrl = 4'b1110;
            show = right_dec;
        end
        else if(clk_quick == 2'b01) begin
            ssd_ctrl = 4'b1110;
            show = right_dec;
        end
        else if(clk_quick == 2'b10) begin
            ssd_ctrl = 4'b1101;
            show = left_dec;
        end
        else begin
            ssd_ctrl = 4'b1101;
            show = left_dec;
        end
    end
    BCD_to_7_segment U0(.i(left), .D_ssd(left_dec));
    BCD_to_7_segment U1(.i(right), .D_ssd(right_dec));
endmodule
