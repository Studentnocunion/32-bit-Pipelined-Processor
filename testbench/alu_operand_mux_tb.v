
`timescale 1ns/1ps

module alu_operand_mux_tb;

    reg [31:0] register_data;
    reg [31:0] immediate;
    reg alu_src;

    wire [31:0] alu_input_b;

    alu_operand_mux uut (
        .register_data(register_data),
        .immediate(immediate),
        .alu_src(alu_src),
        .alu_input_b(alu_input_b)
    );

    initial begin
        $display("ALU OPERAND MUX SIMULATION");
        $display("--------------------------------");

        // Test 1: Select register data
        register_data = 32'd20;
        immediate = 32'd10;
        alu_src = 0;
        #10;

        $display("Register Selection: ALU Input B=%0d",
                 alu_input_b);

        // Test 2: Select immediate value
        alu_src = 1;
        #10;

        $display("Immediate Selection: ALU Input B=%0d",
                 alu_input_b);

        // Test 3: Change register data
        register_data = 32'd45;
        alu_src = 0;
        #10;

        $display("Register Selection 2: ALU Input B=%0d",
                 alu_input_b);

        // Test 4: Change immediate value
        immediate = 32'd75;
        alu_src = 1;
        #10;

        $display("Immediate Selection 2: ALU Input B=%0d",
                 alu_input_b);

        $display("--------------------------------");
        $display("ALU OPERAND MUX TEST COMPLETED");

        $finish;
    end

endmodule
