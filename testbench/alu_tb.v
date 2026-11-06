
`timescale 1ns/1ps

module alu_tb;

    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] alu_control;

    wire [31:0] result;
    wire zero;

    alu uut (
        .A(A),
        .B(B),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial begin

        $display("32-BIT ALU SIMULATION");
        $display("--------------------------------");

        // ADD
        A = 10; B = 5; alu_control = 4'b0000;
        #10;
        $display("ADD = %0d", result);

        // SUB
        A = 10; B = 5; alu_control = 4'b0001;
        #10;
        $display("SUB = %0d", result);

        // AND
        A = 12; B = 10; alu_control = 4'b0010;
        #10;
        $display("AND = %0d", result);

        // OR
        A = 12; B = 10; alu_control = 4'b0011;
        #10;
        $display("OR = %0d", result);

        // XOR
        A = 12; B = 10; alu_control = 4'b0100;
        #10;
        $display("XOR = %0d", result);

        // NOR
        A = 0; B = 0; alu_control = 4'b0101;
        #10;
        $display("NOR = %h", result);

        // SLT
        A = 5; B = 10; alu_control = 4'b0110;
        #10;
        $display("SLT = %0d", result);

        // SLL
        A = 2; B = 3; alu_control = 4'b0111;
        #10;
        $display("SLL = %0d", result);

        // SRL
        A = 1; B = 8; alu_control = 4'b1000;
        #10;
        $display("SRL = %0d", result);

        // Zero flag
        A = 10; B = 10; alu_control = 4'b0001;
        #10;
        $display("Zero Flag = %b", zero);

        $display("--------------------------------");
        $display("ALU TEST COMPLETED");

        $finish;

    end

endmodule
