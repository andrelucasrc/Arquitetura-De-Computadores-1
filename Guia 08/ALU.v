/** Biblioteca para execução do guia 08.
 ** Criada por André Lucas Ribeiro Costa.
 ** Estudante de Ciência da Computação PUC Minas.
 */

module halfsum(a,b,s0,s1);
	input a;
	input b;
	output s0;
	output s1;
	reg s0;
	reg s1;
	wire nota;
	wire notb;
	wire andb1;
	wire andb2;
	not NOT1(nota,a);
	not NOT2(notb,b);
	and AND1(s1,a,b);
	and AND2(andb1,nota,b);
	and AND3(andb2,a,notb);
	or  OR(s1,andb1,andb2);
endmodule //halfsum

module fulladder(a,b,c,s0,s1);
	input a,b,c;
	output s0,s1;
	reg s0,s1;
	wire so1,so2,so3,so4;
	halfsum SOMA1(a,b,so1,so2);	
	halfsum SOMA2(c,so1,s0,so3);
	halfsum SOMA3(so2,so1,so4,s1);
endmodule //fulladder

module fulladder4bits(a,b,s0,s1);
	input[4:0]  a,b;
	output[4:0] s0;
	output s1;
	reg[4:0] s0;
	reg s1;
	wire sum1,sum2,sum3,sum4,sum5;
	
	halfsum   SOMA1(a[0],b[0],s0[0],sum1);
	fulladder SOMA2(a[1],b[1],sum1,s0[1],sum2);
	fulladder SOMA3(a[2],b[2],sum2,so[2],sum3);
	fulladder SOMA3(a[3],b[3],sum3,so[3],s1);
endmodule //fuladder4bits

module halfsub(a,b,s0,s1);
	input a,b;
	output s0,s1;
	reg s0,s1;
	wire nota,notb,and1,and2;
	
	not NOT1(nota,a);
	not NOT2(notb,b);
	and AND1(and1,nota,b);
	and AND2(and2,a,notb);
	s1 = and1;
	or OR(s0,and1,and2);
endmodule //halfsub

module fullsub(a,b,c,s0,s1);
	input a,b,c;
	output s0,s1;
	reg s0,s1;
	wire sub1,sub2,sub3;
	
	halfsub SUB1(a,b,sub1,sub2);
	halfsub SUB2(sub1,c,s0,sub3);
	or      OR(s1,sub2,sub1);
endmodule //fullsub

module fullsub4bits(a,b,s0,s1);
	input[4:0] a,b;
	output[4:0] s0;
	output s1;
	reg[4:0] s0;
	reg s1;
	wire sub1,sub2,sub3;
	halfsub SUB1(a[0],b[0],s0[0],sub1);
	halfsub SUB2(a[1],b[1],sub1,s0[1],sub2);
	halfsub SUB3(a[2],b[2],sub2,s0[2],sub3);
	halfsub SUB4(a[3],b[3],sub3,s0[3],s1);
endmodule //fullsub4bits

module igualdade(a,b,s);
	input[4:0] a,b;
	output s;
	reg s;
	wire or1,or2;
	reg[4:0] respsub1;
	reg respsub2;
	fullsub4bits SUB(a,b,respsub1,respsub2);
	or OR1(or1,respsub1[0],respsub1[1]);
	or OR2(or2,respsub1[2],respsub1[3]);
	or OR3(or3,or1,or2);
	or OR4(or4,or3,respsub2);
	not NOT(s,or4);
endmodule //igualdade

module desiguladade(a,b,maior,menor,igual);
	input[4:0] a,b;
	output maior,menor,igual;
	reg maior,menor,igual;
	wire[4:0] valor;
	wire vaium;
	wire or1,or2,or3,or4;
	wire notor,notvu;
	fullsub SUB(a,b,valor,vaium);
	or OR1(or1,valor[0],valor[1]);
	or OR2(or2,valor[2],valor[3]);
	or OR3(or3,valor[3],or1);
	or OR4(or4,or2,or3);
	and AND1(menor,vaium,or4);
	not NOTOR(igual,or4);
	not NOTVU(notvu,vaium);
	and AND2(maior,or4,notvu);
endmodule //desigualdade

module complemento1(a,s);
	input[4:0] a;
	output s;
	reg[4:0] s;
	not NOT1(s[0],a[0]);
	not NOT2(s[1],a[1]);
	not NOT3(s[2],a[2]);
	not NOT4(s[3],a[3]);
endmodule //complemento1

module complemento2(a,s);
	input[4:0] a;
	output s;
	reg[4:0] s;
	wire[4:0] c1,soma;
	wire vaium;
	soma = 4'b0001;
	complemento1 COMPLEMENTO1(a,c1);
	fulladder4bits SOMA(a,b,s,vaium);
endmodule //complemento2

module lu(a,b,maior,menor,igual,c1a,c1b,c2a,c2b);
	input[4:0] a,b;
	output maior,menor,igual,c1a,c1b,c2a,c2b;
	reg maior,menor,igual;
	reg[4:0] c1a,c1b,c2a,c2b;
	desigualdade DESIGUALDADE(a,b,maior,menor,igual);
	complemento1 C1A(a,c1a);
	complemento1 C1B(b,c1b);
	complemento2 C2A(a,c2a);
	complemento2 C2B(b,c2b);
endmodule //lu
