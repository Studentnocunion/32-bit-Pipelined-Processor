module processor (
    input wire clk,
    input wire reset,
    input wire enable,

    output wire [31:0] debug_pc,
    output wire [31:0] debug_instruction,
    output wire [31:0] debug_alu_result,
    output wire [31:0] debug_write_back_data,
    output wire [31:0] debug_memory_read_data
);

    // ==========================================
    // 1. PROGRAM COUNTER AND INSTRUCTION FETCH
    // ==========================================

    wire [31:0] pc;
    wire [31:0] pc_plus4;
    wire [31:0] next_pc;
    wire [31:0] instruction;

    assign pc_plus4 = pc + 32'd4;

    wire pc_write;
    wire if_id_write;
    wire control_stall;
    wire pc_enable;
    wire if_id_enable;
    wire stall_id_ex_flush;

    program_counter PC (
        .clk(clk),
        .reset(reset),
        .enable(enable && pc_enable),
        .next_pc(next_pc),
        .pc(pc)
    );

    instruction_memory IMEM (
        .address(pc),
        .instruction(instruction)
    );


    // ==========================================
    // 2. IF/ID PIPELINE REGISTER
    // ==========================================

    wire [31:0] if_id_pc;
    wire [31:0] if_id_instruction;

    wire if_id_flush;
    wire id_ex_flush_from_control;

    if_id_register IF_ID (
        .clk(clk),
        .reset(reset),
        .enable(enable && if_id_enable),
        .flush(enable && if_id_flush),
        .pc_in(pc_plus4),
        .instruction_in(instruction),
        .pc_out(if_id_pc),
        .instruction_out(if_id_instruction)
    );


    // ==========================================
    // 3. INSTRUCTION DECODE
    // ==========================================

    wire [5:0] opcode;

    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rt;
    wire [4:0] rd;

    assign opcode = if_id_instruction[31:26];
    assign rs1 = if_id_instruction[25:21];
    assign rs2 = if_id_instruction[20:16];
    assign rt   = if_id_instruction[20:16];
    assign rd   = if_id_instruction[15:11];

    wire reg_dst;
    wire alu_src;
    wire mem_to_reg;
    wire reg_write;
    wire mem_read;
    wire mem_write;
   wire branch;
