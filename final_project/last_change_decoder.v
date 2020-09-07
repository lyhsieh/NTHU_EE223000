`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/21 15:30:44
// Design Name: 
// Module Name: last_change_decoder
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


module last_change_decoder(last_change, key_alphabet);
    input [8:0] last_change;
    output [4:0] key_alphabet;
    
    reg [4:0] key_alphabet;
    
    always @* begin
        case(last_change)
            9'h1C: key_alphabet = 5'd01;    //A
            9'h32: key_alphabet = 5'd02;    //B
            9'h21: key_alphabet = 5'd03;    //C
            9'h23: key_alphabet = 5'd04;    //D
            9'h24: key_alphabet = 5'd05;    //E
            9'h2B: key_alphabet = 5'd06;    //F
            9'h34: key_alphabet = 5'd07;    //G
            9'h33: key_alphabet = 5'd08;    //H
            9'h43: key_alphabet = 5'd09;    //I
            9'h3B: key_alphabet = 5'd10;    //J
            
            9'h42: key_alphabet = 5'd11;    //K
            9'h4B: key_alphabet = 5'd12;    //L
            9'h3A: key_alphabet = 5'd13;    //M
            9'h31: key_alphabet = 5'd14;    //N
            9'h44: key_alphabet = 5'd15;    //O
            9'h4D: key_alphabet = 5'd16;    //P
            9'h15: key_alphabet = 5'd17;    //Q
            9'h2D: key_alphabet = 5'd18;    //R
            9'h1B: key_alphabet = 5'd19;    //S
            9'h2C: key_alphabet = 5'd20;    //T
            
            9'h3C: key_alphabet = 5'd21;    //U
            9'h2A: key_alphabet = 5'd22;    //V
            9'h1D: key_alphabet = 5'd23;    //W
            9'h22: key_alphabet = 5'd24;    //X
            9'h35: key_alphabet = 5'd25;    //Y
            9'h1A: key_alphabet = 5'd26;    //Z
            
            default: key_alphabet = 5'd27;
        endcase
    end
endmodule
