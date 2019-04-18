function testchi2(fd,xopis,pomiary)
% Statystyka - test chi-kwadrat zgodnosci z rozkladem normalnym N(0,1)
fprintf('\n\n testchi2() - poczatek testu chi-kwadrat');
if nargin<3
      %dane dot. temperatury otoczenia przewodow linii wysokiego napiecia
pomiary=[
%kpocz   kkonc      ni  
-20     -16     1
-16     -12     2
-12     -8      6
-8      -4      39
-4      0       105
0       4       141
4       8       165
8       12      165
12      16      158
16      20      109
20      24      62
24      28      33
28      32      10 ];
end
if nargin<2
    xopis='x';
end
if nargin<1
    fd=fopen('testchi2OUT.m','wt');
end% tabela rozkladu chi2
tabchi2=[
%l.st.swobody   0.10        0.05      0.02        0.01
1               2.7055      3.8415    5.4119      6.6349
2               4.6052      5.9915    7.8240      9.2103
3               6.2514      7.8147    9.8374     11.3449
4               7.7794      9.4877   11.6678     13.2767
5               9.2364      11.0705  13.3882     15.0863
6               10.6446     12.5916  15.0332     16.8119
7               12.0170     14.0671  16.6224     18.4753
8               13.3616     15.5073  18.1682     20.0902
9               14.6837     16.9190  19.6790     21.6660
10              15.9872     18.3070  21.1608     23.2093 
];

% tabela rozkladu Studenta
talfa=[0    0.10    0.05    0.02    0.01];
%
fprintf(fd,'\n\n Test chi2 dla rozkladu normalnego zm. losowej - %s',xopis);
alfa=0.01;
[k,kk]=size(pomiary);
n=sum(pomiary(:,3));
dxi=pomiary(:,2)-pomiary(:,1);
xi=pomiary(:,1)+dxi/2;
ni=pomiary(:,3);
Pi=ni/n;
xsr=sum(xi.*ni)/n;
dx2=(xi-xsr).^2.*ni;
s2=sum(dx2)/(n-1);
%s2
s=sqrt(s2);
%xsr,s
df=k-1-2;
Poi=[];
for i=1:k
    xa=pomiary(i,1);
    xb=pomiary(i,2);
    za=(xa-xsr)/s;
    zb=(xb-xsr)/s;
    pr=prnab(xsr,s,xa,xb);
    Poi(i,1)=pr;
   % i,xa,xb,za,zb,pr
end
%Pi,Poi
dPiPoi2=(Pi-Poi).^2;
dPiPoi2przezPoi=dPiPoi2./Poi;
fprintf(fd,'\n x = %s',xopis);
fprintf(fd,'\n Lp           xd        xg        xi   ni    Pi=ni/n         Poi   (Pi-Poi)^2  (Pi-Poi)^2/Poi');
for i =1: k
    fprintf(fd,'\n %4d  %9.8g %9.8g %9.8g %4d %9.8g  %9.8g %9.8g %9.8g',...
        i,pomiary(i,1), pomiary(i,2), xi(i), ni(i), Pi(i), Poi(i), dPiPoi2(i), dPiPoi2przezPoi(i) );
end
%sumdPiPoi2przezPoi=sum(dPiPoi2przezPoi)
T=n*sum(dPiPoi2przezPoi);
fprintf(fd,'\n statystyka T = %f\n',T);
ialfa=[];
ialfa=find(talfa==alfa);
fprintf(fd,'\n liczba klas k = %d\n ',k);
r=2; % do obliczenia Pi nie wyznaczano zadnych parametrow rozkladu
fprintf(fd,'\n liczba parametrow rozkladu potrzebnych do wyznaczenia Pi r=%d',r);
df=k-1-r;
fprintf(fd,'\n liczba stopni swobody df=k-1-s=%d-%d-%d=%d\n',k,1,r,df);
chi2alfa=tabchi2(df,ialfa);
fprintf(fd,'\n dla alfa=%f i liczby stopni swobody df=%d, z tablic chi2 odczytano kwantyl chi2=%f\n',...
    alfa,df,chi2alfa);
if T<=chi2alfa
    fprintf(fd,'\n Ho: Fo=N(m,sigma) - przyjeta,');
    fprintf(fd,'\n poniewaz T=%f  <  chi2alfa=%f',T,chi2alfa);
else
    fprintf(fd,'\n Ho: Fo=N(m,sigma) - odrzucona,');
    fprintf(fd,'\n poniewaz T=%f  >  chi2alfa=%f',T,chi2alfa);
    fprintf(fd,'\n*** koniec testu chi2 rozkl. N(m,s) dla x = %s ***',xopis);
end
fprintf('\n\n testchi2() - koniec testu chi-kwadrat');
end

 
