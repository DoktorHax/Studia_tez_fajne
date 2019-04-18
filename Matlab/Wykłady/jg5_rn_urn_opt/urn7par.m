function f = urn7par(x,p1,p2,p3,p4,p5,p6,p7)
% uklad rownan
%p1=par(1); p2=par(2); p3=par(3); p4=par(4);
%p5=par(5); p6=par(6); p7=par(7);
f(1)= p1*x(1)^2 + p2*x(2)^2 +p3*x(3)^2-4;
f(2)=p4*x(1)*x(2)-1;
f(3)=p5*x(1)*x(2)+p6*x(1)*x(3)+p7*x(2)*x(3)-2;
return


