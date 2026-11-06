
module branch_unit (
    input wire [31:0] A,
    input wire [31:0] B,
    input wire branch,
    output wire equal,
    output wire take_branch
);

    assign equal = (A == B);

    assign take_branch = branch && equal;

endmodule
