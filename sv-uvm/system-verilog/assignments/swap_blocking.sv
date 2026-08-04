module swap_blocking;

    int a = 10;
    int b = 20;

    initial begin

        a = b;
        b = a;

        $display("a=%0d b=%0d", a, b);

    end

endmodule
