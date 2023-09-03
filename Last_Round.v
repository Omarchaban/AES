`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 10:09:02
// Design Name: 
// Module Name: Last_Round
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


module Last_Round(
    input [127:0] AddRoundKeyOut,
    input [127:0] Expanded_Key,
    //output [127:0] data_out
    output [31:0]  data_out1,data_out2,data_out3,data_out4
    );
    
      wire [127:0] sBytes_out,Shift_Row_out,Addroundkey;
    
    SBytes SubBytes (.in_data(AddRoundKeyOut),.out_data(sBytes_out));
    
    Shift_Row  ShiftRow (.Sbytes(sBytes_out),.MixCol(Shift_Row_out));
    
     AddRoundKey_LastRound  Addkey (.in(Shift_Row_out),.Key(Expanded_Key),.data_out1(data_out1)
     ,.data_out2(data_out2),.data_out3(data_out3),.data_out4(data_out4));
    
    
    
endmodule
