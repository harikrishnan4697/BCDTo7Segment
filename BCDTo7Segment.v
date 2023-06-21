module BCDTo7Segment #(
	parameter n = 4)(
	/*Declaring the input and output port with clock, reset and n-bit bcd as input and 7 segment as output
	*/
	input clock,
	input reset,
	input [n-1:0] bcd,
	output reg [6:0] segment
);
	/*Declaring new variable bcd_reg as a register and looking for clock signal using the if else if the reset signal is passed
	*the bcd_reg will be 0 otherwise it is gonna be bcd input
	*/
	reg [n-1:0] bcd_reg;

	always @(posedge clock or posedge reset)
	begin
		if (reset)
			bcd_reg <= 0;
		else
			bcd_reg <= bcd;
        
		case(bcd_reg)
		// BCD to 7-segment mapping with the case and the output is from 0 to 9 and the default one as it not displaying anything
			4'b0000: segment = 7'b1111110;
			4'b0001: segment = 7'b0110000;
			4'b0010: segment = 7'b1101101;
			4'b0011: segment = 7'b1111001;
			4'b0100: segment = 7'b0110011;
			4'b0101: segment = 7'b1011011;
			4'b0110: segment = 7'b1011111;
			4'b0111: segment = 7'b1110000;
			4'b1000: segment = 7'b1111111;
			4'b1001: segment = 7'b1111011;
			default: segment = 7'b0000000;
		endcase
	end
endmodule