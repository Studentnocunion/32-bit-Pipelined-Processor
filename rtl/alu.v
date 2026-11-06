
module alu (
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] alu_control,

    output reg [31:0] result,
    output wire zero
);

    always @(*) begin

        case (alu_control)

            // Addition
            4'b0000:
                result = A + B;

            // Subtraction
            4'b0001:
                result = A - B;

            // AND
            4'b0010:
                result = A & B;

            // OR
            4'b0011:
                result = A | B;

            // XOR
            4'b0100:
                result = A ^ B;

            // NOR
            4'b0101:
                result = ~(A | B);

            // Set Less Than (signed comparison)
            4'b0110:
                result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;

            // Shift Left Logical
            4'b0111:
                result = B << A[4:0];

            // Shift Right Logical
            4'b1000:
                result = B >> A[4:0];

            // Default
            default:
                result = 32'd0;

        endcase

    end

    // Zero flag
    assign zero = (result == 32'd0);

endmodule
