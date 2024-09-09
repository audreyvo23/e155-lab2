// Audrey Vo
// avo@hmc.edu
// 9/3/2024
// This code sums the values of 2 4 bit inputs

module sum (input	logic [3:0] s1, [3:0] s2,
	output 	logic [4:0] ledSum
	);
	
	logic [4:0] sum;
	
	always_comb 
	begin
		sum = s1 + s2;
	end
	
	assign ledSum = sum;
	
endmodule