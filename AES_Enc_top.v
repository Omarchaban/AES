`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2023 08:35:55
// Design Name: 
// Module Name: AES_Enc_top
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


module AES_Enc_top(
    input clk,
    input rst,
    output [31:0]  data_out1,data_out2,data_out3,data_out4
    );
    reg [127:0] text,Key;
    wire [127:0] Rounds_data;
    wire [127:0] RoundKey_1, RoundKey_2, RoundKey_3, RoundKey_4, RoundKey_5, 
             RoundKey_6, RoundKey_7, RoundKey_8, RoundKey_9, RoundKey_10;
    
    
    wire [127:0] Round1out, Round2out, Round3out, Round4out, Round5out, 
             Round6out, Round7out, Round8out, Round9out;
    
    
    initial begin//
        text =128'h00000101030307070f0f1f1f3f3f7f7f;
        Key =128'b0;
    end
    
    AddRoundKey PreRounds (.in(text),.Key(Key),.out(Rounds_data));
    
    
    Key_rounds    KeyExpansion_inst(
        .clk(clk), 
        .rst(rst),
        .Key(Key),
        .RoundKey_1(RoundKey_1), 
        .RoundKey_2(RoundKey_2), 
        .RoundKey_3(RoundKey_3), 
        .RoundKey_4(RoundKey_4), 
        .RoundKey_5(RoundKey_5), 
        .RoundKey_6(RoundKey_6), 
        .RoundKey_7(RoundKey_7), 
        .RoundKey_8(RoundKey_8), 
        .RoundKey_9(RoundKey_9), 
        .RoundKey_10(RoundKey_10)
        );
    
    
        Rounds     Round1 (.AddRoundKeyOut(Rounds_data),.Expanded_Key(RoundKey_1),.data_out(Round1out));
        Rounds     Round2 (.AddRoundKeyOut(Round1out),.Expanded_Key(RoundKey_2),.data_out(Round2out));
        Rounds     Round3 (.AddRoundKeyOut(Round2out),.Expanded_Key(RoundKey_3),.data_out(Round3out));
        Rounds     Round4 (.AddRoundKeyOut(Round3out),.Expanded_Key(RoundKey_4),.data_out(Round4out));
        Rounds     Round5 (.AddRoundKeyOut(Round4out),.Expanded_Key(RoundKey_5),.data_out(Round5out));
        Rounds     Round6 (.AddRoundKeyOut(Round5out),.Expanded_Key(RoundKey_6),.data_out(Round6out));
        Rounds     Round7 (.AddRoundKeyOut(Round6out),.Expanded_Key(RoundKey_7),.data_out(Round7out));
        Rounds     Round8 (.AddRoundKeyOut(Round7out),.Expanded_Key(RoundKey_8),.data_out(Round8out));
        Rounds     Round9 (.AddRoundKeyOut(Round8out),.Expanded_Key(RoundKey_9),.data_out(Round9out));
        Last_Round Round10(.AddRoundKeyOut(Round9out),.Expanded_Key(RoundKey_10),.data_out1(data_out1),.data_out2(data_out2)
            ,.data_out3(data_out3),.data_out4(data_out4));

    
    
    
    
    
    
    
    
    
    
endmodule
