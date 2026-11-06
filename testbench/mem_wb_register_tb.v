
`timescale 1ns/1ps

module mem_wb_register_tb;

    reg clk, reset, enable;

    reg [31:0] memory_data_in;
    reg [31:0] alu_result_in;
    reg [4:0] destination_in;

    reg reg_write_in;
    reg mem_to_reg_in;

    wire [31:0] memory_data_out;
    wire [31:0] alu_result_out;
    wire [4:0] destination_out;

    wire reg_write_out;
    wire mem_to_reg_out;

    mem_wb_register uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),

        .memory_data_in(memory_data_in),
        .alu_result_in(alu_result_in),
        .destination_in(destination_in),

        .reg_write_in(reg_write_in),
        .mem_to_reg_in(mem_to_reg_in),

        .memory_data_out(memory_data_out),
        .alu_result_out(alu_result_out),
        .destination_out(destination_out),

        .reg_write_out(reg_write_out),
        .mem_to_reg_out(mem_to_reg_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        enable = 0;

        memory_data_in = 0;
        alu_result_in = 0;
        destination_in = 0;
        reg_write_in = 0;
        mem_to_reg_in = 0;

        $display("MEM/WB PIPELINE REGISTER SIMULATION");
        $display("--------------------------------");

        // Test 1: Reset
        #10;
        reset = 0;
        #1;

        $display("Reset: MemoryData=%0d | ALU=%0d",
                 memory_data_out, alu_result_out);

        // Test 2: Load values
        memory_data_in = 32'd500;
        alu_result_in = 32'd100;
        destination_in = 5'd10;

        reg_write_in = 1;
        mem_to_reg_in = 1;

        enable = 1;
        #9;

        $display("Load: MemoryData=%0d | ALU=%0d",
                 memory_data_out, alu_result_out);
        $display("Destination=%0d | RegWrite=%b | MemToReg=%b",
                 destination_out, reg_write_out, mem_to_reg_out);

        // Test 3: Hold values
        enable = 0;
        memory_data_in = 32'd900;
        alu_result_in = 32'd200;
        #10;

        $display("Hold: MemoryData=%0d | ALU=%0d",
                 memory_data_out, alu_result_out);

        // Test 4: Update values
        enable = 1;
        #10;

        $display("Update: MemoryData=%0d | ALU=%0d",
                 memory_data_out, alu_result_out);

        $display("--------------------------------");
        $display("MEM/WB REGISTER TEST COMPLETED");

        $finish;
    end

endmodule
