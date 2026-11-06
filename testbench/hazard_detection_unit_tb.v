
`timescale 1ns/1ps

module hazard_detection_unit_tb;

    reg id_ex_mem_read;
    reg [4:0] id_ex_rt;
    reg [4:0] if_id_rs1;
    reg [4:0] if_id_rs2;

    wire pc_write;
    wire if_id_write;
    wire control_stall;

    hazard_detection_unit uut (
        .id_ex_mem_read(id_ex_mem_read),
        .id_ex_rt(id_ex_rt),
        .if_id_rs1(if_id_rs1),
        .if_id_rs2(if_id_rs2),
        .pc_write(pc_write),
        .if_id_write(if_id_write),
        .control_stall(control_stall)
    );

    initial begin
        $display("HAZARD DETECTION UNIT SIMULATION");
        $display("--------------------------------");

        // Test 1: No hazard
        id_ex_mem_read = 0;
        id_ex_rt = 5'd5;
        if_id_rs1 = 5'd5;
        if_id_rs2 = 5'd2;
        #10;
        $display("No Hazard: PCWrite=%b IFIDWrite=%b Stall=%b",
                 pc_write, if_id_write, control_stall);

        // Test 2: Hazard through source register 1
        id_ex_mem_read = 1;
        id_ex_rt = 5'd5;
        if_id_rs1 = 5'd5;
        if_id_rs2 = 5'd2;
        #10;
        $display("RS1 Hazard: PCWrite=%b IFIDWrite=%b Stall=%b",
                 pc_write, if_id_write, control_stall);

        // Test 3: Hazard through source register 2
        id_ex_rt = 5'd7;
        if_id_rs1 = 5'd1;
        if_id_rs2 = 5'd7;
        #10;
        $display("RS2 Hazard: PCWrite=%b IFIDWrite=%b Stall=%b",
                 pc_write, if_id_write, control_stall);

        // Test 4: No hazard when registers differ
        id_ex_rt = 5'd8;
        if_id_rs1 = 5'd1;
        if_id_rs2 = 5'd2;
        #10;
        $display("Different Registers: PCWrite=%b IFIDWrite=%b Stall=%b",
                 pc_write, if_id_write, control_stall);

        // Test 5: R0 must not create a hazard
        id_ex_rt = 5'd0;
        if_id_rs1 = 5'd0;
        if_id_rs2 = 5'd0;
        #10;
        $display("R0 Test: PCWrite=%b IFIDWrite=%b Stall=%b",
                 pc_write, if_id_write, control_stall);

        $display("--------------------------------");
        $display("HAZARD DETECTION TEST COMPLETED");

        $finish;
    end

endmodule
