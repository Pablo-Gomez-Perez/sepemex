
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

module semfsm(input logic clk, rst,rx,
				output logic A,B,R1,R2,G1,G2,B1,B2,CLK_M,LAT,OE,tx);
	
	parameter s0=0,s1=1,s2=2,s3=3;
	parameter NUM_MOD=3;
	parameter PIX_MOD=64;
	parameter NUM_BITS=NUM_MOD*PIX_MOD;
	assign A=conta_AB[1];
	assign B=conta_AB[0];
	//assign CLK_M=
	logic [1:0]conta_AB;
	logic [15:0]conta;//16bits 5 000
	logic salida;
	logic [9:0]pwm;
 
	always_ff@(posedge CLK_INT)
	if(!rst) conta<=0;
	else if(conta==16'd5000) 
	begin 
		conta<=0;
		conta_AB<=conta_AB+1;
	end
	else conta<=conta+1;
 
	always_ff@(posedge CLK_INT)
	if(conta==NUM_BITS) LAT<=1;
	else LAT<=0;
 
	assign pwm=10'd3000;
	assign OE=~((conta>NUM_BITS+1)&(conta<NUM_BITS+pwm));
 
	assign CLK_M=~(CLK_INT&(conta<NUM_BITS));
 
	logic CLK_INT;
	logic [4:0]div;
	always_ff@(posedge clk)
	if(div==5'd10) 
	begin 
		CLK_INT<=~CLK_INT; div<=0; 
	end
	else
    begin 
		div<=div+1;
        CLK_INT<=CLK_INT;
	end
 
	logic [NUM_BITS:0]temp_r1_f1=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_r1_f2=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_r1_f3=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_r1_f4=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	 
	logic [NUM_BITS:0]temp_g1_f1=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_g1_f2=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_g1_f3=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_g1_f4=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	 
	logic [NUM_BITS:0]temp_b1_f1=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_b1_f2=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_b1_f3=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_b1_f4=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	 
	logic [NUM_BITS:0]temp_r2_f1=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_r2_f2=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_r2_f3=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_r2_f4=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	 
	logic [NUM_BITS:0]temp_g2_f1=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_g2_f2=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_g2_f3=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_g2_f4=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	 
	logic [NUM_BITS:0]temp_b2_f1=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_b2_f2=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_b2_f3=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
	logic [NUM_BITS:0]temp_b2_f4=192'HFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
 
 
	logic [NUM_BITS:0]dato_r1,dato_r2;
	logic [NUM_BITS:0]dato_g1,dato_g2;
	logic [NUM_BITS:0]dato_b1,dato_b2;
	always_ff@(posedge CLK_INT)
	if(conta==16'd5000) 
	begin 
		if(conta_AB==0) 
		begin 
			dato_r1<=temp_r1_f1;
			dato_r2<=temp_r2_f1;
			dato_g1<=temp_g1_f1;
			dato_g2<=temp_g2_f1;
			dato_b1<=temp_b1_f1;
			dato_b2<=temp_b2_f1;
		end
		else if(conta_AB==1)
		begin
			dato_r1<=temp_r1_f2;
			dato_r2<=temp_r2_f2;
			dato_g1<=temp_g1_f2;
			dato_g2<=temp_g2_f2;
			dato_b1<=temp_b1_f2;
			dato_b2<=temp_b2_f2;
		end
		else if(conta_AB==2)
		begin
			dato_r1<=temp_r1_f3;
			dato_r2<=temp_r2_f3;
			dato_g1<=temp_g1_f3;
			dato_g2<=temp_g2_f3;
			dato_b1<=temp_b1_f3;
			dato_b2<=temp_b2_f3;
		end
		else 
		begin
			dato_r1<=temp_r1_f4;
			dato_r2<=temp_r2_f4;
			dato_g1<=temp_g1_f4;
			dato_g2<=temp_g2_f4;
			dato_b1<=temp_b1_f4;
			dato_b2<=temp_b2_f4;
		end
	end
	else  
	begin   
		dato_r1<={1'b1,dato_r1[NUM_BITS:1]};
		dato_r2<={1'b1,dato_r2[NUM_BITS:1]};
		dato_g1<={1'b1,dato_g1[NUM_BITS:1]};
		dato_g2<={1'b1,dato_g2[NUM_BITS:1]};
		dato_b1<={1'b1,dato_b1[NUM_BITS:1]};
		dato_b2<={1'b1,dato_b2[NUM_BITS:1]};
	end
 
 
	logic rojo, verde;
	 
	assign R1=dato_r1[0]&rojo;
	assign R2=dato_r2[0]&rojo;
	assign G1=dato_g1[0]&verde;
	assign G2=dato_g2[0]&verde;
	assign B1=0;//dato_b1[0];
	assign B2=0;//dato_b2[0];
 
 
	logic [24:0]unseg;
	logic seg;
	always_ff@(posedge clk)
	if(!rst) unseg<=0;
	else if(unseg==25'd13500000) 
	begin 
		unseg<=0; 
		seg<=~seg;
	end
	else unseg<=unseg+1;
 
	// FSM
	logic [1:0]nextstate=0, state=0;
	logic [5:0]timer, tiempo=3;
	//assign tiempo=4;
	logic band_time;
	always_ff@(posedge seg)
	if(!rst) timer<=0;
	else if(timer==tiempo)
	begin  
		timer<=0;
		band_time<=1;
	end
	else 
	begin 
		timer<=timer+1; 
		band_time<=0;
	end
	 
	always_ff@(posedge seg)
	if(!rst) state<=0;
	else state<=nextstate;
	 
	always_ff@(posedge seg)
	case(state)
	2'b00:if(band_time)begin tiempo<=5; verde<=1; rojo<=0; nextstate<=2'b01;end
	2'b01:if(band_time)begin tiempo<=2; verde<=1; rojo<=1; nextstate<=2'b10;end
	2'b10:if(band_time)begin tiempo<=3; verde<=0; rojo<=1; nextstate<=2'b00;end
	endcase
 
endmodule