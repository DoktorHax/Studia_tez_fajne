function ezsurf3d
x=-2*pi:0.1:2*pi;
y=-2*pi:0.1:2*pi;
ezsurf('exp(-x^2-y^2)');
disp('Dalej? ENTER'); pause; close;
return