function pr=prnab(xa,xb,Ex,Dx)
%Funkcja: pr=prmrn(xa,xb,Ex,Dx)
%oblicza prawdopodbienstwo zmiennej losowej normalnej w przedziale
%  a <= X < b  
% wart. oczek.        - Ex 
% odchyl. standardowe - Dx 
% dolna wartosc       - xa 
% gorna wartosc       - xb 
%Obliczana jest standaryzowana wartosc zmiennej dla gornej wartosci
%i dolnej wartosci, a nastepnie wywolywany jest funkcja erf(x)
%erf(x)=2/sqrt(pi)*calka(od 0 do x)[exp(-x^2]dx
% F(x)=0.5+0.5*erf(x/sqrt(2)) dla x >= 0
% F(x)=0.5-0.5*erf(x/sqrt(2)) dla x <  0
s2=sqrt(2);
% obliczenie dystrybuanty dla gornej wartosci xb
tb=(xb-Ex)/Dx; Fb=0.5*(1+sign(tb)*erf(abs(tb)/s2));
% obliczenie dystrybuanty dla dolnej wartosci xa
ta=(xa-Ex)/Dx; Fa=0.5*(1+sign(ta)*erf(abs(ta)/s2));
% obliczenie prawdopodobienstwa pr dla zadanego przedzialu 
xa,xb
ta,tb
Fb, Fa

pr=(Fb-Fa);
%pr
return;
               