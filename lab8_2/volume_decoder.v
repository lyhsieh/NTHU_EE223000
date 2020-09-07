`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/02 21:52:33
// Design Name: 
// Module Name: volume_decoder
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


module volume_decoder(state, high, low);
    input [3:0] state;
    output [15:0] high;
    output [15:0] low;
    
    reg [15:0] low;
    reg [15:0] high;
    
    always @* begin
        case(state)
            4'd0: begin low = 16'h0000; high = 16'h0000; end
            4'd1: begin low = 16'h1000; high = 16'hF000; end
            4'd2: begin low = 16'h1800; high = 16'hE800; end
            4'd3: begin low = 16'h2000; high = 16'hE000; end
            4'd4: begin low = 16'h2800; high = 16'hD800; end
            4'd5: begin low = 16'h3000; high = 16'hD000; end
            4'd6: begin low = 16'h3800; high = 16'hC800; end
            4'd7: begin low = 16'h4000; high = 16'hC000; end
            4'd8: begin low = 16'h4800; high = 16'hB800; end
            4'd9: begin low = 16'h5000; high = 16'hB000; end
            4'd10: begin low = 16'h5800; high = 16'hA800; end
            4'd11: begin low = 16'h6000; high = 16'hA000; end
            4'd12: begin low = 16'h6800; high = 16'h9800; end
            4'd13: begin low = 16'h7000; high = 16'h9000; end
            4'd14: begin low = 16'h7800; high = 16'h9800; end
            4'd15: begin low = 16'h7FFF; high = 16'h8000; end
            default: begin low = 16'h1800; high = 16'hE800; end
        endcase
    end
endmodule
