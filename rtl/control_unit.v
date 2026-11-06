
module control_unit (
    input wire [5:0] opcode,

    output reg reg_dst,
    output reg alu_src,
    output reg mem_to_reg,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg branch,
    output reg jump,

    output reg [3:0] alu_control
);

    always @(*) begin

        // Default control signals
        reg_dst = 0;
        alu_src = 0;
        mem_to_reg = 0;
        reg_write = 0;
        mem_read = 0;
        mem_write = 0;
        branch = 0;
        jump = 0;
        alu_control = 4'b0000;

        case (opcode)

            // ADD
            6'b000000: begin
                reg_dst = 1;
                reg_write = 1;
                alu_control = 4'b0000;
            end

            // SUB
            6'b000001: begin
                reg_dst = 1;
                reg_write = 1;
                alu_control = 4'b0001;
            end

            // AND
            6'b000010: begin
                reg_dst = 1;
                reg_write = 1;
                alu_control = 4'b0010;
            end

            // OR
            6'b000011: begin
                reg_dst = 1;
                reg_write = 1;
                alu_control = 4'b0011;
            end

            // XOR
            6'b000100: begin
                reg_dst = 1;
                reg_write = 1;
                alu_control = 4'b0100;
            end

            // ADDI
            6'b001000: begin
                alu_src = 1;
                reg_write = 1;
                alu_control = 4'b0000;
            end

            // LW
            6'b001001: begin
                alu_src = 1;
                mem_to_reg = 1;
                reg_write = 1;
                mem_read = 1;
                alu_control = 4'b0000;
            end

            // SW
            6'b001010: begin
                alu_src = 1;
                mem_write = 1;
                alu_control = 4'b0000;
            end

            // BEQ
            6'b001011: begin
                branch = 1;
                alu_control = 4'b0001;
            end

            // JUMP
            6'b001100: begin
                jump = 1;
            end

            default: begin
                // Keep all control signals disabled
            end

        endcase

    end

endmodule
