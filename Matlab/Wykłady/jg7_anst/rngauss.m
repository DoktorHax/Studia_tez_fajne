function gp=rngauss(x,m,s)
% p(x)=1/(s*sqrt(2*pi))*exp(-((x-m)/(sqrt(2)*s))^2) - krzywa Gaussa
% gdzie m - wartosc srednia, s - odchylenie standardowe
% gp - gestosc prawdopodobiensta
p2pi=sqrt(2*pi);
t=(x-m)/s; % standaryzacja zmiennej losowej
gp = 1/s/p2pi*exp(-t.^2/2);
end
