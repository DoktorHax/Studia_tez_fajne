function symtest
% Tworzenie symbolicznych zmiennych syms a b c x i symbolicznej funkcji
syms a b c x
y = a*x^2 + b*x + c;
y
f = a + b;
f
% Tworzenie zmiennej wielowymiarowej A=sym('a',[1 20])
A=sym('a',[1 20]);
A
% Tworzenie symbolicznego wyrazenia p =(1+sqrt(sym(5)))/2;
p=(1+sqrt(sym(5)))/2;
% Wykorzystanie symbolicznego wyrazenia p
w = p^2 - p - 1;
w
return