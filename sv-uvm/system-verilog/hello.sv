/*
* To execute this using verilator binary, 
* use this command on the terminal
* $ verilator --binary -j 1 -Wall hello.sv
* $ obj_dir/Vhello
*/
module hello;
initial begin
$display("Hello World\nAllocated 1 thread\n");
end
endmodule
