module mini_ip #(parameter WIDTH = 4)(
    input  logic             clk,
    input  logic             rst_n,
    input  logic             d,

    output logic             q,
    output logic [WIDTH-1:0] count
);

    logic en;
    assign en = q;
    //-----------------------------------------
    // D Flip-Flop
    //-----------------------------------------

    dff #(
        .WIDTH(1)
    ) u_dff (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    //-----------------------------------------
    // Counter
    //-----------------------------------------

    register #(
        .WIDTH(WIDTH)
    ) u_register (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .count(count)
    );

endmodule