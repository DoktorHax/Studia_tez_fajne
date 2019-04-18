function rntest(fd,xopis,x)
fprintf('\n\n rntest() - analiza statystyczna zm. losowej x=%s',xopis);
if nargin<3
    m=10; s=3;  x=m+s*randn(20);
end
if nargin<2 xopis='x'; end
if nargin<1 fd=fopen('rntestOUT.m','wt'); end
xobl=x(:);
mobl=mean(xobl); sobl=std(xobl);
fprintf(fd,' \n %s - analizowana zmienna losowa',xopis);
fprintf(fd,' \n mobl  = %8.2f - srednia',mobl);
fprintf(fd,' \n sobl  = %8.2f - oszacowanie odchylenia standardowego',sobl);
% histogram
%xopis, xobl
histx(fd,xopis,xobl); % histogramy
%
% ustalenie liczby klas
lp=length(xobl); % liczba realizacji
ksqrt=sqrt(lp); % wg k=sqrt(lp)
klog10=1+3.322*log10(lp); % wg k=1+3.322*log10(lp)
k=ksqrt; if klog10>ksqrt k=klog10; end
mp=round(k);
LiczbaKlas=mp; % liczba klas
%ksqrt,klog10,k,mp
[n,xsr]=hist(xobl,mp); % przedzialy i czestosci
d=xsr(2)-xsr(1);
np=length(n); suman=sum(n); npu=n./suman;
fprintf(fd,'\n\n Parametry histogramu - %s',xopis);
fprintf(fd,'\n Nr. przedzialu Srodek    Licznosc Czestosc    Gestosc N(m,s)');
for i=1:np
    xa=xsr(i)-d/2; xb=xsr(i)+d/2;
    pr=prnab(mobl,sobl,xa,xb);
    Poi(i,1)=pr;
   fprintf(fd,   '\n %13d %9.8g %9d %9.8g  %9.8g ',i,xsr(i),n(i),npu(i),Poi(i) );
end
hold on;
plot(xsr,Poi,':k');
hold on;
plot(xsr,npu,'r');
grid on;  xlabel(xopis); ylabel('Czestosc');
opis=['Rozklad normalny i histogram zmiennej losowej - ',xopis];
title(opis);
legend('gestosc N(m,s)','histogram');
saveas(gcf,'histogram_gestosc','emf');
pause(5); close;
 
% dane o przedzialach
[n,xsr]=hist(xobl,LiczbaKlas); % przedzialy i czestosci
nliczba=n'; % transponowanie
np=length(nliczba); suman=sum(nliczba); npu=nliczba./suman;
fprintf(fd,   '\n\n Parametry histogramu - %s',xopis);
for i=1:np-1
  xd=xsr(i+1)-xsr(i);
  xdol(i,1) = xsr(i)-xd/2;
  xgora(i,1)= xsr(i)+xd/2;
end
xdol(np,1) = xsr(np)-xd/2;
xgora(np,1)= xsr(np)+xd/2;
fprintf(fd,'\n Nr. przedzialu    Dolna     Gorna   Srednia  Licznosc   Czestosc');
for i=1:np
  fprintf(fd,   '\n %13d %9.8g %9.8g %9.8g %9d %9.8g',...
      i,xdol(i),xgora(i),xsr(i),nliczba(i),npu(i));
end
% przygotowanie danych do testu chi2 dla rozkladu normalnego
pomiary=[xdol,xgora,nliczba]; 
testchi2(fd,xopis, pomiary); %test ch2
end
