module mem_addr_gen(
  input clk,
  input rst,
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  input [3:0] left1,
  input [3:0] left2,
  input [3:0] right1,
  input [3:0] right2,
  input [3:0] pattern,
  input [3:0] result3,
  input [3:0] result2,
  input [3:0] result1,
  input [3:0] result0,
  output [15:0] pixel_addr
);
    
pixel_address_generator U0(.h_cnt(h_cnt), .v_cnt(v_cnt), .left1(left1), .left2(left2), .right1(right1), .right2(right2), .pattern(pattern), .result0(result0), .result1(result1), .result2(result2), .result3(result3), .pixel_addr(pixel_addr));
    
endmodule
