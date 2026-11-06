
module branch_handling_unit (
    input wire [31:0] pc,
    input wire [31:0] immediate,
    input wire branch,
    input wire zero,

    output wire [31:0] branch_target,
    output wire [31:0] next_pc,
    output wire branch_taken
);

    assign branch_target = pc + (immediate << 2);

    assign branch_taken = branch && zero;

    assign next_pc = branch_taken
                   ? branch_target
                   : pc + 32'd4;

endmodule
