`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 16:13:24
// Design Name: 
// Module Name: Rounds
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


module Rounds(
   
    input [127:0] AddRoundKeyOut,
    input [127:0] Expanded_Key,
    output [127:0] data_out
    );
    
    wire [127:0] sBytes_out,Shift_Row_out,AddRoundKey;
    
    SBytes SubBytes (.in_data(AddRoundKeyOut),.out_data(sBytes_out));
    
    Shift_Row  ShiftRow (.Sbytes(sBytes_out),.MixCol(Shift_Row_out));
    
    MixColumns Mixcol (.Srow(Shift_Row_out),.AddRoundKey(AddRoundKey));
    
    AddRoundKey  Addkey (.in(AddRoundKey),.Key(Expanded_Key),.out(data_out));
    
    
    
    
    
endmodule
