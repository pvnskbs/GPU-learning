class Protocol;
  bit [31:0] addr;
  bit [31:0] data;
  
  function new (bit [31:0] addr = 32'h7ff07ff0, bit [31:0] data = 32'hdeadbeef);
    this.addr = addr;
    this.data = data;
  endfunction
  
  function void display();
    $display("Protocol Address = 0x%0h, Data = 0x%0h", this.addr, this.data);
  endfunction
endclass

class AMBA_Protocol extends Protocol;
  bit [1:0] enable;
  bit rstn;
  
  function new (bit [31:0] addr = 32'h76547654, bit [31:0] data = 32'hdeadface, enable = 2'h1, rstn = 1'h0);
    super.new(addr, data);
    this.enable = enable;
    this.rstn = rstn;
  endfunction
  
  function void display();
    $display("AMBA Protocol Address = 0x%0h, Data = 0x%0h, Enable = 0x%0h, RST = 0x%0h", this.addr, this.data, this.enable, this.rstn);
  endfunction
endclass

module ProtocolTestBench;
  Protocol base_protocol;
  AMBA_Protocol amba_protocol, amba_protocol1;
  
  initial begin
    base_protocol = new();
    base_protocol.display();
    
    amba_protocol = new();
    amba_protocol.display();
    
    amba_protocol1 = new(32'h80008000, 32'hbeefface, 2'h0, 1'h1);
    amba_protocol1.display();
  end
endmodule
