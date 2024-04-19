
/*
module sem(input logic clk, rst, 
			output logic R1, R2, G1, G2, B1, B2, CLK_MOD, LAT, OE, A, B);
	
	assign R2 = R1;
	assign G1 = 0;
	assign G2 = 0;
 	assign B1 = 0;
	assign B2 = 0;

	//80HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA01010000

	assign OE = 0;
	logic [255:0] temp = 256'HAAAA00000000000000000000000000000000000000000000000000000000000; //128 BITS	
	logic [9:0] conta_bits; //variable para contador de bits	
	contador_pri conta(CLK_MOD, rst, LAT, conta_bits);

	//realizará la función de desplazamiento, REALIZA EL BARRIDO PARA LA ENTRADA DE DATOS
	logic [255:0] dato_R1;
	/*always_ff@(posedge CLK_MOD)
	if(conta_bits==10'd256) dato_R1 <= temp;
	else dato_R1 <= {1'b1,dato_R1[255:1]};
	assign R1 = dato_R1[0];
	Dato_R1 dt_r1(CLK_MOD,temp,conta_bits,dato_R1,R1);
	
	logic [1:0] conta_AB;
	lineas_AB selectsAB(CLK_MOD,conta_bits,conta_AB,A,B);


	//contador dividor, divide la señal para alentar el contador
	logic[3:0] div;
	senial_divisor divisor(clk, CLK_MOD, div);
	
	
endmodule

module senial_divisor(input logic clk,output logic CLK_MOD, output logic[3:0] div);
	
	always_ff@(posedge clk)
	if(div == 4'd10)
	begin
		div <= 0;
		CLK_MOD <= ~CLK_MOD;
	end
	else div <= div+1;	


endmodule

module contador_pri(input logic clk_mod, rst, output logic LAT, output logic[9:0]conta_bts);

	always_ff@(posedge clk_mod, negedge rst)
	if(!rst) conta_bts <= 0;	
	else if(conta_bts == 10'd256)
	begin
		conta_bts <= 256;
		LAT <= 0;
	end
	else
	begin
		conta_bts <= conta_bts + 1;
		LAT <= 1;
	end

endmodule

module Dato_R1(input logic CLK_MOD,input logic [255:0] temp, input logic[9:0] conta_bts, output logic[255:0] dt_r1,
				output logic R1);
	
	always_ff@(posedge CLK_MOD)
	if(conta_bts==10'd256) dt_r1 <= temp;
	else dt_r1 <= {1'b1,dt_r1[255:1]};
	assign R1 = dt_r1[0];

endmodule

module lineas_AB(input logic CLK_MOD,input logic[9:0] conta_bts, output logic[1:0] conta_AB, output logic A, B);

	always_ff@(posedge CLK_MOD)
	if(conta_bts == 10'd256) conta_AB <= conta_AB + 1;
	else conta_AB <= conta_AB;
	assign A = conta_AB[1];
	assign B = conta_AB[0];
	
endmodule


*/


/*
// ESTO ES UNA COPIA DE RESPALDO DEL CÓDIGO POR SI ES QUE ME CONFUNDO ALV XDDD


module sem(input logic clk, rst, 
			output logic R1, R2, G1, G2, B1, B2, CLK_MOD, LAT, OE, A, B);
	
	assign R2 = R1;
	assign G1 = 0;
	assign G2 = 0;
 	assign B1 = 0;
	assign B2 = 0;

	assign OE = 0;
	logic [255:0] temp_r1_f1 = 128'H80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA010011001180AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0100110011; //128 BITS	
	logic [255:0] temp_r1_f2 = 128'H80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA010011001180AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0100110011;
	logic [255:0] temp_r1_f3 = 128'H80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA010011001180AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0100110011;
	logic [255:0] temp_r1_f4 = 128'H80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA010011001180AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0100110011;
	logic [9:0] conta_bits; //variable para contador de bits
	
	//realizará la función de desplazamiento, REALIZA EL BARRIDO PARA LA ENTRADA DE DATOS
	logic [255:0] dato_R1;
	always_ff@(posedge CLK_MOD)
	if(conta_bits==10'd256) dato_R1 <= temp;
	else dato_R1 <= {1,dato_R1[255:1]};
	assign R1 = dato_R1[0];

	always_ff@(posedge CLK_MOD, negedge rst)
	if(!rst) conta_bits<=0;
	else if(conta_bits==10'd256) 
	begin 
		conta_bits <= 0;
		LAT <= 1;
	end
	else 
	begin 
		conta_bits <= conta_bits + 1;
		LAT <= 0;
	end
	
	logic [1:0] conta_AB;
	always_ff@(posedge CLK_MOD)
	if(conta_bits==10'd256) conta_AB <= conta_AB +1;
	else conta_AB <= conta_AB;

	assign A = conta_AB[1];
	assign B = conta_AB[0];

	//contador dividor, divide la señal para alentar el contador
	logic[3:0] div;
	always_ff@(posedge clk)
	if(div ==4'd10) begin
		div <= 0;
		CLK_MOD <= ~CLK_MOD;
	end
	else div<=div+1;
	
	
endmodule
*/
/*

module sem(input logic clk, rst, 
            output logic R1, R2, G1, G2, B1, B2, CLK_MOD, LAT, OE, A, B); 



assign OE = 0;

assign R2 = 0; 
assign G1 = 0; 
assign G2 = 0;
assign B1 = 0;
assign B2 = 0;   
 
logic[255:0]temp = 128'H80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA0101000080AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA01010000; 
logic[9:0]cont_bits; 

logic [255:0] dato_r1; //255
always_ff@(posedge CLK_MOD)
if(cont_bits == 10'd256)dato_r1<=temp; //256
else dato_r1<={1,dato_r1[255:1]}; //concatenacion  //255
assign R1 = dato_r1[0]; //combinacional 

always_ff@(posedge CLK_MOD,negedge rst) 
if (!rst) cont_bits<=0; 
else if(cont_bits == 10'd256) begin cont_bits<=0; LAT<=1; end 
else begin cont_bits<=cont_bits+1; LAT<=0; end

logic[1:0]cont_AB; 
always_ff@(posedge CLK_MOD)
if(cont_bits==10'd256)cont_AB<=cont_AB+1; 
else cont_AB<=cont_AB; 
assign A=cont_AB[1]; 
assign B=cont_AB[0]; 

logic[3:0]div; 
always_ff@(posedge clk)
if(div == 4'd10) begin div<=0; CLK_MOD <= ~CLK_MOD; end
else div<=div+1; 

endmodule
*/

