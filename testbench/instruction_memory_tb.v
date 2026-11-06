
`timescale 1ns/1ps

module instruction_memory_tb;

    reg [31:0] address;
    wire [31:0] instruction;

    instruction_memory uut (
        .address(address),
        .instruction(instruction)
    );

    initial begin

        // Load sample instructions
        #1;
        uut.mem[0] = 32'h12345678;
        uut.mem[1] = 32'hABCDEF01;
        uut.mem[2] = 32'h87654321;
        uut.mem[3] = 32'hFEDCBA98;

        // Read instruction 1
        address = 0;
        #10;
        $display("PC = %0d | Instruction = %h", address, instruction);

        // Read instruction 2
        address = 4;
        #10;
        $display("PC = %0d | Instruction = %h", address, instruction);

        // Read instruction 3
        address = 8;
        #10;
        $display("PC = %0d | Instruction = %h", address, instruction);

        // Read instruction 4
        address = 12;
        #10;
        $display("PC = %0d | Instruction = %h", address, instruction);

        $finish;

    end

endmodule
