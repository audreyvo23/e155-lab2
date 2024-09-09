// Audrey Vo
// avo@hmc.edu
// 9/3/2024
// This code is a 2 bit mux.
module mux (input logic [3:0] s1, s2,
					input logic selector,
					output logic [3:0] s);
					
	always_comb 
		begin
			case(selector)
				1'b0: 	s = s1;
				1'b1:	s = s2;
			endcase
	end
	
	//assign s = int_osc? s1 : s2;

endmodule