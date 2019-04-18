function grafika3dc
%wykres konturowy
x = -4:.1:4; y = -3:.1:3;
[X,Y]= meshgrid(x,y);
Z = X.^2 - 2*(X.*Y) + 3*Y + 2;
contourf(X,Y,Z);
axis([-4 4 -3 3 -15 40]);
return
