module pc_select (
    input wire [31:0] pc_plus4,
    input wire [31:0] branch_target,
    input wire [31:0] jump_target,
    input wire branch_taken,
    input wire jump,

    output reg [31:0] next_pc
);

    always @(*) begin
        if (branch_taken)
            next_pc = branch_target;
        else if (jump)
            next_pc = jump_target;
        else
            next_pc = pc_plus4;
    end

endmodule