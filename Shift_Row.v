`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 07:50:49
// Design Name: 
// Module Name: Shift_Row
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


module Shift_Row(
    
    input [127:0] Sbytes,
    output  [127:0] MixCol
    );
    
     
    
    assign {MixCol[127:120] , MixCol[95:88] , MixCol[63:56] , MixCol[31:24]} = {Sbytes[127:120],Sbytes[95:88],Sbytes[63:56],Sbytes[31:24]};  
    assign {MixCol[119:112] , MixCol[87:80] , MixCol[55:48] , MixCol[23:16]} = {Sbytes[87:80],Sbytes[55:48],Sbytes[23:16],Sbytes[119:112]};  
    assign {MixCol[111:104] , MixCol[79:72] , MixCol[47:40] , MixCol[15:8] }  = {Sbytes[47:40],Sbytes[15:8],Sbytes[111:104],Sbytes[79:72]};  
    assign {MixCol[103:96]  , MixCol[71:64] , MixCol[39:32] , MixCol[7:0]  }   = {Sbytes[7:0] ,Sbytes[103:96],Sbytes[71:64],Sbytes[39:32]};
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
