module nonblocking_demo;

    int a, b;

    initial begin
        a = 5;

        b <= a;

        a = 10;

        $display("a=%0d b=%0d", a, b);

        #0;

        $display("After delta: a=%0d b=%0d", a, b);

        //$finish;
    end

endmodule
