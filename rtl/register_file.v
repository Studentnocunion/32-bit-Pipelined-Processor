
module register_file (
    input wire clk,
    input wire reset,

    // Read addresses
    input wire [4:0] read_reg1,
    input wire [4:0] read_reg2,

    // Write address and data
    input wire [4:0] write_reg,
    input wire [31:0] write_data,
    input wire reg_write,

    // Read outputs
    output wire [31:0] read_data1,
    output wire [31:0] read_data2
);

    // 32 registers of 32 bits each
    reg [31:0] registers [0:31];

    integer i;

    // Reset and write operation
    always @(posedge clk or posedge reset) begin

        if (reset) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;
        end

        else if (reg_write && write_reg != 5'd0) begin
            registers[write_reg] <= write_data;
        end

    end

    // Two asynchronous read ports
   assign read_data1 =
    (read_reg1 == 5'd0) ? 32'd0 :
    (reg_write && write_reg == read_reg1) ? write_data :
    registers[read_reg1];

assign read_data2 =
    (read_reg2 == 5'd0) ? 32'd0 :
    (reg_write && write_reg == read_reg2) ? write_data :
    registers[read_reg2];

endmodule
