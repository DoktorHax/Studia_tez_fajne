function kosztgen
% wykresla koszty wytwarzania mocy przez 2 turbozespoly
% K = a1*P1^2 + b1*P + a2*P2^2 + b2*P2
a1=0.5; a2=1.0;
b1=1; b2=2;
P1=100:1:160;
P2=140:1:200;
[x,y]=meshgrid(P1,P2);
z=a1*x.^2+b1*x + a2*y.^2+b2*y;
mesh(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy mesh');
disp('Dalej? Wcisnij ENTER'); pause;
close;
meshz(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy meshz');
disp('Dalej? Wcisnij ENTER'); pause;
close;

meshc(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy meshc');
disp('Dalej? Wcisnij ENTER'); pause;
close;

surf(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy surf');
disp('Dalej? Wcisnij ENTER'); pause;
close;

surfl(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy surfl');
disp('Dalej? Wcisnij ENTER'); pause;
close;

surfc(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy surfc');
disp('Dalej? Wcisnij ENTER'); pause;
close;

waterfall(x,y,z);
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy waterfall');
disp('Dalej? Wcisnij ENTER'); pause;
close;
%
plot3(x,y,z,'-s')
grid on;
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
grid on; title('Wykres powierzchniowy plot3');
disp('Dalej? Wcisnij ENTER'); pause;
close;
contourf(x,y,z);
grid on; title('Wykres konturowy contourf');
xlabel(' Generator P1');ylabel(' Generator P2');
zlabel('Koszt generacji mocy');
disp('Dalej? Wcisnij ENTER');pause;close;



return	
