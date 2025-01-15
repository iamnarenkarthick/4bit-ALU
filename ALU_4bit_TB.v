`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2025 14:59:57
// Design Name: 
// Module Name: ALU_4bit_TB
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


module ALU_4bit_tb;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;
    
    // Outputs
    wire [3:0] ALU_Out;
    wire Carry_Out;

    // Instantiate the ALU module
    ALU_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .Carry_Out(Carry_Out)
    );

    // Testbench logic
    initial begin
        // Monitor the results
        $monitor("Time = %0t | A = %b | B = %b | ALU_Sel = %b | ALU_Out = %b | Carry_Out = %b", 
                 $time, A, B, ALU_Sel, ALU_Out, Carry_Out);
        
        // Iterate through all possible combinations of A, B, and ALU_Sel
        for (integer i = 0; i < 16; i = i + 1) begin
            for (integer j = 0; j < 16; j = j + 1) begin
                for (integer k = 0; k < 8; k = k + 1) begin
                    A = i[3:0];    // Assign 4-bit value to A
                    B = j[3:0];    // Assign 4-bit value to B
                    ALU_Sel = k[2:0]; // Assign 3-bit value to ALU_Sel
                    #10;           // Wait for 10 time units
                end
            end
        end

        $finish; // End simulation
    end
endmodule

