// SR Flip-Flop
module srff(sr, clk, reset, q, qb);
    input [1:0] sr;
    input clk, reset;
    output q, qb;
    reg q, qb;
    always @(posedge clk)
        if (reset)
        begin
            q = 1'b0;
            qb = ~q;
        end
        else
        begin
            case(sr)
                2'd0: q = q;
                2'd1: q = 1'b0;
                2'd2: q = 1'b1;
                2'd3: q = 1'bz;
            endcase
            qb = ~q;
        end
endmodule

module testsrff;
    reg [1:0] sr;
    reg clk;
    reg reset;
    wire q;
    wire qb;
    srff uut (
        .sr(sr),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qb(qb)
    );
    initial begin
        sr = 2'b00; clk = 0; reset = 0; #100;
        sr = 2'b00; clk = 1; reset = 1; #100;
        sr = 2'b01; clk = 0; reset = 0; #100;
        sr = 2'b01; clk = 1; reset = 0; #100;
        sr = 2'b10; clk = 0; reset = 0; #100;
        sr = 2'b10; clk = 1; reset = 0; #100;
        sr = 2'b11; clk = 0; reset = 0; #100;
        sr = 2'b11; clk = 1; reset = 0; #100;
    end
endmodule

// D Flip-Flop
module dflip(input d, clk, output q, qb);
    reg q, qb;
    always @(posedge(clk))
    begin
        if (d == 0)
            q = 0;
        else
            q = 1;
        qb = ~q;
    end
endmodule

module tdff;
    reg d;
    reg clk;
    wire q;
    wire qb;
    dflip uut (
        .d(d), .clk(clk), .q(q), .qb(qb)
    );
    initial begin
        d = 0; clk = 0; #100;
        d = 0; clk = 1; #100;
        d = 1; clk = 0; #100;
        d = 1; clk = 1; #100;
    end
endmodule

// T Flip-Flop
module tflip(input t, clk, output q, qb);
    reg q, qb;
    initial begin
        q = 0;
        qb = 1;
    end
    always @(posedge(clk))
    begin
        if (t == 0)
            q = qb;
        qb = ~q;
    end
endmodule

module testtflipf;
    reg t;
    reg clk;
    wire q;
    wire qb;
    tflip uut (.t(t), .clk(clk), .q(q), .qb(qb));
    initial begin
        t = 0; clk = 0; #100;
        t = 0; clk = 1; #100;
        t = 1; clk = 0; #100;
        t = 1; clk = 1; #100;
    end
endmodule

// JK Flip-Flop
module jkff(input j, k, clk, output q, qb);
    reg q, qb;
    initial begin
        q = 0;
        qb = 1;
    end
    always @(posedge (clk))
    begin
        if (j == 0 && k == 0)
            q = q;
        else if (j == 0 && k == 1)
            q = 0;
        else if (j == 1 && k == 0)
            q = 1;
        else
            q = qb;
        qb = ~q;
    end
endmodule

module test1jkff;
    reg j;
    reg k;
    reg clk;
    wire q;
    wire qb;
    jkff uut (.j(j), .k(k), .clk(clk), .q(q), .qb(qb));
    initial begin
        j = 0; k = 0; clk = 0; #100;
        j = 0; k = 0; clk = 1; #100;
        j = 0; k = 1; clk = 0; #100;
        j = 0; k = 1; clk = 1; #100;
        j = 1; k = 0; clk = 0; #100;
        j = 1; k = 0; clk = 1; #100;
        j = 1; k = 1; clk = 0; #100;
        j = 1; k = 1; clk = 1; #100;
    end
endmodule
