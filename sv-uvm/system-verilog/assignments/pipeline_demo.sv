module pipeline_demo;

    logic clk = 0;
    logic a = 1;
    logic b = 0;

    always #5 clk = ~clk;

    always @(posedge clk) begin
        a <= b;
        b <= a;

        $display("[%0t] a=%0b b=%0b", $time, a, b);
    end

    initial #30 $finish;

endmodule
