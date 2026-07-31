class Packet;
  int count;
  
  function new (int count = 0);
    this.count = count;
  endfunction
  
  function void display();
    $display("Packet Count = %0d", this.count);
  endfunction
endclass

module PacketTestBench;
  Packet pkt, pkt_alias, pkt_copy;
  
  initial begin
    pkt=new(5);
    pkt_alias = pkt;
    pkt_copy=new(5);
    
    pkt.display(); pkt_alias.display();pkt_copy.display();
    
    pkt.count=99;
    $display("\n");
    pkt.display(); pkt_alias.display();pkt_copy.display();
  end
endmodule
