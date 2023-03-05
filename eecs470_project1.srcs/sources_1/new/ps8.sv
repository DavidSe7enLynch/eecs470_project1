`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2023 08:09:05 PM
// Design Name: 
// Module Name: ps8
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
`include "ps4.sv"
`include "ps2.sv"


module ps8(
    input [7:0] req, 
    input en,
    output logic [7:0] gnt,
    output logic req_up
);
    wire [1:0] req_ups, enables;

    ps4_2 ps4_left(.req(req[7:4]), .en(enables[1]), .gnt(gnt[7:4]), .req_up(req_ups[1]));
    ps4_2 ps4_right(.req(req[3:0]), .en(enables[0]), .gnt(gnt[3:0]), .req_up(req_ups[0]));
    ps2 ps2_top(.req({req_ups[1], req_ups[0]}), .en(en), .gnt(enables[1:0]), .req_up(req_up));
endmodule

