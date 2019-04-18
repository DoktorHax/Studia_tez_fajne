function histx(fd,xopis,x)
%xopis,x
fprintf('\n histx() - histogram oraz N(m,s) zm. losowej %s',xopis);
% ustalenie liczby klas
lp=length(x);N=lp; % liczba realizacji losowych
ksqrt=sqrt(lp); % wg k=sqrt(lp)
klog10=1+3.322*log10(lp); % wg k=1+3.322*log10(lp)
k=round(ksqrt); if klog10>ksqrt k=round(klog10); end
%k=10; % do testowania
%hist(x,k); grid on; title(xopis); % tylko histogram do testowania
%xlabel('x'); ylabel('liczebnosc');
%pause(5); close;
xsr=mean(x);
xstd=std(x);
[nk,xsrk]=hist(x,k); % liczebnosci w przedzialach dla histogramu
np=length(nk); sumank=sum(nk); nkpu=nk./sumank;
dk=xsrk(2)-xsrk(1);
fprintf(fd,'\n %s)',xopis);
fprintf(fd,'\n xsr  = %9.6g - wartosc srednia odchylen losowych',xsr);
fprintf(fd,'\n xstd = %9.6g - odchylenie standardowe odchylen losowych',xstd);
fprintf(fd,'\n k    = %9d - xopisczba klas',k);
fprintf(fd,'\n d    = %9.6g - szerokosc przedzialu histogramu',dk);
fprintf(fd,'\n Nr. przedzialu   Srodek liczebnosc  czestosc   prawd.N(m,s)');
for i=1:np
    xak=xsrk(i)-dk/2; xbk=xsrk(i)+dk/2;
    pr=prnab(xsr,xstd,xak,xbk);
    prNms(i,1)=pr; % prawd. przedzialu z N(m,s)
   fprintf(fd,'\n %13d %9.6g %9d  %9.6g   %9.6g',...
   i,xsrk(i),nk(i),nkpu(i),prNms(i));
end
%
if abs(xsr)<1e-4 xsr=0; end
if xstd<1e-4 xstd=0; end
cxsr=num2str(xsr,2); cxstd=num2str(xstd,2);
opis4=['srednia=' cxsr ', odch.stand.=' cxstd];
opis={xopis; opis4}; 
opis=char(opis);
close;
bar(xsrk,nkpu,'y'); grid on;
hold on;
plot(xsrk,prNms,'-b','LineWidth',3.5);
hold on;
grid on;
title(opis);
xlabel(xopis);
ylabel('Standaryzowana do jedynki czestosc wystepowania');
rysHistNms=[xopis '_histogram'];
legend( 'rozklad prawd. wg histogramu','rozklad prawd. normalny');
saveas(gcf,rysHistNms,'emf');
pause(5); close
fprintf(fd,'\n ... histx() - koniec histogramu dla %s ...',xopis);
fprintf(   '\n ... histx() - koniec histogramu dla %s ...',xopis);
end % koniec funkcji

