function [f,fgrad] = erofg(x)
b=[4;0.04]; c=[10; 20];
PG1=x(1); PG2=x(2);
b1=b(1); b2=b(2);
c1=c(1); c2=c(2);
%funkcja celu 
f = b1*PG1+b2*PG2 + c1*PG1^2 +c2*PG2^2;
% gradient funkcji celu
fgrad=[b1+2*c1*PG1; b2+2*c2*PG2];
return
