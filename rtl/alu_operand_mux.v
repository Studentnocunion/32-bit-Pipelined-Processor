
module alu_operand_mux (
    input wire [31:0] register_data,
    input wire [31:0] immediate,
    input wire alu_src,
    output wire [31:0] alu_input_b
);

    assign alu_input_b =
        alu_src ? immediate : register_data;

endmodule
