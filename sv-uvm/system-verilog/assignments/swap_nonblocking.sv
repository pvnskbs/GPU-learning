module swap_nonblocking;

    int a = 10;
    int b = 20;

    initial begin

        a <= b;
        b <= a;

        #0;

        $display("a=%0d b=%0d", a, b);

    end

endmodule
