function dxdt=rlcmdx(t,x)
global R1 L1 R2 L2 M C D E psi
e=sqrt(2)*E*sin(100*pi*t+psi);
A=[R1*L2/D  -R2*M/D L2/D;
   -R1*M/D  R2*L1/D -M/D;
   1/C  0   0];
b=[-L2/D; M/D; 0];
dxdt=A*x+b*e;
end
