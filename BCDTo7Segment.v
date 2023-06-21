module BCDTo7Segment #(
	parameter N = 4)(
	/*Declaring the input and output port with clock, reset and n-bit bcd as input and 7 segment as output
	*/
	input clock,
	input reset,
	input [N-1:0] bcdIn,
	output reg [6:0] segmentOut
);
	/*Declaring new variable bcd_reg as a register and looking for clock signal using the if else if the reset signal is passed
	*the bcd_reg will be 0 otherwise it is gonna be bcd input
	*/
	reg [N-1:0] bcd_reg;

	always @(posedge clock or posedge reset)
	begin
		if (reset) begin
			bcd_reg <= 0;
		end else begin
			bcd_reg <= bcdIn;
        end
		case(bcd_reg)
		// BCD to 7-segment mapping with the case and the output is from 0 to 9 and the default one as it not displaying anything
			4'b0000: segmentOut = 7'b1111110;
			4'b0001: segmentOut = 7'b0110000;
			4'b0010: segmentOut = 7'b1101101;
			4'b0011: segmentOut = 7'b1111001;
			4'b0100: segmentOut = 7'b0110011;
			4'b0101: segmentOut = 7'b1011011;
			4'b0110: segmentOut = 7'b1011111;
			4'b0111: segmentOut = 7'b1110000;
			4'b1000: segmentOut = 7'b1111111;
			4'b1001: segmentOut = 7'b1111011;
			default: segmentOut = 7'b0000000;
		endcase
	end
endmodule