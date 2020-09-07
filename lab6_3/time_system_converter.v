`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/13 20:21:45
// Design Name: 
// Module Name: time_system_converter
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


module time_system_converter(hr0, hr1, hr0_12hr, hr1_12hr, am_or_not_temp);
    input [3:0] hr0;
    input [3:0] hr1;
    output [3:0] hr0_12hr;
    output [3:0] hr1_12hr;
    output am_or_not_temp;
    
    reg [3:0] hr0_12hr;
    reg [3:0] hr1_12hr;
    reg am_or_not_temp;
    
    reg [7:0] b;
    
    always @* begin
        b = {hr1, hr0};
    end
    
    always @* begin
        case(b)
            8'b0000_0000: begin hr1_12hr = 4'd1; hr0_12hr = 4'd2; am_or_not_temp = 1'b0; end              
            8'b0001_0011: begin hr1_12hr = 4'd0; hr0_12hr = 4'd1; am_or_not_temp = 1'b1; end
            8'b0001_0100: begin hr1_12hr = 4'd0; hr0_12hr = 4'd2; am_or_not_temp = 1'b1; end
            8'b0001_0101: begin hr1_12hr = 4'd0; hr0_12hr = 4'd3; am_or_not_temp = 1'b1; end
            8'b0001_0110: begin hr1_12hr = 4'd0; hr0_12hr = 4'd4; am_or_not_temp = 1'b1; end
            8'b0001_0111: begin hr1_12hr = 4'd0; hr0_12hr = 4'd5; am_or_not_temp = 1'b1; end
            8'b0001_1000: begin hr1_12hr = 4'd0; hr0_12hr = 4'd6; am_or_not_temp = 1'b1; end
            8'b0001_1001: begin hr1_12hr = 4'd0; hr0_12hr = 4'd7; am_or_not_temp = 1'b1; end
            8'b0010_0000: begin hr1_12hr = 4'd0; hr0_12hr = 4'd8; am_or_not_temp = 1'b1; end
            8'b0010_0001: begin hr1_12hr = 4'd0; hr0_12hr = 4'd9; am_or_not_temp = 1'b1; end
            8'b0010_0010: begin hr1_12hr = 4'd1; hr0_12hr = 4'd0; am_or_not_temp = 1'b1; end
            8'b0010_0011: begin hr1_12hr = 4'd1; hr0_12hr = 4'd1; am_or_not_temp = 1'b1; end
            default: begin hr1_12hr = hr1; hr0_12hr = hr0; am_or_not_temp = 1'b0; end
        endcase
    end
endmodule
