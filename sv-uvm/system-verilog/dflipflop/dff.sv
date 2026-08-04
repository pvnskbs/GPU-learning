module dff;

logic clk;
logic d;
logic q;

always #5 clk <= ~clk;

always_ff @(posedge clk)
begin
    q <= d;
end

initial begin

    clk = 0;
    d = 0;

    #7 d = 1; // 7 units of time

    #10 d = 0; // 17 units of time till now

    #10 d = 1; // 27 units of time till now

    #20 $finish; // 47 units of time till now

end

always @(posedge clk)
    $display("[%0t] d=%0b q=%0b",$time,d,q);

endmodule
