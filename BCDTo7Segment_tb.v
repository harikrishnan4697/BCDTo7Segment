module BCDTo7Segment_tb;

// Timescale definition
`timescale 1ns/100ps

// Test bench signals clock reset and a 4 bit bcd
reg clock;
reg reset;
reg [3:0] bcd;

// DUT output signals
wire [6:0] segment;

// Device Under Test
BCDTo7Segment bcdTo7Segment_dut (
	.clock(clock),
	.reset(reset),
	.bcd(bcdIn),
	.segment(segmentOut)
);

//test bench logic
initial begin
//Initialising the test by display the simulation started and sending the reset signal and after couple of cycles it is stoped and displaying the task is Complete
	$display("%d ns\tSimulation Started",$time);
	reset = 1'b0;
	repeat(2) @(posedge clock);
    reset = 1'b0;
    $display("%d ns\tInitialisation Complete",$time);
end

// Clock set to 0
initial begin
	clock = 1'b0;
	clock = ~clock
end

//testing by giving the bcd input and waiting 10 cycles between the inputs
initial begin
	#10;
	bcd = 4'b0001;
	#10
	bcd = 4'b0110;
end
endmodule