`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 01:27:20 PM
// Design Name: 
// Module Name: rps2
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


module rps2(
    input [1:0] req,
    input en,
    input sel,
    output logic [1:0] gnt,
    output req_up
);
    assign gnt[1] = en & req[1] & (sel | (~sel & ~req[0]));
    assign gnt[0] = en & req[0] & (~sel | (sel & ~req[1]));
    assign req_up = req[1] | req[0];
endmodule
