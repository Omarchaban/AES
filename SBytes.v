`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 08:31:55
// Design Name: 
// Module Name: SBytes
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


module SBytes(
    
    input [127:0] in_data,
    output [127:0] out_data
    );
    genvar i;
    generate
    for (i = 0; i < 16; i = i +1) begin
        SBox dut (.addr(in_data[127-(i*8):127-(i*8) -7])
                  ,.dout(out_data[127-(i*8):127-(i*8)-7])  );
    end
    endgenerate
    
    
    
endmodule
