module alu (clk, rst, inp, out);
    input clk, rst;
    input [15:0] inp;
	output reg [15:0] out;
   
/* This part of the code is responsible for 
helping guide your input to the correct 
part of the ALU and help visualize where 
it goes */
   
    always @ (negedge clk) begin
	
        if (inp[15:14] == 0) aluA(inp, out);
		
        else if (inp[15:14] == 1) aluB(inp, out);
        
        else if (inp[15:14] == 2) aluC(inp, out);
        
        else if (inp[15:14] == 3) aluD(inp, out);
        
        else out = 16'hFFFF;
		
    end

// This is the ALU branch of type A
	
	task aluA;
		input [15:0] in;
		output [15:0] out;
		integer times;
		
		begin
			out = 16'h0000;
			case (in[3:0])
				4'b1111	: 	out[11:8] = in[11:8] + in[7:4];
				4'b1110	: 	out[11:8] = in[11:8] - in[7:4];
				4'b1101	: 	out[11:8] = in[11:8] & in[7:4];
				4'b1100	: 	out[11:8] = in[11:8] | in[7:4];
				4'b0001	: 	out[15:8] = in[11:8] * in[7:4];
				4'b0010	: 	begin
								out[11:8] = in[11:8] / in[7:4];
								out[15:12] = in[11:8] % in[7:4];
							end
				4'b1010	: 	out[15:8] = in[11:8] << in[7:4];
				4'b1011	: 	out[15:8] = in[11:8] >> in[7:4];
				4'b1000	: 	begin
								for (times = in[7:4]; times >= 0; times = times - 1) begin
									in[11:8] = {in[10:8] + in[11]};
								end
								out[11:8] = in[11:8];
							end
				4'b1001	: 	begin
								for (times = in[7:4]; times >= 0; times = times - 1) begin
									in[11:8] = {in[8] + in[11:9]};
								end
								out[11:8] = in[11:8];
							end				
				default	: out = 16'hAFFF;
			endcase
		end
	
	
	endtask
	
// This is the ALU branch of type B
	
	task aluB;
		input [15:0] in;
		output [15:0] out;
		
		begin
			out = 16'hBBBB;
		end
	
	
	endtask
	
// This is the ALU branch of type C
	
	task aluC;
		input [15:0] in;
		output [15:0] out;
		
		begin
			out = 16'hCCCC;
		end
	
	
	endtask
	
// This is the ALU branch of type D
	
	task aluD;
		input [15:0] in;
		output [15:0] out;
		
		begin
			out = 16'hDDDD;
		end
	
	
	endtask

endmodule