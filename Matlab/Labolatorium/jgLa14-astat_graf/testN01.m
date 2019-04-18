function testN01
% Statystyka - test chi-kwadrat normalnosci rozkladu
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
pomiary=[
%kpocz   kkonc      ni  
1300    2000        10
2000    2100        26
2100    2200        56
2200    2300        64
2300    2400        30
2400    2500        14
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
s=sqrt(s2);
xsr,s
df=k-1-2
Poi=[];
for i=1:k
    xa=pomiary(i,1);
    xb=pomiary(i,2);
    pr=prnab(xa,xb,xsr,s);
    Poi(i,1)=pr;
    i,xa,xb,pr
end
Pi,Poi
dPiPoi2=(Pi-Poi).^2;
dPiPoi2przezPoi=dPiPoi2./Poi;
T=n*sum(dPiPoi2przezPoi);
alfa=0.1
ialfa=[];
ialfa=find(talfa==alfa)
df
chi2alfa=tabchi2(df,ialfa)

if T<=chi2alfa
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - przyjeta',T,chi2alfa);
else
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - odrzucona',T,chi2alfa);
end

plot(xi,Pi,'-b'); title('histogram');
xlabel('x'); ylabel('Pi=ni/n'); grid on;
disp('Dalej? ENTER'); pause;
close;



return