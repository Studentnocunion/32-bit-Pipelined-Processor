
`timescale 1ns/1ps

module id_ex_register_tb;

    reg clk, reset, enable;

    reg [31:0] pc_in;
    reg [31:0] read_data1_in;
    reg [31:0] read_data2_in;
    reg [31:0] immediate_in;
    reg [4:0] destination_in;

    reg [3:0] alu_control_in;
    reg alu_src_in;
    reg reg_write_in;
    reg mem_read_in;
    reg mem_write_in;
    reg mem_to_reg_in;
    reg branch_in;

    wire [31:0] pc_out;
    wire [31:0] read_data1_out;
    wire [31:0] read_data2_out;
    wire [31:0] immediate_out;
    wire [4:0] destination_out;

    wire [3:0] alu_control_out;
    wire alu_src_out;
    wire reg_write_out;
    wire mem_read_out;
    wire mem_write_out;
    wire mem_to_reg_out;
    wire branch_out;

    id_ex_register uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),

        .pc_in(pc_in),
        .read_data1_in(read_data1_in),
        .read_data2_in(read_data2_in),
        .immediate_in(immediate_in),
        .destination_in(destination_in),

        .alu_control_in(alu_control_in),
        .alu_src_in(alu_src_in),
        .reg_write_in(reg_write_in),
        .mem_read_in(mem_read_in),
        .mem_write_in(mem_write_in),
        .mem_to_reg_in(mem_to_reg_in),
        .branch_in(branch_in),

        .pc_out(pc_out),
        .read_data1_out(read_data1_out),
        .read_data2_out(read_data2_out),
        .immediate_out(immediate_out),
        .destination_out(destination_out),

        .alu_control_out(alu_control_out),
        .alu_src_out(alu_src_out),
        .reg_write_out(reg_write_out),
        .mem_read_out(mem_read_out),
        .mem_write_out(mem_write_out),
        .mem_to_reg_out(mem_to_reg_out),
        .branch_out(branch_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        enable = 0;

        pc_in = 0;
        read_data1_in = 0;
        read_data2_in = 0;
        immediate_in = 0;
        destination_in = 0;

        alu_control_in = 0;
        alu_src_in = 0;
        reg_write_in = 0;
        mem_read_in = 0;
        mem_write_in = 0;
        mem_to_reg_in = 0;
        branch_in = 0;

        $display("ID/EX PIPELINE REGISTER SIMULATION");
        $display("--------------------------------");

        // Test 1: Reset
        #10;
        reset = 0;
        #1;
        $display("Reset: PC=%0d | Destination=%0d",
                 pc_out, destination_out);

        // Test 2: Load data and control signals
        pc_in = 32'd100;
        read_data1_in = 32'd15;
        read_data2_in = 32'd25;
        immediate_in = 32'd50;
        destination_in = 5'd4;

        alu_control_in = 4'b0000;
        alu_src_in = 1;
        reg_write_in = 1;
        mem_read_in = 0;
        mem_write_in = 0;
        mem_to_reg_in = 0;
        branch_in = 0;

        enable = 1;
        #9;

        $display("Load: PC=%0d | A=%0d | B=%0d",
                 pc_out, read_data1_out, read_data2_out);
        $display("Immediate=%0d | Destination=%0d",
                 immediate_out, destination_out);
        $display("RegWrite=%b | ALUSrc=%b",
                 reg_write_out, alu_src_out);

        // Test 3: Hold register values
        enable = 0;
        pc_in = 32'd200;
        read_data1_in = 32'd99;
        #10;

        $display("Hold: PC=%0d | A=%0d | Destination=%0d",
                 pc_out, read_data1_out, destination_out);

        // Test 4: Load new values
        enable = 1;
        #10;

        $display("Update: PC=%0d | A=%0d",
                 pc_out, read_data1_out);

        $display("--------------------------------");
        $display("ID/EX REGISTER TEST COMPLETED");

        $finish;
    end

endmodule
