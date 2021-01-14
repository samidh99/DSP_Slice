`timescale 1ns / 1ps

module FPMult_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] result;
	wire [4:0] flags;
	
	integer i ;

	// Instantiate the Unit Under Test (UUT)
	FPMult_reduced uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.result(result), 
		.flags(flags)
	);

	always begin
		#5 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		a = 0;
		a = 0;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here

		// TEST #1
		// -6.55504723008 + 0.156205364091 = -1.02393353921
		// Expected Z =   10111111100000110001000001000001
		//						10111111100000110001000001000010
		#10 a = 32'b11000000110100011100001011110010; b = 32'b00111110000111111111010001001101; $display("%b", result);

		// TEST #2
		// 3.0960619702 + 8.77542136981 = 27.1692483755
		// Expected Z =   01000001110110010101101010011111
		// 					01000001110110010101101010011111
		#10 a = 32'b0_1000_0000_10001100010010111100001; b = 32'b0_1000_0010_00011000110100000100000; $display("%b", result);
		
		// TEST #3
		// 8.72801516902 + 8.66712318573 = 75.6467826368
		// Expected Z =   01000010100101110100101100100111
		//						01000010100101110100101100100111
		#10 a = 32'b01000001000010111010010111110011; b = 32'b01000001000010101010110010001001; $display("%b", result);
		// TEST #4
		// -3.92298069694 - 1.38250350354 = -5.42353455784
		// Expected Z = 11000000101011011000110110011000
		#10 a = 32'b11000000011110110001001000011110; b = 32'b00111111101100001111010111100000; $display("%b", result);
		// TEST #5
		// 3.92420946435 - 0.852892795309 = 3.34692997943
		// Expected Z = 01000000010101100011010000011010
		#10 a = 32'b01000000011110110010011000111111; b = 32'b00111111010110100101011100101111; $display("%b", result);
		// TEST #6
		// -3.65982412483 + 1.64573535265 = -6.02310194671
		// Expected Z = 11000000110000001011110101000000
		#10 a = 32'b11000000011010100011101010001111; b = 32'b00111111110100101010011101110101; $display("%b", result);
		// TEST #7
		// 4.37288448465 + 4.75615002457 = 20.7980946491
		// Expected Z = 01000001101001100110001001111111
		#10 a = 32'b01000000100010111110111010101011; b = 32'b01000000100110000011001001100010; $display("%b", result);
		// TEST #8
		// 6.6687684133 - -4.80960037793 = -32.074111081
		// Expected Z = 01000010000000000100101111100100
		#10 a = 32'b01000000110101010110011010001101; b = 32'b11000000100110011110100000111111; $display("%b", result);
		// TEST #9
		// 2.1624545611 - 1.72175603989 = 3.72321920156
		// Expected Z = 01000000011011100100100100111001
		#10 a = 32'b01000000000010100110010110101000; b = 32'b00111111110111000110001010000000; $display("%b", result);
		// TEST #10
		// 1.21525685799 - -1.69553124072 = -2.06050596822
		// Expected Z = 01000000000000111101111101010100
		#10 a = 32'b00111111100110111000110110001001; b = 32'b10111111110110010000011100101011; $display("%b", result);


		for(i=0; i<=20; i=i+1) begin
			#10 $display("%b", result); 
		end 

		#100 

		#10 $finish; 

	end
      
endmodule