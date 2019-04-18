function pochodna
% obliczyc pochodne funkcji y=sin(x^2)
% deklarowanie zmiennej x
syms x
%funkcja
y=sin(x^2);
% 1-sza pochodna
p1y=diff(y,'x',1)
p2y=diff(y,'x',2)
p3y=diff(y,'x',3)
return