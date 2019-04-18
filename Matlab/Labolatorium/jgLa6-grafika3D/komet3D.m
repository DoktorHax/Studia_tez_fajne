function komet3D
%Do tworzenia animacji wykresów mo¿emy wykorzystaæ te¿ polecenie comet3.
% Ruch punktu po Helisie ko³owej zadanej równaniem:
%   x=a*cos(t);
%   y=a*sin(t);
%   z=b*t;
t=0:0.01:10*pi;
a=10; b=4;
x = a*cos(t);
y = a*sin(t);
z=b*t;
comet3(x,y,z);
close;
return
% comet3 3-D Comet-like trajectories.
%    comet3(Z) displays an animated three dimensional plot of the vector Z.
%    comet3(X,Y,Z) displays an animated comet plot of the curve through the
%    points [X(i),Y(i),Z(i)].
%    comet3(X,Y,Z,p) uses a comet of length p*length(Z). Default is p = 0.1.
%    comet3(AX,...) plots into AX instead of GCA.
%    Example:
%        t = -pi:pi/500:pi;
%        comet3(sin(5*t),cos(3*t),t)
