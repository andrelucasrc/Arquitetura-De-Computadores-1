//Arquivo cujo o objetivo é descrever os circuitos descritos em logisim com o mesmo nome deste arquivo.
//Criador por: André Lucas Ribeiro Costa.
//Matrícula: 666400

`include "ff.v"
module movDireita(clk,data,a,b,c,d,e);
	input clk,data;
	output a,b,c,d,e;
	reg a,b,c,d,e,f;
	wire oanot,obnot,ocnot,odnot,oenot;
	always @(posedge clk) begin
		dff FF1(a,oanot,data,clk);
      dff FF2(b,obnot,a,clk);
      dff FF3(c,ocnot,b,clk);
      dff FF4(d,odnot,c,clk);
      dff FF5(e,oenot,d,clk);
	end
endmodule //movDireita

module movEsquerda(clk,data,a,b,c,d,e);
   input clk,data;
   output a,b,c,d,e;
   reg a,b,c,d,e,f;
   wire oanot,obnot,ocnot,odnot,oenot;
   always @(posedge clk) begin
      dff FF1(e,oenot,data,clk);
      dff FF2(d,odnot,e,clk);
      dff FF3(c,ocnot,d,clk);
      dff FF4(b,obnot,c,clk);
      dff FF5(a,oanot,b,clk);
   end
endmodule //movEsquerda

module ringDireita(clk,data,a,b,c,d,e);
   input clk,data;
   output a,b,c,d,e;
   reg a,b,c,d,e,f;
   wire oanot,obnot,ocnot,odnot,oenot,orRing;
   always @(posedge clk) begin
		or OR(orRing,e,data);
      dff FF1(a,oanot,orRing,clk);
      dff FF2(b,obnot,a,clk);
      dff FF3(c,ocnot,b,clk);
      dff FF4(d,odnot,c,clk);
      dff FF5(e,oenot,d,clk);
   end
endmodule //ringDireita

module twistedEsquerda(clk,data,a,b,c,d,e);
   input clk,data;
   output a,b,c,d,e;
   reg a,b,c,d,e,f;
   wire oanot,obnot,ocnot,odnot,oenot,orRing;
   always @(posedge clk) begin
      or OR(orRing,oenot,data);
      dff FF1(a,oanot,orRing,clk);
      dff FF2(b,obnot,a,clk);
      dff FF3(c,ocnot,b,clk);
      dff FF4(d,odnot,c,clk);
      dff FF5(e,oenot,d,clk);
   end
endmodule //ringDireita

//Não foi possivel descrever completamento o circuito de serial paralelo,pois o flip flop do tipo D, da biblioteca não possui
//o presset
module serialParalelo(clk,data,a,b,c,d,e);
   input clk,data;
   output a,b,c,d,e;
   reg a,b,c,d,e,f;
   wire oanot,obnot,ocnot,odnot,oenot;
   always @(posedge clk) begin
      dff FF1(a,oanot,data,clk);
      dff FF2(b,obnot,a,clk);
      dff FF3(c,ocnot,b,clk);
      dff FF4(d,odnot,c,clk);
      dff FF5(e,oenot,d,clk);
   end
endmodule //seriaParalelo
