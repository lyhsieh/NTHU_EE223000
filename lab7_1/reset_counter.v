`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/20 20:22:50
// Design Name: 
// Module Name: reset_counter
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


module reset_counter(press, clk, rst);
    input press, clk;
    output rst;
    
    reg [29:0] q;
    reg [29:0] q_temp;
    reg rst;
        
    always @* begin
        if(press == 1'b0)
            q_temp = 30'b0;
        else
            q_temp = q + 1'b1;
    end
    
    always @(posedge clk or negedge press) begin
        if(~press)
            q <= 30'b0;
        else
            q <= q_temp;
    end
    
    always @* begin
        if(q >= 30'd300000000)
            rst = 1'b0;
        else
            rst = 1'b1;
    end
endmodule
