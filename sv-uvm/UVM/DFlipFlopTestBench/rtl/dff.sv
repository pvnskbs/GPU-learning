module dff #(parameter WIDTH = 1) (
    input logic clk,
    input logic rst_n,
    input logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q,
    output logic [WIDTH-1:0] q_bar
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= '0;
            q_bar <= '0;
        end else begin
            q <= d;
            q_bar <= ~d;
        end
    end

endmodule
