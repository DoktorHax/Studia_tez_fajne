function komet2D
%Do tworzenia animacji wykresów mo¿emy wykorzystaæ te¿ polecenie comet.
%Animacja ruchu punktu po wyznaczonej krzywej zadanej parametrycznie.
t = 0:.01:2*pi;
x = cos(2*t).*(cos(t).^2);
y = sin(2*t).*(sin(t).^2);
grid on;
comet(x,y);
disp('dalej? ENTER'); pause;
close;
return
 %comet  Comet-like trajectory.
 %   comet(Y) displays an animated comet plot of the vector Y.
 %   comet(X,Y) displays an animated comet plot of vector Y vs. X.
 %   comet(X,Y,p) uses a comet of length p*length(Y).  Default is p = 0.10.
 %   comet(AX,...) plots into AX instead of GCA.
 %   Example:
 %       t = -pi:pi/200:pi;
 %       comet(t,tan(sin(t))-sin(tan(t)))
