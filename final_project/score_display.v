`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 12:34:19
// Design Name: 
// Module Name: score_display
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


module score_display(point, clk_quick, show, ssd_ctrl);
    input [9:0] point;
    input [1:0] clk_quick;
    output [7:0] show;
    output [3:0] ssd_ctrl;
    
    reg [3:0] ssd_ctrl;
    reg [7:0] show;
    
    reg [3:0] score3;
    reg [3:0] score2;
    reg [3:0] score1;
    reg [3:0] score0;
    
    wire [7:0] score3_dec;
    wire [7:0] score2_dec;
    wire [7:0] score1_dec;
    wire [7:0] score0_dec;
    
    always @* begin
        score3 = point / 1000;
        score2 = (point % 1000) / 100;
        score1 = (point % 100) / 10;
        score0 = point % 10;
    end
    
    always @* begin
        if(clk_quick == 2'b00) begin
            ssd_ctrl = 4'b0111;
            show = score3_dec;
        end
        else if(clk_quick == 2'b01) begin
            ssd_ctrl = 4'b1011;
            show = score2_dec;
        end
        else if(clk_quick == 2'b10) begin
            ssd_ctrl = 4'b1101;
            show = score1_dec;
        end
        else begin
            ssd_ctrl = 4'b1110;
            show = score0_dec;
        end
    end
    
    BCD_to_7_segment U0(.i(score3), .D_ssd(score3_dec));
    BCD_to_7_segment U1(.i(score2), .D_ssd(score2_dec));
    BCD_to_7_segment U2(.i(score1), .D_ssd(score1_dec));
    BCD_to_7_segment U3(.i(score0), .D_ssd(score0_dec));
endmodule
