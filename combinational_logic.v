// Inverter
module inverter(input a, output y);
    supply1 vdd;
    supply0 gnd;
    pmos (y, vdd, a);
    nmos (y, gnd, a);
endmodule

module testinverter;
    reg a;
    wire y;
    inverter uut (.a(a), .y(y));
    initial begin
        a = 0; #100;
        a = 1; #100;
    end
endmodule

// NAND Gate
module nandgate(input a, b, output y);
    supply1 vdd;
    supply0 gnd;
    pmos p1(y, vdd, a);
    pmos p2(y, vdd, b);
    nmos n1(y, s, a);
    nmos n2(s, gnd, b);
endmodule

module testnand;
    reg a, b;
    wire y;
    nandgate uut (.a(a), .b(b), .y(y));
    initial begin
        a = 0; b = 0; #100;
        a = 0; b = 1; #100;
        a = 1; b = 0; #100;
        a = 1; b = 1; #100;
    end
endmodule

// AND Gate
module andgate(input a, b, output y, inout vin);
    supply1 vdd;
    supply0 gnd;
    pmos p1(vin, vdd, a);
    pmos p2(vin, vdd, b);
    nmos n1(vin, s, a);
    nmos n2(s, gnd, b);
    pmos p3(y, vdd, vin);
    nmos n3(y, gnd, vin);
endmodule

module testandgate;
    reg a, b;
    wire y, vin;
    andgate uut (.a(a), .b(b), .y(y), .vin(vin));
    initial begin
        a = 0; b = 0; #100;
        a = 0; b = 1; #100;
        a = 1; b = 0; #100;
        a = 1; b = 1; #100;
    end
endmodule

// OR Gate
module orgate(input a, b, output y, inout vin);
    supply1 vdd;
    supply0 gnd;
    pmos p1(d, vdd, a);
    pmos p2(vin, d, b);
    nmos n1(vin, gnd, a);
    nmos n2(vin, gnd, b);
    pmos p3(y, vdd, vin);
    nmos n3(y, gnd, vin);
endmodule

module testorgate;
    reg a, b;
    wire y, vin;
    orgate uut (.a(a), .b(b), .y(y), .vin(vin));
    initial begin
        a = 0; b = 0; #100;
        a = 0; b = 1; #100;
        a = 1; b = 0; #100;
        a = 1; b = 1; #100;
    end
endmodule

// XNOR Gate
module xnorgate(input a, b, output x);
    wire p, q, s, d1, d2;
    supply1 vdd;
    supply0 gnd;
    assign p = ~a;
    assign q = ~b;
    pmos p1(s, vdd, p);
    pmos p2(x, s, a);
    pmos p3(s, vdd, b);
    pmos p4(x, s, q);
    nmos n1(x, d1, p);
    nmos n2(d1, gnd, b);
    nmos n3(x, d2, a);
    nmos n4(d2, gnd, q);
endmodule

// Half Adder
module halfadder(input a, b, output sum, carry);
    assign sum = (a ^ b);
    assign carry = (a & b);
endmodule

// Full Adder
module fulladder(input a, b, c, output sum, carry);
    assign sum = (a ^ b ^ c);
    assign carry = (a & b) | (b & c) | (c & a);
endmodule