module sem(input logic clk, rst, output logic R1,R2,G1,G2,
B1,B2,CLK_M,LAT,OE,A,B);
	parameter NUM_BITS=191; //2**N-1
 
	logic CLK_MOD;
	assign CLK_M=~CLK_MOD;//&(cont_bits<=NUM_BITS);
	//assign OE=0;//~((cont_bits>18'd200)&&(cont_bits<18'd300));
	//assign R2=0;
	assign G1=0;
	assign G2=0;
	assign B1=0;
	assign B2=0;
	 
	logic [NUM_BITS:0]temp_r1_f1=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	logic [NUM_BITS:0]temp_r1_f2=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	logic [NUM_BITS:0]temp_r1_f3=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	logic [NUM_BITS:0]temp_r1_f4=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	 
	logic [NUM_BITS:0]temp_r2_f1=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	logic [NUM_BITS:0]temp_r2_f2=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	logic [NUM_BITS:0]temp_r2_f3=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	logic [NUM_BITS:0]temp_r2_f4=192'HAAAAAAAAAAAAAAAAaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
	 
	logic [NUM_BITS:0]dato_r1,dato_r2;
	always_ff@(posedge CLK_MOD)
	if(cont_bits==NUM_BITS) 
	begin 
		if(cont_AB==0) 
		begin 
			dato_r1<=temp_r1_f1;
			dato_r2<=temp_r2_f1;
		end
		else if(cont_AB==1)
		begin
			dato_r1<=temp_r1_f2;
			dato_r2<=temp_r2_f2;
		end
		else if(cont_AB==2)
		begin
			dato_r1<=temp_r1_f3;
			dato_r2<=temp_r2_f3;
		end
		else 
		begin
			dato_r1<=temp_r1_f4;
			dato_r2<=temp_r2_f4;
		end
	end
	else
	begin   
		dato_r1<={1'b1,dato_r1[NUM_BITS:1]};
		dato_r2<={1'b1,dato_r2[NUM_BITS:1]};
	end
 
	assign R1=dato_r1[0];
	assign R2=dato_r2[0];
	 
	logic [17:0]cont_bits;  //18 BITS 512KHZ
	always_ff@(posedge CLK_MOD, negedge rst)
	if(!rst) cont_bits<=0;
	else if(cont_bits==NUM_BITS) 
	begin 
		cont_bits<=0; 
		LAT<=1; 
	end
	else 
	begin 
		cont_bits<=cont_bits+1; 
		LAT<=0;
	end
	 
	logic [1:0]cont_AB;
	always_ff@(posedge CLK_MOD)
	if(cont_bits==NUM_BITS) cont_AB<=cont_AB+1; 
	else cont_AB<=cont_AB;
	assign A=cont_AB[1];
	assign B=cont_AB[0];
	 
	 
	logic [3:0]div;
	always_ff@(posedge clk)
	if(div==4'd10)
	begin 
		div<=0;
		CLK_MOD <= ~CLK_MOD;  
	end
	else div<=div+1;
	 
	 
	logic [24:0]unseg;
	always_ff@(posedge clk)
	if(unseg==25'd13500000)
	begin  
		unseg<=0; 
		OE<=~OE; 
	end
	else unseg <= unseg + 1;
	//assign OE=~((cont_bits<18'd10000)&(cont_bits>18'd9500));
 
endmodule