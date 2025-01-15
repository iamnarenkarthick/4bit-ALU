`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2025 14:57:34
// Design Name: 
// Module Name: ALU_4bit
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


module ALU_4bit (
    input [3:0] A,        // 4-bit input A
    input [3:0] B,        // 4-bit input B
    input [2:0] ALU_Sel,  // 3-bit control signal to select operation
    output reg [3:0] ALU_Out, // 4-bit output
    output reg Carry_Out  // Carry-out for addition/subtraction
);

    always @(*) begin
        Carry_Out = 0; // Default Carry_Out
        case (ALU_Sel)
            3'b000: ALU_Out = A + B;            // Addition
            3'b001: {Carry_Out, ALU_Out} = A - B; // Subtraction
            3'b010: ALU_Out = A & B;            // Bitwise AND
            3'b011: ALU_Out = A | B;            // Bitwise OR
            3'b100: ALU_Out = A ^ B;            // Bitwise XOR
            3'b101: ALU_Out = ~A;               // Bitwise NOT (A only)
            3'b110: ALU_Out = A << 1;           // Logical left shift
            3'b111: ALU_Out = A >> 1;           // Logical right shift
            default: ALU_Out = 4'b0000;         // Default output
        endcase
    end
endmodule

