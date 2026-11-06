
module pipeline_stall_control (
    input wire stall,

    output wire pc_enable,
    output wire if_id_enable,
    output wire id_ex_flush
);

    assign pc_enable = ~stall;
    assign if_id_enable = ~stall;
    assign id_ex_flush = stall;

endmodule
