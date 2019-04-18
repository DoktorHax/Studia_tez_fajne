function [prxdop,xsr,sigma,Fea]=kolmogorow(fd,x,prx,xdop)
% Dopasowanie dystrybuanty empirycznej wielomianem 4-tego stopnia
xsr=mean(x); sigma=std(x); xmin=min(x); xmax=max(x);
% standaryzacja zmiennej losowej
t=(x-xsr)./sigma;
tmin=(xmin-xsr)/sigma; tmax=(xmax-xsr)/sigma; tdop=(xdop-xsr)/sigma;
prt=prx;
% APROKSYMACJA
n=0; BladMax=1;
while BladMax>0.01
    par=[]; n=n+1;
    par=polyfit(t,prt,n);  Fea=polyval(par,t);
    BladAprox = Fea - prt; BladMax=max(abs(BladAprox));
end
fprintf(fd,'\n  Aproksymacja wielomianem stopnia n = %d', n);
fprintf(   '\n  Aproksymacja wielomianem stopnia n = %d', n);
for k=1:n+1
   fprintf(fd,'\n p(%d) = %9.4f', k, par(k) );
   fprintf(   '\n p(%d) = %9.4f', k, par(k) );
end
fprintf(fd,'\n %g - maksymalny blad aproksymacji',BladMax);
fprintf(   '\n  Aproksymacja wielomianem stopnia n = %d', n);
fprintf(   '\n %g - maksymalny blad aproksymacji',BladMax);
fprintf(fd,'\n Statystyki proby:');
fprintf(fd,'\n xsr=%g, sigma=%g, xmin=%g, xmax=%g, xdop=%g',xsr,sigma,xmin, xmax,xdop);
fprintf(   '\n Statystyki proby:');
fprintf(   '\n xsr=%g, sigma=%g, xmin=%g, xmax=%g, xdop=%g',xsr,sigma,xmin, xmax,xdop);
nsym=length(t); opis1=num2str(tmin), opis2=num2str(tmax); opis3=int2str(nsym);
opis=['Dystrybuanta Fe(t) empiryczna w przedziale [' opis1 ',' opis2 ']' ', nsym=' opis3];
plot(t,prt,'-k',t, Fea, '-.b'); grid on; xlabel('x'); ylabel('Fe(x)');
title(opis);legend('Fe(t) empiryczna','Fea(t) aproksymowana');
disp('ENTER'); pause; close;
prtdop=polyval(par,tdop);
fprintf(fd,'\n dkdop = %g st, xdop = %g rad, tdop = %g',xdop*180/pi,xdop,tdop);
fprintf(   '\n dkdop = %g st, xdop = %g rad, tdop = %g',xdop*180/pi,xdop,tdop);
fprintf(fd,'\n Pr(X<xdop) = %g - wg Fea(t)',prtdop);
fprintf(   '\n Pr(X<xdop) = %g - wg Fea(t)',prtdop);
nrtdop=find(x>=xdop); ixdop=nrtdop(1); prxdop=prt(ixdop);
fprintf(fd,'\n Pr(X<xdop) = %g - wg Fe(x)',prtdop);
fprintf(   '\n Pr(X<xdop) = %g - wg Fe(x)',prtdop);
end
