# verilator --binary --trace -j 1 -Wall inverter.sv 
module inverter;

logic clk=0;
//logic d=0;
logic q=0;

always #1 clk <= ~clk;

always_ff @(posedge clk)
begin
    q <= ~q;
end

initial begin
    #20 $finish; // 47 units of time till now

end
initial begin
    $dumpfile("sim_dump.vcd"); // Name of the output file
    $dumpvars(0, inverter);
end
always @(posedge clk)
    $display("[%0t] q=%0b",$time,q);

endmodule