wire jump;
wire effective_jump;
wire [3:0] alu_control;

    control_unit CU (
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

    wire [31:0] immediate;
    wire [31:0] jump_target;

    immediate_generator IMM_GEN (
        .instruction(if_id_instruction),
        .immediate(immediate),
        .jump_address(jump_target)
    );

    wire [4:0] destination;

    destination_mux DEST_MUX (
        .rt(rt),
        .rd(rd),
        .reg_dst(reg_dst),
        .destination(destination)
    );


    // ==========================================
    // 4. WRITEBACK CONNECTION TO REGISTER FILE
    // ==========================================

    wire [31:0] register_data1;
    wire [31:0] register_data2;

    wire [31:0] write_back_data;

    wire [31:0] wb_memory_data;
    wire [31:0] wb_alu_result;
    wire [4:0] wb_destination;
    wire wb_reg_write;
    wire wb_mem_to_reg;

    register_file RF (
        .clk(clk),
        .reset(reset),
        .read_reg1(rs1),
        .read_reg2(rs2),
        .write_reg(wb_destination),
        .write_data(write_back_data),
        .reg_write(wb_reg_write),
        .read_data1(register_data1),
        .read_data2(register_data2)
    );

    write_back_unit WB_UNIT (
        .alu_result(wb_alu_result),
        .memory_data(wb_memory_data),
        .mem_to_reg(wb_mem_to_reg),
        .write_back_data(write_back_data)
    );


    // ==========================================
    // 5. HAZARD DETECTION AND STALL CONTROL
    // ==========================================

    wire [31:0] id_ex_pc;
    wire [31:0] id_ex_read_data1;
    wire [31:0] id_ex_read_data2;
    wire [31:0] id_ex_immediate;

    wire [4:0] id_ex_destination;
    wire [4:0] id_ex_rs1;
    wire [4:0] id_ex_rs2;

    wire [3:0] id_ex_alu_control;
    wire id_ex_alu_src;
    wire id_ex_reg_write;
    wire id_ex_mem_read;
    wire id_ex_mem_write;
    wire id_ex_mem_to_reg;
    wire id_ex_branch;

    hazard_detection_unit HAZARD (
        .id_ex_mem_read(id_ex_mem_read),
        .id_ex_rt(id_ex_destination),
        .if_id_rs1(rs1),
        .if_id_rs2(rs2),
        .pc_write(pc_write),
        .if_id_write(if_id_write),
        .control_stall(control_stall)
    );

    pipeline_stall_control STALL (
        .stall(control_stall),
        .pc_enable(pc_enable),
        .if_id_enable(if_id_enable),
        .id_ex_flush(stall_id_ex_flush)
    );


    // ==========================================
    // 6. PIPELINE FLUSH CONTROL
    // ==========================================

   wire branch_taken;
wire combined_id_ex_flush;

assign effective_jump = jump && !branch_taken;

    pipeline_flush_unit FLUSH (
        .branch_taken(branch_taken),
        .jump(effective_jump),
        .if_id_flush(if_id_flush),
        .id_ex_flush(id_ex_flush_from_control)
    );

    assign combined_id_ex_flush =
        enable && (stall_id_ex_flush || id_ex_flush_from_control);


    // ==========================================
    // 7. ID/EX PIPELINE REGISTER
    // ==========================================

    id_ex_register ID_EX (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .flush(combined_id_ex_flush),

        .pc_in(if_id_pc),
        .read_data1_in(register_data1),
        .read_data2_in(register_data2),
        .immediate_in(immediate),
        .destination_in(destination),
        .rs1_in(rs1),
        .rs2_in(rs2),

        .alu_control_in(alu_control),
        .alu_src_in(alu_src),
        .reg_write_in(reg_write),
        .mem_read_in(mem_read),
        .mem_write_in(mem_write),
        .mem_to_reg_in(mem_to_reg),
        .branch_in(branch),

        .pc_out(id_ex_pc),
        .read_data1_out(id_ex_read_data1),
        .read_data2_out(id_ex_read_data2),
        .immediate_out(id_ex_immediate),
        .destination_out(id_ex_destination),
        .rs1_out(id_ex_rs1),
        .rs2_out(id_ex_rs2),

        .alu_control_out(id_ex_alu_control),
        .alu_src_out(id_ex_alu_src),
        .reg_write_out(id_ex_reg_write),
        .mem_read_out(id_ex_mem_read),
        .mem_write_out(id_ex_mem_write),
        .mem_to_reg_out(id_ex_mem_to_reg),
        .branch_out(id_ex_branch)
    );


    // ==========================================
    // 8. FORWARDING UNIT
    // ==========================================

    wire [31:0] ex_mem_alu_result;
    wire [4:0] ex_mem_destination;
    wire ex_mem_reg_write;

    wire [1:0] forward_a;
    wire [1:0] forward_b;

    forwarding_unit FORWARD (
        .id_ex_rs1(id_ex_rs1),
        .id_ex_rs2(id_ex_rs2),
        .ex_mem_rd(ex_mem_destination),
        .ex_mem_reg_write(ex_mem_reg_write),
        .mem_wb_rd(wb_destination),
        .mem_wb_reg_write(wb_reg_write),
        .forward_a(forward_a),
        .forward_b(forward_b)
    );

    reg [31:0] forwarded_a;
    reg [31:0] forwarded_b;

    always @(*) begin

        case (forward_a)
            2'b10: forwarded_a = ex_mem_alu_result;
            2'b01: forwarded_a = write_back_data;
            default: forwarded_a = id_ex_read_data1;
        endcase

        case (forward_b)
            2'b10: forwarded_b = ex_mem_alu_result;
            2'b01: forwarded_b = write_back_data;
            default: forwarded_b = id_ex_read_data2;
        endcase

    end


    // ==========================================
    // 9. ALU OPERAND SELECTION
    // ==========================================

    wire [31:0] alu_input_b;

    alu_operand_mux ALU_MUX (
        .register_data(forwarded_b),
        .immediate(id_ex_immediate),
        .alu_src(id_ex_alu_src),
        .alu_input_b(alu_input_b)
    );


    // ==========================================
    // 10. EXECUTION STAGE - ALU
    // ==========================================

    wire [31:0] alu_result;
    wire alu_zero;

    alu ALU (
        .A(forwarded_a),
        .B(alu_input_b),
        .alu_control(id_ex_alu_control),
        .result(alu_result),
        .zero(alu_zero)
    );


    // ==========================================
    // 11. BRANCH HANDLING
    // ==========================================

    wire [31:0] branch_target;

    branch_handling_unit BRANCH (
        .pc(id_ex_pc),
        .immediate(id_ex_immediate),
        .branch(id_ex_branch),
        .zero(alu_zero),
        .branch_target(branch_target),
        .branch_taken(branch_taken),
        .next_pc()
    );


    // ==========================================
    // 12. PROGRAM COUNTER SELECTION
    // ==========================================

    pc_select PC_SELECT (
        .pc_plus4(pc_plus4),
        .branch_target(branch_target),
        .jump_target(jump_target),
        .branch_taken(branch_taken),
        .jump(effective_jump),
        .next_pc(next_pc)
    );


    // ==========================================
    // 13. EX/MEM PIPELINE REGISTER
    // ==========================================

    wire [31:0] ex_mem_write_data;
    wire [4:0] ex_mem_destination_unused;

    wire ex_mem_mem_read;
    wire ex_mem_mem_write;
    wire ex_mem_mem_to_reg;

    ex_mem_register EX_MEM (
        .clk(clk),
        .reset(reset),
        .enable(enable),

        .alu_result_in(alu_result),
        .write_data_in(forwarded_b),
        .destination_in(id_ex_destination),

        .reg_write_in(id_ex_reg_write),
        .mem_read_in(id_ex_mem_read),
        .mem_write_in(id_ex_mem_write),
        .mem_to_reg_in(id_ex_mem_to_reg),

        .alu_result_out(ex_mem_alu_result),
        .write_data_out(ex_mem_write_data),
        .destination_out(ex_mem_destination),

        .reg_write_out(ex_mem_reg_write),
        .mem_read_out(ex_mem_mem_read),
        .mem_write_out(ex_mem_mem_write),
        .mem_to_reg_out(ex_mem_mem_to_reg)
    );


    // ==========================================
    // 14. MEMORY STAGE
    // ==========================================

    wire [31:0] memory_read_data;

    data_memory DMEM (
        .clk(clk),
        .reset(reset),
        .mem_read(ex_mem_mem_read),
        .mem_write(enable && ex_mem_mem_write),
        .address(ex_mem_alu_result),
        .write_data(ex_mem_write_data),
        .read_data(memory_read_data)
    );


    // ==========================================
    // 15. MEM/WB PIPELINE REGISTER
    // ==========================================

    mem_wb_register MEM_WB (
        .clk(clk),
        .reset(reset),
        .enable(enable),

        .memory_data_in(memory_read_data),
        .alu_result_in(ex_mem_alu_result),
        .destination_in(ex_mem_destination),

        .reg_write_in(ex_mem_reg_write),
        .mem_to_reg_in(ex_mem_mem_to_reg),

        .memory_data_out(wb_memory_data),
        .alu_result_out(wb_alu_result),
        .destination_out(wb_destination),

        .reg_write_out(wb_reg_write),
        .mem_to_reg_out(wb_mem_to_reg)
    );
    assign debug_pc = pc;
    assign debug_instruction = if_id_instruction;
    assign debug_alu_result = alu_result;
    assign debug_write_back_data = write_back_data;
    assign debug_memory_read_data = memory_read_data;
endmodule