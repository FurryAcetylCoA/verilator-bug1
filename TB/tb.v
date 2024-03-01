`timescale 1ns/1ns
module tb();

reg clock, reset;
TOP dut(.clock(clock), .reset(reset));

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


endmodule 
