function testzgody
% Statystyka - test zgodnosci chi-kwadrat
%
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
fprintf('\n\n\n *******************  Lista 6 zad. 1 **********************');
fprintf('\n%% W celu sprawdzenia, czy kostka jest rzetelna (symetryczna)');
fprintf('\n%% wykonano 120 rzutow kostka i otrzymano wyniki zestawionow tabeli:');
fprintf('\n%% liczba oczek:     1    2   3   4   5   6');
fprintf('\n%% liczba rzutow:    11  30  14  10  33  32');
fprintf('\n%% Na poziomie istotnosci alfa=0.05 zweryfikowac hipoteze, ze kostka jest symetryczna.');
alfa=0.05

pomiary=[
%zmienna    ni  
1           11
2           30
3           14
4           10
5           33
6           22
];
[k,kk]=size(pomiary)
n=sum(pomiary(:,2))
xi=pomiary(:,1);
ni=pomiary(:,2);
Pi=ni/n;
xsr=sum(xi.*ni)/n;
dx2=(xi-xsr).^2.*ni;
s2=sum(dx2)/(n-1);
s=sqrt(s2);
xsr,s

Poi=[1/6; 1/6; 1/6; 1/6; 1/6; 1/6];
dPiPoi2=(Pi-Poi).^2;
dPiPoi2przezPoi=dPiPoi2./Poi;
Pi,Poi,
dPiPoi2, dPiPoi2przezPoi


fprintf('\n Lp        xd      xg        xi   ni Pi=ni/n  Poi (Pi-Poi)^2  (Pi-Poi)^2/Poi');
for i =1: k
    fprintf('\n %2d   %8.2f %8.2f %9.3f %4d %5.3f  %5.3f %9.5f     %9.5f',...
        i,pomiary(i,1), pomiary(i,1), xi(i), ni(i), Pi(i), Poi(i), dPiPoi2(i), dPiPoi2przezPoi(i) );
end
suma=sum(dPiPoi2przezPoi);
fprintf('\n                                                            suma = %8.5f',suma);
T=n*suma;

fprintf('\n statystyka T = n*suma = %d * %f =  %8.2f \n',n,suma,T);

ialfa=[];
ialfa=find(talfa==alfa)
fprintf('\n liczba klas k = %d\n ',k);
s=0; % do obliczenia Pi nie wyznaczano zadnych parametrow rozkladu
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
fprintf('\n*******************  Lista 6 zad. 1 **********************\n\n\n');



fprintf('\n\n\n *******************  Lista 6 zad. 2 **********************');
fprintf('\n%% W fabryce zaobserwowano rozklad absencji w tygodniu,');
fprintf('\n%% w wylosowanej probie 900 pracownikow z absencja, jak w tabeli:');
fprintf('\n%% liczba oczek:     1    2   3   4   5  6');
fprintf('\n%% liczba rzutow:   200 160  140 140 100 160');
fprintf('\n%% Na poziomie istotnosci alfa=0.05 zweryfikowac hipoteze, absencja jest jednakowa w kazdym dniu tygodnia.');
alfa=0.05
fprintf('\n\n Zweryfikowac hipoteze normalnosci rozkladu N(m,sigma) na poziomie istotnosci alfa = %f\n',alfa);
pomiary=[
%zmienna    ni  
1           200
2           160
3           140
4           140
5           100
6           160
];
[k,kk]=size(pomiary)
n=sum(pomiary(:,2))
xi=pomiary(:,1);
ni=pomiary(:,2);
Pi=ni/n;
xsr=sum(xi.*ni)/n;
dx2=(xi-xsr).^2.*ni;
s2=sum(dx2)/(n-1);
s=sqrt(s2);
xsr,s

Poi=[1/6; 1/6; 1/6; 1/6; 1/6; 1/6];
dPiPoi2=(Pi-Poi).^2;
dPiPoi2przezPoi=dPiPoi2./Poi;
Pi,Poi,
dPiPoi2, dPiPoi2przezPoi


fprintf('\n Lp        xd      xg        xi   ni Pi=ni/n  Poi (Pi-Poi)^2  (Pi-Poi)^2/Poi');
for i =1: k
    fprintf('\n %2d   %8.2f %8.2f %9.3f %4d %5.3f  %5.3f %9.5f     %9.5f',...
        i,pomiary(i,1), pomiary(i,1), xi(i), ni(i), Pi(i), Poi(i), dPiPoi2(i), dPiPoi2przezPoi(i) );
end
suma=sum(dPiPoi2przezPoi);
fprintf('\n                                                            suma = %8.5f',suma);
T=n*suma;

fprintf('\n statystyka T = n*suma = %d * %f =  %8.2f \n',n,suma,T);

ialfa=[];
ialfa=find(talfa==alfa)
fprintf('\n liczba klas k = %d\n ',k);
s=0; % do obliczenia Pi nie wyznaczano zadnych parametrow rozkladu
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
fprintf('\n*******************  Lista 6 zad. 2 **********************\n\n\n');




return