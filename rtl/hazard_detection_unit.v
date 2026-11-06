
module hazard_detection_unit (
    input wire id_ex_mem_read,
    input wire [4:0] id_ex_rt,

    input wire [4:0] if_id_rs1,
    input wire [4:0] if_id_rs2,

    output wire pc_write,
    output wire if_id_write,
    output wire control_stall
);

    wire hazard;

    assign hazard = id_ex_mem_read &&
                    (id_ex_rt != 5'd0) &&
                    ((id_ex_rt == if_id_rs1) ||
                     (id_ex_rt == if_id_rs2));

    assign pc_write = ~hazard;
    assign if_id_write = ~hazard;
    assign control_stall = hazard;

endmodule
