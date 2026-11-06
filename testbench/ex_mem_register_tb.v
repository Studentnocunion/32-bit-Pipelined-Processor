
`timescale 1ns/1ps

module ex_mem_register_tb;

    reg clk, reset, enable;

    reg [31:0] alu_result_in;
    reg [31:0] write_data_in;
    reg [4:0] destination_in;

    reg reg_write_in;
    reg mem_read_in;
    reg mem_write_in;
    reg mem_to_reg_in;

    wire [31:0] alu_result_out;
    wire [31:0] write_data_out;
    wire [4:0] destination_out;

    wire reg_write_out;
    wire mem_read_out;
    wire mem_write_out;
    wire mem_to_reg_out;

    ex_mem_register uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),

        .alu_result_in(alu_result_in),
        .write_data_in(write_data_in),
        .destination_in(destination_in),

        .reg_write_in(reg_write_in),
        .mem_read_in(mem_read_in),
        .mem_write_in(mem_write_in),
        .mem_to_reg_in(mem_to_reg_in),

        .alu_result_out(alu_result_out),
        .write_data_out(write_data_out),
        .destination_out(destination_out),

        .reg_write_out(reg_write_out),
        .mem_read_out(mem_read_out),
        .mem_write_out(mem_write_out),
        .mem_to_reg_out(mem_to_reg_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        enable = 0;

        alu_result_in = 0;
        write_data_in = 0;
        destination_in = 0;

        reg_write_in = 0;
        mem_read_in = 0;
        mem_write_in = 0;
        mem_to_reg_in = 0;

        $display("EX/MEM PIPELINE REGISTER SIMULATION");
        $display("--------------------------------");

        // Test 1: Reset
        #10;
        reset = 0;
        #1;
        $display("Reset: ALU=%0d | Destination=%0d",
                 alu_result_out, destination_out);

        // Test 2: Load values
        alu_result_in = 32'd100;
        write_data_in = 32'd50;
        destination_in = 5'd8;

        reg_write_in = 1;
        mem_read_in = 1;
        mem_write_in = 0;
        mem_to_reg_in = 1;

        enable = 1;
        #9;

        $display("Load: ALU=%0d | WriteData=%0d",
                 alu_result_out, write_data_out);
        $display("Destination=%0d | RegWrite=%b",
                 destination_out, reg_write_out);
        $display("MemRead=%b | MemWrite=%b | MemToReg=%b",
                 mem_read_out, mem_write_out, mem_to_reg_out);

        // Test 3: Hold values
        enable = 0;
        alu_result_in = 32'd200;
        write_data_in = 32'd75;
        #10;

        $display("Hold: ALU=%0d | WriteData=%0d",
                 alu_result_out, write_data_out);

        // Test 4: Update values
        enable = 1;
        #10;

        $display("Update: ALU=%0d | WriteData=%0d",
                 alu_result_out, write_data_out);

        $display("--------------------------------");
        $display("EX/MEM REGISTER TEST COMPLETED");

        $finish;
    end

endmodule
