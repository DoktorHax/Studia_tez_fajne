function testzgodyN01
% Statystyka - test chi-kwadrat zgodnosci z rozkladem normalnym N(0,1)
% lista 6, zad. 4
tabchi2=[
%l.st.swobody   0.10        0.05     0.02        0.01
1               2.7055      3.8415   5.4119     6.6349
2               4.6052      5.9915   7.8240      9.2103
3               6.2514      7.8147   9.8374       11.3449
4               7.7794      9.4877   11.6678    13.2767
5               9.2364      11.0705  13.3882     15.0863
6               10.6446     12.5916  15.0332    16.8119
7               12.0170     14.0671  16.6224    18.4753
8               13.3616     15.5073  18.1682     20.0902
9               14.6837     16.9190  19.6790     21.6660
10              15.9872     18.3070  21.1608     23.2093 
];
talfa=[0    0.10    0.05    0.02    0.01];
%
%dane
fprintf('\n*******************  Lista 6 zad. 4 **********************\n\n\n');
alfa=0.05
pomiary=[
%kpocz   kkonc      ni  
-1e4    1900         0
1900    2000        10
2000    2100        26
2100    2200        56
2200    2300        64
2300    2400        30
2400    2500        14
2500    1e4          0
];
[k,kk]=size(pomiary)
n=sum(pomiary(:,3))
dxi=pomiary(:,2)-pomiary(:,1);
xi=pomiary(:,1)+dxi/2;
ni=pomiary(:,3);
Pi=ni/n;
xsr=sum(xi.*ni)/n;
dx2=(xi-xsr).^2.*ni;
s2=sum(dx2)/(n-1);
s2
s=sqrt(s2);
xsr,s
df=k-1-2
Poi=[];
for i=1:k
    xa=pomiary(i,1);
    xb=pomiary(i,2);
    za=(xa-xsr)/s;
    zb=(xb-xsr)/s;
    pr=prnab(xa,xb,xsr,s);
    Poi(i,1)=pr;
    i,xa,xb,za,zb,pr
end
Pi,Poi
dPiPoi2=(Pi-Poi).^2;
dPiPoi2przezPoi=dPiPoi2./Poi;


fprintf('\n Lp        xd      xg        xi   ni Pi=ni/n  Poi (Pi-Poi)^2  (Pi-Poi)^2/Poi');
for i =1: k
    fprintf('\n %2d   %.2f %.2f %9.3f %4d %5.3f  %5.3f %8.4f     %8.4f',...
        i,pomiary(i,1), pomiary(i,2), xi(i), ni(i), Pi(i), Poi(i), dPiPoi2(i), dPiPoi2przezPoi(i) );
end
suma=sum(dPiPoi2przezPoi);
fprintf('\n                                                        suma = %8.4f',suma);
T=n*suma;

fprintf('\n statystyka T = n*suma = %d * %f =  %f \n',n,suma,T);

ialfa=[];
ialfa=find(talfa==alfa)
fprintf('\n liczba klas k = %d\n ',k);
s=2; % do obliczenia Pi nie wyznaczano zadnych parametrow rozkladu
fprintf('\n liczba parametrow rozkladu potrzebnych do wyznaczenia Pi s=%d',s);
df=k-1-s;
fprintf('\n liczba stopni swobody df=k-1-s=%d-%d-%d=%d',k,1,s,df);
chi2alfa=tabchi2(df,ialfa);
fprintf('\n dla alfa=%f i liczby stopni swobody df=k-1-s = %d',alfa,df);
fprintf('\n z tablic chi2 odczytano kwantyl chi2(alfa,df)=%f\n',chi2alfa);


if T<=chi2alfa
    fprintf('\n Ho: Fo=N(m,sigma) - przyjeta,');
    fprintf('\n poniewaz T=%f  <  chi2alfa=%f',T,chi2alfa);
