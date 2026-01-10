module arith_chain (
	input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [31:0] d,
	input [31:0] e,
	input [31:0] f,
	input [31:0] g,
	input [31:0] h,
	output [40:0] y,
	output [40:0] y1,
	output [40:0] y2,
	output [40:0] y3,
	output [40:0] y4,
	output [40:0] y5,
	output [40:0] y6
);

	// Test case 0: Pure addition (should balance but not transform)
	assign y = a + b + c + d + e + f + g + h;

	// Test case 1: Mixed add/sub (should normalize, balance, denormalize)
	assign y1 = a - b + c - d + e - f + g - h;

	// Test case 2: Alternating pattern
	assign y2 = a + b - c + d - e + f - g + h;

	// Test case 3: Cascaded subtraction (should normalize, balance, denormalize)
	assign y3 = a - b - c - d - e - f - g - h;

	// Test case 4: Paired negations
	assign y4 = a + b - c - d + e + f - g - h;

	// Test case 5: Negated sum (should exercise arith_neg_expansion - step 2)
	assign y5 = -(a + b + c + d + e + f + g + h);

	// Test case 6: Negated mixed expression
	assign y6 = -(a + b + c + d);

endmodule
