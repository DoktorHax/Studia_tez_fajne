function pr=prnab(Ex,Dx,xa,xb)
%oblicza prawdopodbienstwo zmiennej losowej normalnej w zadanym przedziale
%  a <= X < b  
% wart. oczek.        - Ex 
% odchyl. standardowe - Dx 
% dolna wartosc       - xa 
% gorna wartosc       - xb 
%Obliczana jest standaryzowana wartosc zmiennej dla gornej wartosci
%i dolnej wartosci, a nastepnie wywolywany jest funkcja erf(t)
% erf(t)=2/sqrt(pi)*calka(od 0 do t)[exp(-t^2]dt
% F(t)=0.5+0.5*erf(t/sqrt(2)) dla t >= 0
% F(t)=0.5-0.5*erf(t/sqrt(2)) dla t <  0
% obliczenie dystrybuanty dla gornej wartosci xb
tb=(xb-Ex)/Dx;
Fb=0.5*(1+sign(tb)*erf( abs(tb)/sqrt(2) ));
% obliczenie dystrybuanty dla dolnej wartosci xa
ta=(xa-Ex)/Dx;
Fa=0.5*(1+sign(ta)*erf( abs(ta)/sqrt(2) ));
% obliczenie prawdopodobienstwa pr dla zadanego przedzialu 
pr=(Fb-Fa);
end
