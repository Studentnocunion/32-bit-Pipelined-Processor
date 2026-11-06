
module pipeline_flush_unit (
    input wire branch_taken,
    input wire jump,

    output wire if_id_flush,
    output wire id_ex_flush
);

    wire flush;

    assign flush = branch_taken || jump;

    assign if_id_flush = flush;
    assign id_ex_flush = flush;

endmodule
