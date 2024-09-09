// Audrey Vo
// avo@hmc.edu
// 9/3/2024
// This code drives the 2 LEDs using a single module

module lab2 (input	logic [3:0] s1, [3:0] s2,
	output 	logic [6:0] seg,
	output logic selector1, selector2,
	output logic [4:0] ledDisplay
	);
	
	
	logic int_osc;
	
	
	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	logic [3:0] s = 0;
	
	oscillator s0 (int_osc, selector1, selector2);
	
	mux s4 (s1, s2, selector1, s);
	
	sum s5 (s1, s2, ledDisplay);
	sevenSeg s3 (s, seg);

	
endmodule