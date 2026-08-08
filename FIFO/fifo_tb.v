`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg reset;
reg wr_en;
reg rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

fifo uut(
    .clk(clk),
    .reset(reset),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock generation
always #5 clk = ~clk;

initial
begin

    $dumpfile("fifo.vcd");
    $dumpvars(0,fifo_tb);

    clk = 0;
    reset = 1;
    wr_en = 0;
    rd_en = 0;

    #10 reset = 0;

    // Write data
    wr_en = 1;
    data_in = 8'd10; #10;
    data_in = 8'd20; #10;
    data_in = 8'd30; #10;
    data_in = 8'd40; #10;

    wr_en = 0;

    // Read data
    rd_en = 1;
    #40;

    rd_en = 0;

    #20;

    $finish;

end

initial
begin
    $monitor("Time=%0t WR=%b RD=%b DataIn=%d DataOut=%d Full=%b Empty=%b",
             $time,wr_en,rd_en,data_in,data_out,full,empty);
end

endmodule