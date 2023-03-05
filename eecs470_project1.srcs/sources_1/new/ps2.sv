`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2023 07:44:01 PM
// Design Name: 
// Module Name: ps4_2
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


module ps2(
    input [1:0] req,
    input en,
    output logic [1:0] gnt,
    output req_up
);
    assign gnt[1] = en & req[1];
    assign gnt[0] = en & req[0] & ~req[1];
    assign req_up = req[1] | req[0];
endmodule

