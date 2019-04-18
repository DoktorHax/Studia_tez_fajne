function [pierwiastki,x123] = wielom
% [pierwiastki,x123]=wielom
% znajduje pierwiastki za pomoca roots oraz fzero
% wielomianu z = x^3+x^2-3*x-3
format long % zwiekszenie ilosci wyswietlanych cyfr
%% za pomoca funkcji roots
pierwiastki = roots([1 1 -3 -3]);
%% za pomoca funkcji fzero w otoczeniu 0
x1=fzero('z1',0);
%% za pomoca funkcji fzero w otoczeniu 2
x2=fzero('z1',2);
%% za pomoca funkcji fzero w otoczeniu -2
x3=fzero('z1',-2);
%% sprawdzenie dokladnosci rozwiazania za pomoca funkcji polyval
dokladnosc = polyval([1 1 -3 -3], pierwiastki)
%% sprawdzenie dokladnosci rozwiazania za pomoca obliczenia funkcji z1
dokladnosc = z1(pierwiastki);
fprintf('\n\n pierwiastki wyznaczone za pomoca roots:\n %.15f, %.15f,  %.15f\n',pierwiastki);
x123=[x1 x2 x3];
fprintf('\n\n pierwiastki wyznaczone za pomoca fzero:\n %.15f, %.15f,  %.15f\n',x123);
%% Wykresla wielomian z=x^3+x^2-3*x-3 zdefiniowany jako funkcja z1.m
fplot('[z1(x),zer(x)]',[-2,2]);
hold on;
plot(x1,0,'ko',x2,0,'bo',x3,0,'ro');
text(x1,0.5,'x1'); text(x2,0.5,'x2'); text(x3,0.5,'x3');
title(' Wielomian z = x^3 +x^2 - 3*x -3 ');
xlabel(' x'); ylabel(' z'); grid on;
saveas(gcf,'wielom','emf');
pause(5); close;
end
