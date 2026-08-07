interface register_if (input bit clk, input bit rst_n, input bit en);
    logic [3:0] count;

    modport dut_mp (input clk, rst_n, en, output count);
    modport tb_mp  (output clk, rst_n, en, input count);

    clocking drv_cb @(posedge clk);
        default input #1step output #0;
        output en;
        input rst_n, count;
    endclocking

    clocking mon_cb @(posedge clk);
        default input #1step;
        input count;
        input rst_n, en;
    endclocking
    
endinterface
