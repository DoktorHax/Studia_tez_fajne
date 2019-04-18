function sphere3d
[x,y,z]=sphere(30);
axis equal;
surf(0.5*x,0.4*y,0.5*z);
disp('Dalej? Enter'); pause; close;
return