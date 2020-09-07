`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 17:09:07
// Design Name: 
// Module Name: display
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


module display(clk_quick, value0_dec, value1_dec, value2_dec, value3_dec, ssd_ctrl, show);
    input [1:0] clk_quick;
    input [7:0] value0_dec;
    input [7:0] value1_dec;
    input [7:0] value2_dec;
    input [7:0] value3_dec;
    output [3:0] ssd_ctrl;
    output [7:0] show;
    
    reg [3:0] ssd_ctrl;
    reg [7:0] show;
    
    always @* begin        
        if(clk_quick == 2'b00) begin
            show = value0_dec;
            ssd_ctrl = 4'b1110;
        end
        else if(clk_quick == 2'b01) begin
            show = value1_dec;
            ssd_ctrl = 4'b1101;
        end
        else if(clk_quick == 2'b10) begin
            show = value2_dec;
            ssd_ctrl = 4'b1011;
        end
        else begin
            show = value3_dec;
            ssd_ctrl = 4'b0111;
        end
    end
    
endmodule
