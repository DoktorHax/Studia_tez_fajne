function [FunkcjaDopasowana]=fxfit(dane)
% Dla cz³owieka dlugosc fali widzialnego swiatla
% zawiera siê w przedziale (380-780) nm (co najmniej)
% Dopasowanie krzywej dyspersji z wykorzystaniem fminsearch()
% Zastosowano pseudo-losowy punkt startowy do obliczen
fd=fopen('fxfitOUT.m','wt');
if nargin<1
lambda=[436       546       564       585      600       634       647];
wspn  =[1.600    1.260    1.220     1.180    1.156     1.100     1.080];
dane=[lambda;wspn];
end
x=dane(1,:); fx=dane(2,:);  xmin=min(x); xmax=max(x);
start = rand(1, 2);
model = @hiperbola;
[X,FVAL,EXITFLAG,OUTPUT] = fminsearch(model, start);
opisrozw(fd,start,X,FVAL,EXITFLAG,OUTPUT);
a=X(1); b=X(2);
[sumblad, FunkcjaDopasowana] = model(X);
plot(x,fx,'*b',x, FunkcjaDopasowana, '-.r'); grid on;
xlabel('x=lambda[nm]'); ylabel('n=F(x)');
title('Pomiary krzywej dyspersji i FunkcjaDopasowana wg fminsearch()]');
legend('Pomiary','f(x) - dopasowana');
saveas(gcf,'fxfitrys1','fig');
saveas(gcf,'fxfitrys2','emf');
input('Dalej? ENTER');  close;
% hiperlin to suma hiperboli i prostej,
    function [sumblad, FunkcjaDopasowana] = hiperbola(params)
        a = params(1);b = params(2); 
        FunkcjaDopasowana = a./x+b;
        BladDopasowania = FunkcjaDopasowana - fx;
        sumblad = sum(BladDopasowania .^ 2);
    end
fprintf(fd,'\nFunkcjaDopasowana: f(x)=a/x + b, a=%g, b=%g',a,b);
fprintf(fd,'\n blad dopasowania = %g',sumblad);
fprintf(   '\nFunkcjaDopasowana: f(x)=a/x + b, a=%g, b=%g',a,b);
fprintf(   '\n blad dopasowania = %g',sumblad);
  fclose(fd);
end
