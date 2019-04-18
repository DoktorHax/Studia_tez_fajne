function badfun
syms x
% zalozenie wartosci rzeczywistych dla zmiennej symbolicznej
assume(x,'real');
% badana funkcja symboliczna
licznik=3*x^3 + 17*x^2 + 6*x +1;
mianownik=2*x^3 - x + 3;
y=licznik./mianownik;
% wykres badanej funkcji wg fplot()
fplot(y);
title(' wykres y=(3*x^3 + 17*x^2 + 6*x +1)/(2*x^3 - x + 3)');
grid on; xlabel('x'); ylabel('y');
hold on; % zatrzymanie wykresu do dalszego uzupelnienia
% asymptoty funkcji dla x=-inf oraz x=inf
asymptota1=limit(y,x,-inf);
asymptota1
asymptota2=limit(y,x,inf);
asymptota2
plot(xlim,[asymptota1 asymptota2],'LineStyle','-.','Color',[0.1 0.2 0.3]);
% miejsca zerowe
pierwiastki=poles(y,x);
pierwiastki
pierwiastkiWartosc=double(pierwiastki);
pierwiastkiWartosc
% pochodne
dydx=diff(y,x);
dydx
% znajdowanie extremum dla dydx0=dydx=0
dydx0=solve(dydx,x);
dydx0
dydx0Wartosc=double(dydx0);
dydx0Wartosc
% wartosc extremum
yextremum=subs(y,x,dydx0);
yextremum
yextremumWartosc=double(yextremum);
yextremumWartosc
% dodanie do wykresu punktu extremum
plot(dydx0, yextremumWartosc, 'ob');
% druga pochodna
d2yd2x=diff(y,x,2);
d2yd2x
 % wspolny mianownik
   d2yd2xsimplify=simplify(d2yd2x);
d2yd2xsimplify
% punkty przegiecia
pp0=vpasolve(d2yd2x,x);
pp0
pp0(imag(pp0)~=0) = []; % bez czesci urojonych
plot(pp0, subs(y,x,pp0),'*r'); % dodanie punktow przegiecia
saveas(gcf,'BadanaFunkcja','emf');
input('Dalej? ENTER');close
return