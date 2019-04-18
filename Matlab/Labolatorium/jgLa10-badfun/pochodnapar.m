function pochodnapar
% obliczyc pochodne funkcji y=f(k*sin(k*x))
% deklarowanie zmiennych
syms t k
%funkcja zdefiniowana parametrycznie
x1=k*sin(t)+sin(k*t);
x2=k*cos(t)+cos(k*t);
%1-sze pochodne
dx1dt=diff(x1,t)
dx2dt=diff(x2,t)
%2-gie pochodne
d2x1d2t=diff(x1,t,2)
d2x2d2t=diff(x2,t,2)
return