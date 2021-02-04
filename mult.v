module mult (a, b, prod, start);

input [15:0] a, b;	//definojm inputat dhe outputat
input start;
output [15:0] prod;

reg [15:0] prod;
reg [15:0] b_reg;
reg [15:0] count;

always @ (posedge start)
begin
b_reg = b;
prod = 0;
count = 15'b1111;
if ((a!=0) && (b!=0))
while (count)
    begin
    prod = {(({15{b_reg[0]}} & a) + prod[15:8]),
    prod[7:1]};
    b_reg = b_reg >> 1;
    count = count - 1;
    end
end
endmodule