interface mini_ip_if #(parameter WIDTH = 4)(
    input logic clk,
    input logic rst_n
);

    //--------------------------------------------------
    // DUT Signals
    //--------------------------------------------------

    logic d;

    logic q;

    logic [WIDTH-1:0] count;

    //--------------------------------------------------
    // Driver Clocking Block
    //--------------------------------------------------

    clocking drv_cb @(posedge clk);

        default input #1step output #0;

        output d;

        input rst_n;

    endclocking

    //--------------------------------------------------
    // Monitor Clocking Block
    //--------------------------------------------------

    clocking mon_cb @(posedge clk);

        default input #1step;

        input d;

        input q;

        input count;

        input rst_n;

    endclocking

    //--------------------------------------------------
    // DUT Modport
    //--------------------------------------------------

    modport dut_mp(

        input clk,
        input rst_n,
        input d,

        output q,
        output count

    );

    //--------------------------------------------------
    // Testbench Modport
    //--------------------------------------------------

    modport tb_mp(

        clocking drv_cb,

        clocking mon_cb

    );

endinterface