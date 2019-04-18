function [xsort,Fx]=dystrn(fd,xsort)
% dystrybuanta N(Ex,Dx) w przedziale xmin-xmax
Ex=mean(xsort); Dx=std(xsort);
nx=length(xsort); xmin=min(xsort); xmax=max(xsort);
for i=1:nx
    xa=xmin; xb=xsort(i); pr=prnab(xa,xb,Ex,Dx,xmin,xmax);
    Fx(i)=pr;
end
fprintf(' dystrn() - Ex = mean(x) = %f,    Dx = std(x) = %f', Ex, Dx)
plot(xsort,Fx,'-k'); title('Dystrybuanta N(Ex,Dx)'); grid on;
xlabel('x'); ylabel('F(x)'); disp('Enter'); pause; close;
%
krok=nx/20;
fprintf(fd,'\n Dystrybuanta empiryczna: Ex=%g, Dx=%g, xmin=%g, xmax=%g',Ex,Dx,xmin,xmax);
fprintf(fd,'\n Lp    x      F(x)');
fprintf(   '\n Dystrybuanta empiryczna: Ex=%g, Dx=%g, xmin=%g, xmax=%g',Ex,Dx,xmin,xmax);
fprintf(   '\n Lp    x      F(x)');
i=1; idruk=1;
while i<=nx
     fprintf(fd,'\n %3d %5.3f %5.3f',idruk,xsort(i), Fx(i)); 
     fprintf(   '\n %3d %5.3f %5.3f',idruk,xsort(i), Fx(i))
     i=i+krok; idruk=idruk+1;
end
return

function pr=prnab(xa,xb,Ex,Dx,xmin,xmax)
%Funkcja: pr=prmrn(xa,xb,Ex,Dx)
%oblicza prawdopodbienstwo zmiennej losowej normalnej w przedziale
%  a <= X < b  zmiennej N(Ex,Dx) obcietej do xmin - xmax
% wart. oczek.        - Ex 
% odchyl. standardowe - Dx 
% dolna wartosc       - xa 
% gorna wartosc       - xb 
%Obliczana jest standaryzowana wartosc zmiennej dla gornej wartosci
%i dolnej wartosci, a nastepnie wywolywany jest funkcja erf(x)
%erf(x)=2/sqrt(pi)*calka(od 0 do x)[exp(-x^2]dx
% F(x)=0.5+0.5*erf(x/sqrt(2)) dla x >= 0
% F(x)=0.5-0.5*erf(x/sqrt(2)) dla x <  0
s2=sqrt(2);
% obliczenie dystrybuanty dla gornej wartosci xb
tb=(xb-Ex)/Dx; Fb=0.5*(1+sign(tb)*erf(abs(tb)/s2));
% obliczenie dystrybuanty dla dolnej wartosci xa
ta=(xa-Ex)/Dx; Fa=0.5*(1+sign(ta)*erf(abs(ta)/s2));
tmin=(xmin-Ex)/Dx; tmax=(xmax-Ex)/Dx;
Fmin=0.5*(1+sign(tmin)*erf(abs(tmin)/s2));
Fmax=0.5*(1+sign(tmax)*erf(abs(tmax)/s2));
Fa=Fa-Fmin; Fb=Fb-Fmin;
% obliczenie prawdopodobienstwa pr dla zadanego przedzialu a,b w xmin=Xmax
pr=(Fb-Fa)/(Fmax-Fmin);
%pr
return;
               