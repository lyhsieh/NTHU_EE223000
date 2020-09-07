`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/14 20:56:47
// Design Name: 
// Module Name: diaplay_controller
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


module display_controller(day0_dec, day1_dec, month0_dec, month1_dec, year0_dec, year1_dec, content, clk_quick, ssd_ctrl, show);
    input [7:0] day0_dec;
    input [7:0] day1_dec;
    input [7:0] month0_dec;
    input [7:0] month1_dec;
    input [7:0] year0_dec;
    input [7:0] year1_dec;
    input content;
    input [1:0] clk_quick;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    reg [7:0] show;
    reg [3:0] ssd_ctrl;
    
    reg [3:0] a;
    always @* begin
        a = {content, clk_quick[1], clk_quick[0]};
    end
    
    
    always @* begin
        case(a)
            3'b000: begin show = day0_dec; ssd_ctrl = 4'b1110; end
            3'b001: begin show = day1_dec; ssd_ctrl = 4'b1101; end
            3'b010: begin show = month0_dec; ssd_ctrl = 4'b1011; end
            3'b011: begin show = month1_dec; ssd_ctrl = 4'b0111; end
            3'b100: begin show = year0_dec; ssd_ctrl = 4'b1110; end
            3'b101: begin show = year0_dec; ssd_ctrl = 4'b1110; end
            3'b110: begin show = year1_dec; ssd_ctrl = 4'b1101; end
            default: begin show = year1_dec; ssd_ctrl = 4'b1101; end
        endcase
    end
    
endmodule
