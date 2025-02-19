// Audrey Vo
// avo@hmc.edu
// 9/3/2024
// This code drives the 2 LEDs using a single module

module lab2 (input	logic clk, [3:0] s1, [3:0] s2,
	output 	logic [6:0] seg,
	output logic selector1, selector2,
	output logic [4:0] ledDisplay
	);
	
	
	logic [3:0] s = 0;
	
	logic led_state = 1;
	logic [24:0] counter = 0;
	
	
	// Simple clock divider
	always_ff @(posedge clk)
		begin
			// checks if counter has hit 10M (to get 2.4 Hz signal)
			if(counter != 10000) counter <= counter + 1;
			else if (counter == 10000 & selector1 == 0) 
				begin 
					led_state <= 1;
					counter <= 0;
				end
			else if (counter == 10000 & selector1 == 1) 
				begin 
					led_state <= 0;
					counter <= 0;
				end
		end
	
	// turns led on or off
	assign selector1 = led_state;
	assign selector2 = ~led_state;
	
  	// mux module
	always_comb 
		begin
			case(selector)
				1'b0: 	s = s1;
				1'b1:	s = s2;
			endcase
	end
	
	// sum code 
	logic [4:0] sum;
	
	always_comb 
	begin
		sum = s1 + s2;
	end
	
	assign ledSum = sum;

   	// seven seg display code 
	always_comb 
	begin
		case(s)
			// checks the s input and assigns output to display appropriate values
			4'h0: 	seg = 7'b1000000;
			4'h1:	seg = 7'b1111001;
			4'h2: 	seg = 7'b0100100;
			4'h3: 	seg = 7'b0110000;
			4'h4:	seg = 7'b0011001;
			4'h5: 	seg = 7'b0010010;
			4'h6: 	seg = 7'b0000010;
			4'h7:	seg = 7'b1111000;
			4'h8: 	seg = 7'b0000000;
			4'h9: 	seg = 7'b0011000;
			4'ha:	seg = 7'b0001000;
			4'hb: 	seg = 7'b0000011;
			4'hc: 	seg = 7'b1000110;
			4'hd: 	seg = 7'b0100001;
			4'he:	seg = 7'b0000110;
			4'hf: 	seg = 7'b0001110;
		endcase
	end

	
endmodule

`timescale 1ns/1ns
`default_nettype none
`define N_TV 16

module lab2_tb();
 // Set up test signals
 logic clk, reset;
 logic [3:0] s1, [3:0] s2, selector1, selector2, [4:0] ledDisplay, [6:0] seg, [6:0] seg_expected, [2:0] ledDisplay_expected;
 logic [31:0] vectornum, errors;
 logic [13:0] testvectors[10000:0]; // Vectors of format s[3:0]_seg[6:0]


 // Instantiate the device under test
 lab2 dut(.s1(s1), .s2(s2), .selector1(selector1), .selector2(selector2), .ledDisplay(ledDisplay), .seg(seg));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end
  
 // At the start of the simulation:
 //  - Load the testvectors
 //  - Pulse the reset line (if applicable)
 initial
   begin
	if 
   end
endmodule