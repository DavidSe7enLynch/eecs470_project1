`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 01:55:34 PM
// Design Name: 
// Module Name: counter_sim
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


module counter_sim(

);
    logic reset;
    logic clock;
    logic [1:0] count;

    counter ctr(.reset(reset), .clock(clock), .count(count));

    always
        #5 clock=~clock;

    initial begin
        clock= 0;
        reset = 1;
        #15
        reset = 0;

        #70;
        $finish;

    end
    

endmodule
