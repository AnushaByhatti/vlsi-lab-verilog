// Up Counter
module upcounter(input reset, clk, output reg [3:0] count);
    always @(posedge clk)
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1;
endmodule

// Down Counter
module downcounter(input reset, clk, output reg [3:0] count);
    always @(posedge clk)
        if (reset)
            count <= 4'b1111;
        else
            count <= count - 1;
endmodule

// Synchronous Up-Down Counter
module updowncount(input up_down, clk, rst, output reg [3:0] cnt);
    always @(posedge clk)
        if (rst == 0)
            cnt <= 4'b0;
        else if (up_down == 1)
            cnt <= cnt + 1;
        else
            cnt <= cnt - 1;
endmodule

module testupdowncont;
    reg up_down;
    reg clk;
    reg rst;
    wire [3:0] cnt;
    initial
        clk = 1'b0;
    always
        #30 clk = ~clk;
    updowncount uut (
        .up_down(up_down),
        .clk(clk),
        .rst(rst),
        .cnt(cnt)
    );
    initial begin
        #100 rst = 1'b0;
        #100 rst = 1'b1;
        up_down = 0;
        clk = 1;
        rst = 1;
        #100;
    end
endmodule
