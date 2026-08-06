interface dff_if (input bit clk, input bit rst_n);
    logic d;
    logic q;
    logic q_bar;

    modport dut_mp (input clk, rst_n, d, output q, q_bar);
    modport tb_mp  (output clk, rst_n, d, input q, q_bar);

    clocking drv_cb @(posedge clk);
        default input #1step output #0;
        output d;
        input q, q_bar;
        input rst_n;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1step;
        input d;
        input q, q_bar;
        input rst_n;
    endclocking
    
endinterface
