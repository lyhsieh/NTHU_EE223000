`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 21:16:42
// Design Name: 
// Module Name: display_controller
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


module display_controller(sec0_dec, sec1_dec, min0_dec, min1_dec, hr0_dec, hr1_dec, hr0_12hr_dec, hr1_12hr_dec, content, clk_quick, time_system, ssd_ctrl, show);
    input [6:0] sec0_dec;
    input [6:0] sec1_dec;
    input [6:0] min0_dec;
    input [6:0] min1_dec;
    input [6:0] hr0_dec;
    input [6:0] hr1_dec;
    input [6:0] hr0_12hr_dec;
    input [6:0] hr1_12hr_dec;
    input [1:0] clk_quick;
    input content, time_system;
    output [3:0] ssd_ctrl;
    output [6:0] show;
    
    reg [6:0] show;
    reg [3:0] ssd_ctrl;
    
    reg [3:0] a;
    
    always @* begin
        a = {content, clk_quick[1], clk_quick[0], time_system};
    end
    
    always @* begin
        case(a)
            4'b0000: begin show = min0_dec; ssd_ctrl = 4'b1110; end
            4'b0001: begin show = min0_dec; ssd_ctrl = 4'b1110; end
            4'b0010: begin show = min1_dec; ssd_ctrl = 4'b1101; end
            4'b0011: begin show = min1_dec; ssd_ctrl = 4'b1101; end
            4'b0100: begin show = hr0_12hr_dec; ssd_ctrl = 4'b1011; end
            4'b0101: begin show = hr0_dec; ssd_ctrl = 4'b1011; end
            4'b0110: begin show = hr1_12hr_dec; ssd_ctrl = 4'b0111; end
            4'b0111: begin show = hr1_dec; ssd_ctrl = 4'b0111; end
            4'b1000: begin show = sec0_dec; ssd_ctrl = 4'b1110; end
            4'b1001: begin show = sec0_dec; ssd_ctrl = 4'b1110; end
            4'b1010: begin show = sec0_dec; ssd_ctrl = 4'b1110; end
            4'b1011: begin show = sec0_dec; ssd_ctrl = 4'b1110; end
            4'b1100: begin show = sec1_dec; ssd_ctrl = 4'b1101; end
            4'b1101: begin show = sec1_dec; ssd_ctrl = 4'b1101; end
            4'b1110: begin show = sec1_dec; ssd_ctrl = 4'b1101; end
            default: begin show = sec1_dec; ssd_ctrl = 4'b1101; end
        endcase
    end
    
endmodule
