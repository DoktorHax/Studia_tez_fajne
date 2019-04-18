function jakobian
% obliczanie macierzy Jacobiego
% F=x^2+10*x*z;
% G = exp(y*z);
% H = y^(z*x);
syms x y z
F = x^2+10*x*z;
G = exp(y*z);
H = y^(z*x);
y=[F G H];
%y=[x^2+10*x*z,exp(y*z),y^(z*x)];
v=[x,y,z]
% wyznaczenie macierzy Jacobiego
J=jacobian(y,v)

return