`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/03 16:53:41
// Design Name: 
// Module Name: initial_signal_generator
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


module initial_signal_generator(value0, value1, value2, value3, increase_or_decrease, increase_en, decrease_en);
    input [3:0] value0;
    input [3:0] value1;
    input [3:0] value2;
    input [3:0] value3;
    input increase_or_decrease;
    output increase_en, decrease_en;
    
    reg increase_en, decrease_en;
    
    always @* begin
        if(value0 == 4'd0 && value1 == 4'd0 && value2 == 4'd0 && value3 == 4'd0) begin
            increase_en = 1'b0;
            decrease_en = 1'b0;
        end
        else if(increase_or_decrease == 1'b0) begin
            increase_en = 1'b1;
            decrease_en = 1'b0;
        end
        else begin
            increase_en = 1'b0;
            decrease_en = 1'b1;
        end
    end
endmodule
