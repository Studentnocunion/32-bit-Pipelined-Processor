
module mem_wb_register (
    input wire clk,
    input wire reset,
    input wire enable,

    input wire [31:0] memory_data_in,
    input wire [31:0] alu_result_in,
    input wire [4:0] destination_in,

    input wire reg_write_in,
    input wire mem_to_reg_in,

    output reg [31:0] memory_data_out,
    output reg [31:0] alu_result_out,
    output reg [4:0] destination_out,

    output reg reg_write_out,
    output reg mem_to_reg_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            memory_data_out <= 32'd0;
            alu_result_out <= 32'd0;
            destination_out <= 5'd0;
            reg_write_out <= 1'b0;
            mem_to_reg_out <= 1'b0;
        end
        else if (enable) begin
            memory_data_out <= memory_data_in;
            alu_result_out <= alu_result_in;
            destination_out <= destination_in;
            reg_write_out <= reg_write_in;
            mem_to_reg_out <= mem_to_reg_in;
        end
    end

endmodule
