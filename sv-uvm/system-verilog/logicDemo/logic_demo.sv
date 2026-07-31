module logic_demo;
    logic a;
    logic [3:0] b;

    initial begin
        $display("Initial hex values of logic variables");
        $display("a=0x%0h, b=0x%0h", a, b);
        $display("Initial binary values of logic variables");
        $display("a=%b, b=%b", a, b);

        $display("Now assigning values");
        a = 1'h1;
        b = 4'hf;
        $display("a=0x%0h, b=0x%0h", a, b);
        $display("Binary values too....");
        $display("a=%b, b=%b", a, b);
    end
endmodule
