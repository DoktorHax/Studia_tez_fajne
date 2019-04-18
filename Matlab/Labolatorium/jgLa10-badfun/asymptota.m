function asymptota
syms x
licznik=2*x.^3;
mianownik=x.^2+1;
y=licznik./mianownik;
plot(x,y); title(' wykres y=2*x^2/(x^2+1)');
grid on; xlabel('x'); ylabel('y');
disp('Dalej? ENTER'); pause;
close
% granica funkcji dla x=inf
limit(y,inf)
return