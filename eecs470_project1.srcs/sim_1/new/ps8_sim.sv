`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2023 08:12:05 PM
// Design Name: 
// Module Name: ps8_sim
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


module ps8_sim;
    logic [7:0] req;
    logic  en;
    logic [7:0] gnt;
    logic [7:0] tb_gnt;
    logic correct;
    logic [1:0] count;
    logic reset;
    logic clock;

    ps8 ps8(.req(req), .en(en), .gnt(gnt));
//    ps4_as ps4_assign(req(req), .en(en), .gnt(gnt));

    assign correct=(gnt==tb_gnt);

    always @(correct) begin
        #2
        if(!correct)
        begin
            $display("@@@ Incorrect at time %4.0f", $time);
            $display("@@@ gnt=%b, en=%b, req=%b",gnt,en,req);
            $display("@@@ expected result=%b", tb_gnt);
            $finish;
        end
    end


    always
        #5 clock=~clock;


    initial begin
        $monitor("Time:%4.0f req:%b en:%b gnt:%b, cnt:%b", $time, req, en, gnt, count);

        // CNT=????, need to reset.
        clock=0;
        reset=1;
        #6
        // CNT=0
        reset=0;
        req=8'b00000001;
        en=1;
        tb_gnt=8'b00000001;
        #10
        // CNT=1
        req=8'b00000010;
        en=1;
        tb_gnt=8'b00000010;
        #10
        // CNT=2
        req=8'b00000101;
        tb_gnt=8'b00000100;
        #10
        // CNT=3
        req=8'b00000011;
        tb_gnt=8'b00000010;
        #10
        // CNT=0
        req=8'b00001111;
        tb_gnt=8'b00001000;
        #10
        // CNT=1
        req=8'b00011111;
        tb_gnt=8'b00010000;
        #10
        // CNT=2
        req=8'b00110011;
        tb_gnt=8'b00100000;
        #10

        req=8'b01000111;
        tb_gnt=8'b01000000;
        #10

        req=8'b10100101;
        tb_gnt=8'b10000000;
        #10

        req=8'b11111111;
        tb_gnt=8'b10000000;
        #10
        
        $finish;
     end // initial
endmodule

