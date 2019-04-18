function grafika3ds
%wykres powierzchniowy
[x,y] = meshgrid(-3:0.2:3,-3:0.2:3);
z = sinh(x).*cosh(x/2).*log(abs(y)+0.75);
surf(x,y,z);
return