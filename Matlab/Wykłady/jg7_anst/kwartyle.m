function kwartyle(fd,xopis,x)
% obliczanie kwartyli empirycznych
% bez znajmosci rozkladu prawdopodobienstwa
fprintf('\n\n kwartyle() - poczatek dzialania funkcji'); 
if nargin <3
x=[    6.8 5.3 6.0 5.9 6.8 7.4 7.4 6.2  ];
end
if nargin<2 xopis='x'; end
if nargin<3 fd=fopen('kwartyleOUT.m','wt'); end
%x=[    6.8 5.3 6.0 5.9 6.8 7.4 7.4 6.2  8.0];
n=length(x); 
sumx=sum(x); xsr=sumx/n; xsrmean=mean(x);
dx=x-xsr; dx2=dx.^2; sumdx2=sum(dx2); s2=sumdx2/n;
s2d=s2*n/(n-1);
s=sqrt(s2);
sd=sqrt(s2d);
sdstdn=std(x,1);
xsort=sort(x);
%x, xsort
sqrtn=sqrt(n); k=ceil(sqrtn); h=(xsort(1)+xsort(n))/2;
fprintf(fd,'\n liczba klas          k = ceil(sqrt(n)) = %d',k);
fprintf(fd,'\n szerokosc przedzialu h = (xmax-xmin)/2 = %g',h)
 
fprintf(fd,'\n Lp      x       xsort');
for i=1:n
    fprintf(fd,'\n %2d %8.2f %8.2f',i,x(i),xsort(i) );
end
plot(xsort,'*r'); 
title('Proba uporzadkowana od min do max - dystrybuanta empiryczna'); grid on;
xlabel('nr'); ylabel('Xpi');
saveas(gcf,'dystrempir','emf'); pause(5); close;
%
fprintf(fd,'\n\n xsr=%g,   s2=%g,    s2d=%g,    s=%g,    sd=%g',...
    xsr,s2,s2d,s,sd);
fprintf(fd,'\n\n');
% kwartyle
p1_4=1/4; p2_4=2/4; p3_4=3/4;
% kwantyl rzedu p=1/4, czyli 1 kwartyl
np_calkowita=0; p=p1_4;
if (n*p)==floor(n*p) np_calkowita=1; end
if np_calkowita   iq=n*p;  else iq=floor(n*p)+1; end
iq25=iq;
xq25=xsort(iq);
fprintf(fd,'\n 1 kwartyl:  iq25=%d, xq25=xsort(iq25)=%f\n',iq25,xq25);
 
% kwantyl rzedu p=2/4, czyli 2 kwartyl
np_calkowita=0; p=p2_4;
if (n*p)==floor(n*p) np_calkowita=1; end
if np_calkowita   iq=n*p;  else iq=floor(n*p)+1; end
iq50=iq;
xq50=xsort(iq);
fprintf(fd,'\n 2 kwartyl:  iq50=%d, xq50=xsort(iq50)=%g\n',iq50,xq50);
 
% kwantyl rzedu p=3/4, czyli 3 kwartyl
np_calkowita=0; p=p3_4;
if (n*p)==floor(n*p) np_calkowita=1; end
if np_calkowita   iq=n*p;  else iq=floor(n*p)+1; end
iq75=iq;
xq75=xsort(iq);
fprintf(fd,'\n 3 kwartyl:  iq75=%d, xq75=xsort(iq75)=%g\n',iq75,xq75);
Q=xq75-xq25;
fprintf(fd,'\n Rozstep miedzykwartelowy: Q=xq75-xq25=%g\n',Q);
 
% inny sposob wyznaczania mediany
% MEDIANA - kwantyl rzedu p=2/4, czyli 2 kwartyl
n_parzysta=0; p=p2_4;
if (n*p)==floor(n*p) n_parzysta=1; end
if n_parzysta 
    fprintf(fd,'\n liczba danych n =%d  - parzysta',n);
    mediana=(xsort(n/2)+xsort(1+n/2))/2;
else
    fprintf(fd,'\n liczba danych n =%d  - nieparzysta',n);
    mediana=xsort( (n+1)/2 );
end
fprintf(fd,'\n\n Mediana z uwzglednieniem symetrii: %g\n',mediana);
fprintf('\n\n kwartyle() - koniec dzialania funkcji'); 
end
