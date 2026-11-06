
`timescale 1ns/1ps

module control_unit_tb;

    reg [5:0] opcode;

    wire reg_dst;
    wire alu_src;
    wire mem_to_reg;
    wire reg_write;
    wire mem_read;
    wire mem_write;
    wire branch;
    wire jump;
    wire [3:0] alu_control;

    control_unit uut (
        .opcode(opcode),
        .reg_dst(reg_dst),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .branch(branch),
        .jump(jump),
        .alu_control(alu_control)
    );

    task test_instruction;
        input [5:0] op;
        begin
            opcode = op;
            #5;

            $display(
                "Opcode=%b | RegWrite=%b | MemRead=%b | MemWrite=%b | Branch=%b | Jump=%b | ALU=%b",
                opcode, reg_write, mem_read, mem_write,
                branch, jump, alu_control
            );
        end
    endtask

    initial begin

        $display("CONTROL UNIT SIMULATION");
        $display("----------------------------------------------");

        test_instruction(6'b000000); // ADD
        test_instruction(6'b000001); // SUB
        test_instruction(6'b000010); // AND
        test_instruction(6'b000011); // OR
        test_instruction(6'b000100); // XOR
        test_instruction(6'b001000); // ADDI
        test_instruction(6'b001001); // LW
        test_instruction(6'b001010); // SW
        test_instruction(6'b001011); // BEQ
        test_instruction(6'b001100); // JUMP

        $display("----------------------------------------------");
        $display("CONTROL UNIT TEST COMPLETED");

        $finish;

    end

endmodule
