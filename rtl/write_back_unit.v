
module write_back_unit (
    input wire [31:0] alu_result,
    input wire [31:0] memory_data,
    input wire mem_to_reg,
    output wire [31:0] write_back_data
);

    assign write_back_data =
        mem_to_reg ? memory_data : alu_result;

endmodule
