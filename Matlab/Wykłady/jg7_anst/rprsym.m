function [x]=rprsym(a,b,nsym)
% Funkcja tworzy wektor liczb losowych z przedzialu [a,b] dla nsym losowan
if nargin <3 nsym=100;
    if nargin <2 a=0;
        if nargin <1 b=20;
        end
    end
end
x=a+(b-a)*rand(nsym,1); Fx=(x-a)/(b-a);
opis1=num2str(a), opis2=num2str(b); opis3=int2str(nsym);
opis=['Realizacja dystrybuanty prawd. w przedziale [' opis1 ',' opis2 ']' ', nsym=' opis3];
plot(x,Fx,'*k'); grid on; title(opis); zakres=[a b 0 1]; axis(zakres);
pause; disp('Dalej? ENTER'); close;
xsr=mean(x); sigma=std(x);
fprintf(' \n Statystyki: xsr=%g - srednia, sigma=%g - odchylenie standardowe',xsr,sigma);
return
