//Nome:André Lucas Ribeiro Costa
//Matrícula: 666400
//Para uma melhor visualização utillizar tab de espaçamento 3

module nandModule(input a,input b,output s);
	nand nandA(s,a,b);
endmodule //nandModule

module norModule(input a,input b,output s);
	nor norA(s,a,b);
endmodule //norModule

module orComNand(input a,input b,output s);
	wire not_a;
	wire not_b;
	nandModule moduloNotA1(a,a,not_a);
	nandModule moduloNotA2(b,b,not_b);
	nandModule moduloNand(not_a,not_b,s);
endmodule //orComNand

module andComNand(input a,input b,output s);
	wire nandA;
	nandModule moduloNand(a,b,nandA);
	nandModule moduloNot(nandA,nandA,s);
endmodule //andComNand

module orComNor(input a,input b, output s);
	wire norA;
	norModule moduleNor(a,b,norA);
	norModule moduleNot(norA,norA,s);
endmodule //orComNor	

module andComNor(input a,input b,output s);
	wire not_a;
	wire not_b;
	norModule moduleNot1(a,a,not_a);
	norModule moduleNot2(b,b,not_b);
	norModule moduleResposta(not_a,not_b,s);
endmodule //andComNor

module notComNand(input a,output s);
	nandModule moduleNot(a,a,s);
endmodule //notComNand

module notComNor(input a,output s);
	norModule moduleNot(a,a,s);
endmodule //notComNor

module xorComNand(input a,input b,output s);
	wire notA,notB,andA,andB;
	notComNand not_A1(a,notA);
	notComNand not_A2(b,notB);
	andComNand and_A1(notA,b,andA);
	andComNand and_A2(a,notB,andB);
	orComNand orSolution(andA,andB,s);
endmodule //xorComNand

module xnorComNor(input a,input b,output s);
	wire notA,notB,andA,andB,orA;
	notComNor notA1(a,notA);
	notComNor notA2(b,notB);
	andComNor andA1(notA,b,andA);
	andComNor andA2(a,notB,andB);
	orComNor orA1(andA,andB,orA);
	notComNor notSolution(orA,s);
endmodule //xnorComNor

module testeOrComNand;
//=========================================================================================================================================
//Definição de dados:
	reg x;
	reg y;
	wire orNand,orNor,andNand,andNor,xorNand,xnorNor;
	orComNand module1(x,y,orNand);
	orComNor module2(x,y,orNor);
	andComNand module3(x,y,andNand);
	andComNor module4(x,y,andNor);
	xorComNand module5(x,y,xorNand);
	xnorComNor module6(x,y,xnorNor);
//Fim da definição de dados.
//=========================================================================================================================================
//Main:
/*
initial
begin : teste_0502
	$display("Exemplo_0502 - x,y,z");
	$display("Teste de modulo");
	$display("	x	y	a");
	$monitor("%4b %4b %4b",x,y,orNand);
	x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end*/
/*
initial
begin : teste_0503
   $display("Exemplo_0503 - x,y,z");
   $display("Teste de modulo");
   $display("  x  y  a");
   $monitor("%4b %4b %4b",x,y,andNor);
   x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end*/
/*
initial
begin : teste_0504
   $display("Exemplo_0504 - x,y,z");
   $display("Teste de modulo");
   $display("  x  y  a");
   $monitor("%4b %4b %4b",x,y,andNand);
   x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end*/
/*
initial
begin : teste_0505
   $display("Exemplo_0505 - x,y,z");
   $display("Teste de modulo");
   $display("  x  y  a");
   $monitor("%4b %4b %4b",x,y,orNor);
   x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end*/

initial
begin : teste_0506
   $display("Exemplo_0506 - x,y,z");
   $display("Teste de modulo");
   $display("  x  y  a");
   $monitor("%4b %4b %4b",x,y,xorNand);
   x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end
/*
initial
begin : teste_0507
   $display("Exemplo_0507 - x,y,z");
   $display("Teste de modulo");
   $display("  x  y  a");
   $monitor("%4b %4b %4b",x,y,xnorNor);
   x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;
end*/
endmodule
//Fim da main.
//=========================================================================================================================================


