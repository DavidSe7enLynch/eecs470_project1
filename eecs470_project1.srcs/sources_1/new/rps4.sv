`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2023 01:34:39 PM
// Design Name: 
// Module Name: rps4
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
`include "rps2.sv"
`include "counter.sv"


module rps4(
    input [3:0] req, 
    input en,
    input clock,
    input reset,
    output logic [3:0] gnt,
    output logic req_up
);
    wire req_up_left, req_up_right;
    wire [1:0] enables, sel;

    counter ctr(.clock(clock), .reset(reset), .sel(sel));
    rps2 ps2_left(.req(req[3:2]), .en(enables[1]), .sel(sel[0]), .gnt(gnt[3:2]), .req_up(req_up_left));
    rps2 ps2_right(.req(req[1:0]), .en(enables[0]), .sel(sel[0]), .gnt(gnt[1:0]), .req_up(req_up_right));
    rps2 ps2_top(.req({req_up_left, req_up_right}), .en(en), .sel(sel[1]), .gnt(enables[1:0]), .req_up(req_up));
endmodule



