module CPU(	
  input  wire        clock,	
  input  wire        cpu_reset	
);

  reg         reset_r;	
  
  always @(posedge clock) begin	
    reset_r <= cpu_reset;	
  end 
  
endmodule

module TOP(
  input         clock,
                reset
);
  reg sync_0, sync_1, sync_2;	
  wire _cpu_reset_chain_io_q = sync_0;	

  CPU cpu (	
    .clock(clock),
    .cpu_reset(_cpu_reset_chain_io_q | reset) 
  );

  always @(posedge clock) begin
    sync_0 <= sync_1;	
    sync_1 <= sync_2;
    sync_2 <= reset;	
  end
  

 
endmodule

    

