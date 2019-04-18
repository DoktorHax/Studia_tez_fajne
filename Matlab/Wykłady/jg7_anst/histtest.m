function histtest
m=10; s=3;
x=m+s*randn(100);
xobl=x(:);
mobl=mean(xobl); sobl=std(xobl);
fprintf(' \n m     = %8.3f - zdana wartosc oczekiwana',m);
fprintf(' \n mobl  = %8.2f - srednia',mobl);
fprintf(' \n s     = %8.2f - zadane odchylenie standardowe',s);
fprintf(' \n sobl  = %8.2f - oszacowanie odchylenia standardowego',sobl);
% ustalenie liczby klas
lp=length(xobl); % liczba realizacji
ksqrt=sqrt(lp); % wg k=sqrt(lp)
klog10=1+3.322*log10(lp); % wg k=1+3.322*log10(lp)
k=ksqrt; if klog10>ksqrt k=klog10; end
mp=round(k);
ksqrt,klog10,k,mp
hist(xobl,mp); grid on;% rysowanie histogramu
[n,xsr]=hist(xobl,mp); % przedzialy i czestosci
d=xsr(2)-xsr(1);
xlabel('x'); ylabel('Czestosc wystepowania');
input('\n\n Dalej? Nacisnij ENTER');
saveas(gcf,'histogram','jpg');
close;
np=length(n); suman=sum(n); npu=n./suman;
fprintf(   '\n\n Parametry histogramu x');
fprintf(   '\n Nr. przedzialu   Srodek przedzialu   Licznosc przedzialu    Czestosc przedzialu   Gestosc N(m,s)');
for i=1:np
    xa=xsr(i)-d/2; xb=xsr(i)+d/2;
    pr=prnab(m,s,xa,xb);
    Poi(i,1)=pr;
   fprintf(   '\n %13d %20.8g %20d %20.3g  %20.3g ',i,xsr(i),n(i),npu(i),Poi(i) );
end
hold on;
plot(xsr,Poi,':k');
hold on;
plot(xsr,npu,'r');
grid on;  xlabel('xobl'); ylabel('Czestosc');
title('Rozklad normalny i histogram x');
legend('gestosc N(m,s)','histogram');
saveas(gcf,'histogram_gestosc','jpg');
input('\n\n Dalej? Nacisnij ENTER');
close;
fclose('all');
end
