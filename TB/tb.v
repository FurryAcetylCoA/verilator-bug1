`timescale 1ns/1ns
module tb();

reg clock, reset;
TOP top(.clock(clock), .reset(reset));

initial begin
    reset <= 'b1;
    clock <= 'b1;
    #1
    clock <= 'b0;
    #1
    clock <= 'b1;
    #1
    clock <= 'b0;
    #1
    clock <= 'b1;
    #1
    clock <= 'b0;
    #1
    reset <= 'b0;
    clock <= 'b1;
    #1
    clock <= 'b0;
    #1
    clock <= 'b1;
    #1
    clock <= 'b0;
    #1
        clock <= 'b1;
    #1
    clock <= 'b0;
    #1
        clock <= 'b1;
    #1
    clock <= 'b0;
    #1
    clock <= 'b1;
    #1
    clock <= 'b0;
   
end
initial begin
      $dumpfile("icarus_dump.vcd");
      $dumpvars(0,top);
end

endmodule 
