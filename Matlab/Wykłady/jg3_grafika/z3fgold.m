function [t,ia,zanikanie]=z3fgen
xbisd=0.28;
xbisq=0.32;
xprimd=0.39;
xprimq=0.52;
xd=2;
xq=1.85;
tauprimd=0.85;
taubisd=0.028;
tau=0.025;
Um=sqrt(2);
psi=0;
t0=0;
tmax=0.5;dt=0.002;
t=t0:dt:tmax;
w=2*pi*50;
zanikanie = xbisd.*( (1/xbisd -1/xprimd).*exp(-t./taubisd)...
    +      (1/xprimd-1/xd).*exp(-t./tauprimd) + 1/xd);
ia=Um/xbisd* (zanikanie.*cos(w.*t+psi)...
    -0.5*exp(-t./tau).*((1/xbisd+1/xbisq)*cos(psi)...
    -(1/xbisd-1/xbisq).*cos(2*w.*t+psi) ) );
plot(t,ia,t,zanikanie);
grid on;
title('Przebieg pradu zwarcia na generatorze synchronicznym');
xlabel('t,s'); ylabel('izw(t)');
return
