`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2023 15:33:56
// Design Name: 
// Module Name: Key_rounds
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


module Key_rounds(
    input clk,
    input rst,
    input [127:0] Key,
    output [127:0] RoundKey_1, RoundKey_2, RoundKey_3, RoundKey_4, RoundKey_5, 
                   RoundKey_6, RoundKey_7, RoundKey_8, RoundKey_9, RoundKey_10
    );
    
    
    
    
    KeyExp KeyRound1(
.clk(clk), 
.rst(rst),
.Key(Key),
.ExpKey(RoundKey_1),
.Round_Counter(1)
);
    KeyExp KeyRound2(
.clk(clk), 
.rst(rst),
.Key(RoundKey_1),
.ExpKey(RoundKey_2),
.Round_Counter(2)
);
     KeyExp KeyRound3(
.clk(clk), 
.rst(rst),
.Key(RoundKey_2),
.ExpKey(RoundKey_3),
.Round_Counter(3)
);
    
    
     KeyExp KeyRound4(
.clk(clk), 
.rst(rst),
.Key(RoundKey_3),
.ExpKey(RoundKey_4),
.Round_Counter(4)
);
    
    
     KeyExp  KeyRound5(
.clk(clk), 
.rst(rst),
.Key(RoundKey_4),
.ExpKey(RoundKey_5),
.Round_Counter(5)
);
    
     KeyExp  KeyRound6(
.clk(clk), 
.rst(rst),
.Key(RoundKey_5),
.ExpKey(RoundKey_6),
.Round_Counter(6)
);
    
    
     KeyExp  KeyRound7(
.clk(clk), 
.rst(rst),
.Key(RoundKey_6),
.ExpKey(RoundKey_7),
.Round_Counter(7)
);
    
     KeyExp KeyRound8(
.clk(clk), 
.rst(rst),
.Key(RoundKey_7),
.ExpKey(RoundKey_8),
.Round_Counter(8)
);
    
    
     KeyExp  KeyRound9(
.clk(clk), 
.rst(rst),
.Key(RoundKey_8),
.ExpKey(RoundKey_9),
.Round_Counter(9)
);
     KeyExp KeyRound10(
.clk(clk), 
.rst(rst),
.Key(RoundKey_9),
.ExpKey(RoundKey_10),
.Round_Counter(10)
);
    
    
    
    
    
endmodule
