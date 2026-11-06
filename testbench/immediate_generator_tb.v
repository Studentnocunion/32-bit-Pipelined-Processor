
`timescale 1ns/1ps

module immediate_generator_tb;

    reg [31:0] instruction;

    wire [31:0] immediate;
    wire [31:0] jump_address;

    immediate_generator uut (
        .instruction(instruction),
        .immediate(immediate),
        .jump_address(jump_address)
    );

    initial begin

        $display("IMMEDIATE GENERATOR SIMULATION");
        $display("--------------------------------");

        // Test 1: Positive immediate 10
        instruction = {6'b001000, 5'd1, 5'd2, 16'h000A};
        #10;
        $display("Positive Immediate = %h", immediate);

        // Test 2: Positive immediate 5
        instruction = {6'b001000, 5'd1, 5'd2, 16'h0005};
        #10;
        $display("Second Immediate = %h", immediate);

        // Test 3: Negative immediate -5
        instruction = {6'b001000, 5'd1, 5'd2, 16'hFFFB};
        #10;
        $display("Negative Immediate = %h", immediate);

        // Test 4: Jump address
        instruction = {6'b001100, 26'h0000123};
        #10;
        $display("Jump Address = %h", jump_address);

        $display("--------------------------------");
        $display("IMMEDIATE GENERATOR TEST COMPLETED");

        $finish;

    end

endmodule
