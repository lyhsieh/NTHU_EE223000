`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 13:54:01
// Design Name: 
// Module Name: life_desplay
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


module life_desplay(life_in, life);
    input [4:0] life_in;
    output [15:0] life;
    
    reg [15:0] life;
    
    always @* begin
        case(life_in)
            5'd16: life = 16'b1111_1111_1111_1111;
            5'd15: life = 16'b0111_1111_1111_1111;
            5'd14: life = 16'b0011_1111_1111_1111;
            5'd13: life = 16'b0001_1111_1111_1111;
            5'd12: life = 16'b0000_1111_1111_1111;
            5'd11: life = 16'b0000_0111_1111_1111;
            5'd10: life = 16'b0000_0011_1111_1111;
            5'd9: life = 16'b0000_0001_1111_1111;
            5'd8: life = 16'b0000_0000_1111_1111;
            5'd7: life = 16'b0000_0000_0111_1111;
            5'd6: life = 16'b0000_0000_0011_1111;
            5'd5: life = 16'b0000_0000_0001_1111;
            5'd4: life = 16'b0000_0000_0000_1111;
            5'd3: life = 16'b0000_0000_0000_0111;
            5'd2: life = 16'b0000_0000_0000_0011;
            5'd1: life = 16'b0000_0000_0000_0001;
            5'd0: life = 16'b0000_0000_0000_0000;
            default: life = 16'b0000_0000_0000_0000;
        endcase
    end
endmodule
