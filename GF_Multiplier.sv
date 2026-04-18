module GF_Multiplier (output logic [2:0] c, input logic [2:0] a,b, input logic reset, clock);

logic [4:0] x4 = 5'b10110;
logic [4:0] x3 = 5'b01011;

logic [4:0] result_c, inter_c1, inter_c2;

always_ff @(posedge clock or negedge reset) 
begin
    if (~reset) begin
    c [2:0] <= 3'b0;
    result_c <= 4'b0;
    inter_c1 <= 4'b0;
    inter_c2 <= 4'b0;
    end
    
    else begin
        inter_c1 <= {a * b[0] ^ {a * b[1], 1'b0} ^ {a * b[2], 2'b0}}; //XOR of the three multiplication resutls for bitwise product of a &

        if (inter_c1[4]) //replacing x^4 with reduction from Irreducible polynomail
            inter_c2 <= inter_c1 ^ x4;
	else inter_c2 <= inter_c1;
        if (inter_c2[3]) //replacing x^3 with reduction from Irreducible polynomail
            result_c <= inter_c2 ^ x3;
	else result_c <= inter_c2;

	c <= result_c[2:0];    

    end 
end

endmodule