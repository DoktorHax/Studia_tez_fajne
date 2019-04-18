
function aprox(dane)
% Aproksymacja wielomianem
fd=fopen('aproxOUT.m','wt');
if nargin<1
 
x1=[   -1.5708   -1.4708   -1.3708   -1.2708   -1.1708   -1.0708 ];
x2=[   -0.9708   -0.8708   -0.7708   -0.6708   -0.5708   -0.4708 ];
x3=[   -0.3708   -0.2708   -0.1708   -0.0708    0.0292    0.1292 ];
x4=[    0.2292    0.3292    0.4292    0.5292    0.6292    0.7292 ];
x5=[    0.8292    0.9292    1.0292    1.1292    1.2292    1.3292 ];
x6=[    1.4292    1.5292    1.6292    1.7292    1.8292    1.9292];
x7=[    2.0292    2.1292    2.2292    2.3292    2.4292    2.5292];
x8=[    2.6292    2.7292    2.8292    2.9292    3.0292    3.1292];
    %f(x)
y1=[   -1.0000   -0.9950   -0.9801   -0.9553   -0.9211   -0.8776];
y2=[   -0.8253   -0.7648   -0.6967   -0.6216   -0.5403   -0.4536];
y3=[   -0.3624   -0.2675   -0.1700   -0.0707    0.0292    0.1288];
y4=[    0.2272    0.3233    0.4161    0.5048    0.5885    0.6663];
y5=[    0.7374    0.8011    0.8569    0.9041    0.9422    0.9710];
y6=[    0.9900    0.9991    0.9983    0.9875    0.9668    0.9365];
y7=[    0.8968    0.8481    0.7910    0.7259    0.6536    0.5748];
y8=[    0.4903    0.4008    0.3073    0.2108    0.1122    0.0124];
 
x=[x1 x2 x3 x4 x5 x6 x7 x8]; fx=[y1 y2 y3 y4 y5 y6 y7 y8];
dane=[x;fx];
end
x=dane(1,:); fx=dane(2,:);  xmin=min(x); xmax=max(x);
% APROKSYMACJA
t=x; prt=fx; tmin=xmin; tmax=xmax; nt=length(t);
opis1=num2str(tmin), opis2=num2str(tmax); opis3=int2str(nt);
fprintf(fd,'\n    t        F(t)');
 
for i=1:nt
    fprintf(fd,'\n %g       %g',t(i),prt(i));
    fprintf(   '\n %g       %g',t(i),prt(i));
end
% APROKSYMACJA
BladMaxZadany=0.001;
fprintf(fd,'\n %g - maksymalny blad aproksymacji',BladMaxZadany);
fprintf(   '\n %g - maksymalny blad aproksymacji',BladMaxZadany);
n=0; BladMax=1;
while BladMax>BladMaxZadany
    par=[]; n=n+1;
    par=polyfit(t,prt,n);  Fea=polyval(par,t);
    BladAprox = Fea - prt; BladMax=max(abs(BladAprox));
    nstring=int2str(n);
    opis=['Wielomian n=' nstring ' w przedziale [' opis1 ',' opis2 ']' ', nt=' opis3];
    plot(t,prt,'*k',t, Fea, '-.b'); grid on; xlabel('x'); ylabel('f(t),fa(t)');
    title(opis);legend('f(t)- dane','fa(t) - aproksymacja');
    pause(5); close;
    fprintf(fd,'\n  Aproksymacja wielomianem stopnia n = %d', n);
    fprintf(   '\n  Aproksymacja wielomianem stopnia n = %d', n);
    for k=1:n+1
       fprintf(fd,'\n p(%d) = %9.4f', k, par(k) );
       fprintf(   '\n p(%d) = %9.4f', k, par(k) );
    end
end
fprintf(fd,'\n %g - maksymalny blad aproksymacji',BladMax);
fprintf(   '\n  Aproksymacja wielomianem stopnia n = %d', n);
fprintf(   '\n %g - maksymalny blad aproksymacji',BladMax);
fprintf(   '\n Statystyki proby:');
opis1=num2str(tmin), opis2=num2str(tmax); opis3=int2str(nt);
opis=['Aproksymacja w przedziale [' opis1 ',' opis2 ']' ', nt=' opis3];
plot(t,prt,'-k',t, Fea, '-.b'); grid on; xlabel('x'); ylabel('f(t),fa(t)');
title(opis);legend('f(t)- dane','fa(t) - aproksymowana');
pause(5); close;
fclose(fd);
end


