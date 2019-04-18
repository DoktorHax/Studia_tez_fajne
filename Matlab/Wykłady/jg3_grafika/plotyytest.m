function plotyytest
t=0:900; A=1000; 
alfa=0.005; beta=0.005;
z1=A*exp(-alfa*t);
z2=sin(beta*t);
[h L1 L2]=plotyy(t,z1,t,z2,@semilogy,'plot');
axes(h(1));
ylabel('skala logarytmiczna');
axes(h(2));
ylabel('skala liniowa');
set(L2,'LineStyle','--');
xlabel('t[s]');
grid on;
pause; disp('Dalej? ENTER');
close;
return
