module test_GF_Multiplier;

logic [2:0] c;
logic [2:0] a,b;
logic reset, clock;
integer i; 
integer j;

GF_Multiplier uut (.*);

initial begin
	clock = 1'b1;
	a = 3'b0;
	b = 3'b0;
	forever #5 clock = ~clock;
end

initial begin

	reset = 1'b0;
	#10 reset = 1'b1;
	for (i=7; i>=0; i--) begin
		for (j=7; j>=0; j--) begin
			repeat (4) @(posedge clock); 
//repeat delays the next input by 4 cycles as the systems needs to settle down to generate output "c"
			a = i;
			b = j;

		end
	end
end
endmodule	