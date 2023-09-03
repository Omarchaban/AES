`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2023 07:13:22
// Design Name: 
// Module Name: AddRoundKey_LastRound
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


module AddRoundKey_LastRound(
    input [127:0] in,
    input [127:0] Key,
   output [31:0]  data_out1,data_out2,data_out3,data_out4
    );
    
    assign data_out1 = in[127 : 96] ^ Key[127:96];
    assign data_out2 = in[95 : 64] ^ Key[95 : 64];
    assign data_out3 = in[63 : 32] ^ Key[63 : 32];
    assign data_out4 = in[31 : 0] ^ Key[31 : 0];

    
    
    
endmodule
