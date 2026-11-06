
`timescale 1ns/1ps

module forwarding_unit_tb;

    reg [4:0] id_ex_rs1, id_ex_rs2;
    reg [4:0] ex_mem_rd, mem_wb_rd;
    reg ex_mem_reg_write, mem_wb_reg_write;

    wire [1:0] forward_a, forward_b;

    forwarding_unit uut (
        .id_ex_rs1(id_ex_rs1),
        .id_ex_rs2(id_ex_rs2),
        .ex_mem_rd(ex_mem_rd),
        .ex_mem_reg_write(ex_mem_reg_write),
        .mem_wb_rd(mem_wb_rd),
        .mem_wb_reg_write(mem_wb_reg_write),
        .forward_a(forward_a),
        .forward_b(forward_b)
    );

    initial begin
        $display("FORWARDING UNIT SIMULATION");
        $display("--------------------------------");

        // Test 1: No forwarding
        id_ex_rs1 = 5'd1;
        id_ex_rs2 = 5'd2;
        ex_mem_rd = 5'd3;
        mem_wb_rd = 5'd4;
        ex_mem_reg_write = 1;
        mem_wb_reg_write = 1;
        #10;
        $display("No Forwarding: A=%b B=%b",
                 forward_a, forward_b);

        // Test 2: Forward both operands from EX/MEM
        ex_mem_rd = 5'd1;
        id_ex_rs1 = 5'd1;
        id_ex_rs2 = 5'd1;
        #10;
        $display("EX/MEM Forwarding: A=%b B=%b",
                 forward_a, forward_b);

        // Test 3: Forward both operands from MEM/WB
        ex_mem_rd = 5'd7;
        mem_wb_rd = 5'd2;
        id_ex_rs1 = 5'd2;
        id_ex_rs2 = 5'd2;
        #10;
        $display("MEM/WB Forwarding: A=%b B=%b",
                 forward_a, forward_b);

        // Test 4: EX/MEM priority
        ex_mem_rd = 5'd3;
        mem_wb_rd = 5'd3;
        id_ex_rs1 = 5'd3;
        id_ex_rs2 = 5'd3;
        #10;
        $display("Priority Test: A=%b B=%b",
                 forward_a, forward_b);

        // Test 5: Never forward register R0
        id_ex_rs1 = 5'd0;
        id_ex_rs2 = 5'd0;
        ex_mem_rd = 5'd0;
        mem_wb_rd = 5'd0;
        #10;
        $display("R0 Test: A=%b B=%b",
                 forward_a, forward_b);

        $display("--------------------------------");
        $display("FORWARDING UNIT TEST COMPLETED");

        $finish;
    end

endmodule
