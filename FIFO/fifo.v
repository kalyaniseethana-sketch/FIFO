//====================================================
// Synchronous FIFO (8-bit x 8 locations)
//====================================================

module fifo (
    input clk,
    input reset,
    input wr_en,
    input rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

parameter DEPTH = 8;

reg [7:0] mem [0:DEPTH-1];
reg [2:0] wr_ptr;
reg [2:0] rd_ptr;
reg [3:0] count;

// Write Operation
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        wr_ptr <= 0;
    end
    else if(wr_en && !full)
    begin
        mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1;
    end
end

// Read Operation
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        rd_ptr <= 0;
        data_out <= 0;
    end
    else if(rd_en && !empty)
    begin
        data_out <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
    end
end

// Counter
always @(posedge clk or posedge reset)
begin
    if(reset)
        count <= 0;
    else
    begin
        case ({wr_en && !full, rd_en && !empty})
            2'b10: count <= count + 1;
            2'b01: count <= count - 1;
            default: count <= count;
        endcase
    end
end

assign full  = (count == DEPTH);
assign empty = (count == 0);

endmodule