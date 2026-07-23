module transmissiongate(input a, in, output out);
    wire abar;
    assign abar = ~a;
    pmos (out, abar, in);
    nmos (out, a, in);
endmodule

module testtransgate;
    reg a;
    reg in;
    wire out;
    transmissiongate uut (
        .a(a),
        .in(in),
        .out(out)
    );
    initial begin
        a = 1; in = 0; #100;
        a = 1; in = 1; #100;
    end
endmodule
