
module instruction_fetch (
    input wire clk,
    input wire reset,
    input wire enable,

    output wire [31:0] pc,
    output wire [31:0] instruction
);

    wire [31:0] next_pc;

    // Calculate next instruction address
    assign next_pc = pc + 32'd4;

    // Program Counter
    program_counter PC_UNIT (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .next_pc(next_pc),
        .pc(pc)
    );

    // Instruction Memory
    instruction_memory IMEM_UNIT (
        .address(pc),
        .instruction(instruction)
    );

endmodule
