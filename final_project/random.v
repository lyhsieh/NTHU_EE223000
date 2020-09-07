`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 00:17:47
// Design Name: 
// Module Name: random
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


module random(
    input clk,
    input rst,
    output reg [7:0] random
    );
 
 always@(posedge clk or posedge rst)
 if(rst)
    random<=8'b10101010;
 else
    random<={random[6:0],random[7]^random[6]^random[5]^random[0]};
    
endmodule