else
    fprintf('\n Ho: Fo=N(m,sigma) - odrzucona,');
    fprintf('\n poniewaz T=%f  >  chi2alfa=%f',T,chi2alfa);
end
plot(xi,Pi,'-b'); title('histogram');
xlabel('x'); ylabel('Pi=ni/n'); grid on;
fprintf('\n\nDalej? ENTER'); pause;
close;
fprintf('\n*******************  Lista 6 zad. 4 **********************\n\n\n');



%dane
fprintf('\n*******************  Kol. zal. Budownictwo - zad. 3**********************\n\n\n');
alfa=0.05
pomiary=[
%kpocz   kkonc      ni
-1e3    0            0
0       1           41
1       2           28
2       3           31
3      1e3           0
];
[k,kk]=size(pomiary)
n=sum(pomiary(:,3))
dxi=pomiary(:,2)-pomiary(:,1);
xi=pomiary(:,1)+dxi/2;
ni=pomiary(:,3);
Pi=ni/n;
xsr=sum(xi.*ni)/n;
dx2=(xi-xsr).^2.*ni;
s2=sum(dx2)/(n-1);
s2
s=sqrt(s2);
xsr,s
df=k-1-2
Poi=[];
for i=1:k
    xa=pomiary(i,1);
    xb=pomiary(i,2);
    za=(xa-xsr)/s;
    zb=(xb-xsr)/s;
    pr=prnab(xa,xb,xsr,s);
    Poi(i,1)=pr;
    i,xa,xb,za,zb,pr
end
Pi,Poi
dPiPoi2=(Pi-Poi).^2;
dPiPoi2przezPoi=dPiPoi2./Poi;
n
xsr
s2,s
fprintf('\n Lp        xd      xg        xi   ni Pi=ni/n  Poi (Pi-Poi)^2  (Pi-Poi)^2/Poi');
for i =1: k
    fprintf('\n %2d   %8.2f %8.2f %9.3f %4d %5.3f  %5.3f %8.4f     %8.4f',...
        i,pomiary(i,1), pomiary(i,2), xi(i), ni(i), Pi(i), Poi(i), dPiPoi2(i), dPiPoi2przezPoi(i) );
end
suma=sum(dPiPoi2przezPoi);
fprintf('\n                                                        suma = %8.4f',suma);
T=n*suma;

fprintf('\n statystyka T = n*suma = %d * %f =  %8.2f \n',n,suma,T);

ialfa=[];
ialfa=find(talfa==alfa)
fprintf('\n liczba klas k = %d\n ',k);
s=2; % do obliczenia Pi nie wyznaczano zadnych parametrow rozkladu
fprintf('\n liczba parametrow rozkladu potrzebnych do wyznaczenia Pi s=%d',s);
df=k-1-s;
fprintf('\n liczba stopni swobody df=k-1-s=%d-%d-%d=%d',k,1,s,df);
if df==0 df=1; fprintf('\n poniewaz df=0, przyjeto df=1 !!!'); end
chi2alfa=tabchi2(df,ialfa);
fprintf('\n dla alfa=%f i liczby stopni swobody df=k-1-s = %d',alfa,df);
fprintf('\n z tablic chi2 odczytano kwantyl chi2(alfa,df)=%8.2f\n',chi2alfa);


if T<=chi2alfa
    fprintf('\n Ho: Fo=N(m,sigma) - przyjeta,');
    fprintf('\n poniewaz T=%f  <  chi2alfa=%f',T,chi2alfa);
else
    fprintf('\n Ho: Fo=N(m,sigma) - odrzucona,');
    fprintf('\n poniewaz T=%f  >  chi2alfa=%f',T,chi2alfa);
end
plot(xi,Pi,'-b'); title('histogram');
xlabel('x'); ylabel('Pi=ni/n'); grid on;
fprintf('\n\nDalej? ENTER'); pause;
close;
fprintf('\n*******************  Kol. zal. Budownictwo - zad. 3**********************\n\n\n');




return