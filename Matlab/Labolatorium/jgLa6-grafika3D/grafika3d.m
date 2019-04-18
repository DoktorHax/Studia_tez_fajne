function grafika3d
%wykres 3D wektora o wymiarze x, wektora o wymiarze y i macierzy o wymiarze y * x
x=0:0.1:10;
y=0:.1:5;
z=sin(y)'*cos(x);
meshz(x,y,z)
colorbar
return