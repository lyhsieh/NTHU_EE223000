`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/19 23:26:14
// Design Name: 
// Module Name: leap_year_counter
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


module leap_year_counter(enable, rst, q);
    input enable, rst;
    output [1:0] q;
    reg [1:0] q;
    reg [1:0] q_temp;
    
    always @* begin
        q_temp = q + 1'b1;
    end
    
    always @(posedge enable or negedge rst) begin
        if(~rst)
            q_temp <= 4'd0;
        else
            q <= q_temp;
    end
endmodule
