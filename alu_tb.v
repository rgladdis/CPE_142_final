module alu_tb;
    reg clkt, rstt;
    reg [15:0] inpt;
	wire [15:0] outt;
    
    alu t1(clkt, rstt, inpt, outt);
    
    initial begin
		// Initialization of input and the monitor
		$display("\n");
		$monitor($time, " ns \nopcode = %b\nop1 = %b, op2 = %b\nfunct. code = %b\nout (hex) = %h\n\n", inpt[15:12], inpt[11:8], inpt[7:4], inpt[3:0], outt);  	// time, opcode, op1, op2, function code, out
        inpt[15:14] = 2'b00;			// opcode (type decider)
		inpt[13:12] = 2'b00;			// opcode (identifier for types: B, C, & D)
        inpt[11:8] = 4'b0000;			// op1
		inpt[7:4] = 4'b0000;			// op2
		inpt[3:0] = 4'b0000;			// function code
        rstt = 0;						// default reset state
        clkt = 0;						// placeholder clock
		
		// Begin testing Type: A, Function: 1111 (Addition)
		#10
		$display("    testing A");
		$display("------------------\n");
        inpt[15:14] = 2'b00;			// opcode (type decider)
		inpt[13:12] = 2'b00;			// opcode (identifier for types: B, C, & D)
        inpt[11:8] = 4'b1000;			// op1
		inpt[7:4] = 4'b0001;			// op2
		inpt[3:0] = 4'b1111;			// function code
        rstt = 0;						// default reset state
        clkt = 0;						// placeholder clock
		
		// Begin testing Type: A, Function: 1110 (Subtraction)
		#15
		inpt[3:0] = 4'b1110;			// function code
		
		// Begin testing Type: A, Function: 1101 (And)
		#10
		inpt[3:0] = 4'b1101;			// function code
		
		// Begin testing Type: A, Function: 1100 (Or)
		#10
		inpt[3:0] = 4'b1100;			// function code
		
		// Begin testing Type: A, Function: 0001 (Multiplication)
		#10
		inpt[3:0] = 4'b0001;			// function code
		
		// Begin testing Type: A, Function: 0010 (Division)
		#10
		inpt[3:0] = 4'b0010;			// function code
		
		// Begin testing Type: A, Function: 0010 (Logical Shift Left)
		#10
		inpt[3:0] = 4'b1010;			// function code
		
		// Begin testing Type: A, Function: 0010 (Logical Shift Right)
		#10
		inpt[3:0] = 4'b1011;			// function code
		
		// Begin testing Type: A, Function: 0010 (Rotate Left)
		#10
		inpt[3:0] = 4'b1000;			// function code
		
		// Begin testing Type: A, Function: 0010 (Rotate Right)
		#10
		inpt[3:0] = 4'b1001;			// function code
		
		
		
		
		
		
    end
	
	
    initial #250 $finish;
	
    always #5 clkt = ~clkt;
endmodule