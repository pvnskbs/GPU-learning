module blocking_demo;

    int a, b;

    initial begin
        a = 5;
        b = a;
        a = 10;

        $display("a=%0d b=%0d", a, b);
    end

endmodule
