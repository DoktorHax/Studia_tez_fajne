function testniezal
% Statystyka - test chi-kwadrat - niezaleznosci zmiennych losowych
% lista 6, zad. 6
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
 % przyklad wg Edward Niedoks, Zastosowania rachunku prawd. i statystyki mat., 
pomiary=[
    48  25  52
    32  13  25
    94  33  91
];
Nij=[]; Ni=[]; Nj=[]; Pi=[]; Pj=[]; Pij=[];
[nrow,ncol]=size(pomiary)
Nij=pomiary
Ni=sum(Nij)
Nj=sum(Nij')
n=sum(Ni)
n=sum(Nj)
Pi=Ni/n
Pj=(Nj/n)'
Pij=Pj*Pi;

%Pij=Pj*Pi

for i=1:nrow
    fprintf('\n');
    for j=1:ncol
        fprintf(' N(%3d,%3d)=%4d ',i,j,Nij(i,j) );
    end
    fprintf('         %5d.    , Pj. = %5.2f\n',Nj(i),Pj(i) );
end
for j=1:ncol
    fprintf('     .%10d',Ni(j));
end
fprintf('\n');
for j=1:ncol
    fprintf('  Pi. = %9.2f',Pi(j));
end
fprintf('\n');
Pij
T=0;
for i=1:nrow
    for j=1:ncol
        nPij=n*Pij(i,j)
        T=T+( Nij(i,j)-n*Pij(i,j) )^2/(n*Pij(i,j));
    end
end
df=(nrow-1)*(ncol-1);
alfa=0.05
ialfa=[];
ialfa=find(talfa==alfa)
df
chi2alfa=tabchi2(df,ialfa)

if T<=chi2alfa
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - przyjeta',T,chi2alfa);
else
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - odrzucona',T,chi2alfa);
end

fprintf('\n\n *******************  Lista 6 zad. 5 **********************');
fprintf('\n%% W celu zweryfikowania hipotezy, ze studentcki lepiej zdaja egzaminy, niz studenci');
fprintf('\n%% wylosowano probe 200 stutendek i i studentow i otrzymano wyniki egzaminow jak w tabeli:');
fprintf('\n%%                 zdany    oblany');
fprintf('\n%% studenci         55       45');
fprintf('\n%% studentki        75       25');
fprintf('\n%% Na poziomie istotnosci alfa=0.05 zweryfikowac hipoteze o niezaleznosci wynikow od plci?');
Nij=[]; Ni=[]; Nj=[]; Pi=[]; Pj=[]; Pij=[];
pomiary=[];
pomiary=[
    55   45
    75   25
];
[nrow,ncol]=size(pomiary)
Nij=pomiary
Ni=sum(Nij)
Nj=sum(Nij')
n=sum(Ni)
n=sum(Nj)
Pi=Ni/n
Pj=(Nj/n)'
Pij=Pj*Pi;
for i=1:nrow
    fprintf('\n');
    for j=1:ncol
        fprintf(' N(%3d,%3d)=%4d ',i,j,Nij(i,j) );
    end
    fprintf('         %5d.    , Pj. = %5.2f\n',Nj(i),Pj(i) );
end
for j=1:ncol
    fprintf('     .%10d',Ni(j));
end
fprintf('\n');
for j=1:ncol
    fprintf('  Pi. = %9.2f',Pi(j));
end
fprintf('\n');
Pij
T=0;
for i=1:nrow
    for j=1:ncol
        nPij=n*Pij(i,j)
        T=T+( Nij(i,j)-n*Pij(i,j) )^2/(n*Pij(i,j));
    end
end
df=(nrow-1)*(ncol-1);
alfa=0.05
ialfa=[];
ialfa=find(talfa==alfa)
df
chi2alfa=tabchi2(df,ialfa)

if T<=chi2alfa
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - przyjeta',T,chi2alfa);
else
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - odrzucona',T,chi2alfa);
end



fprintf('\n\n *******************  Lista 6 zad. 6 **********************');
fprintf('\n%% Produkt jest wytwarzany trzema metodami. Wysunieto hipoteze, wadliwosc produktu nie zalezy od metody produkcji.');
fprintf('\n%% Wylosowano probe 270 sztuk wyrobu i otrzymano wyniki badan jak w tabeli:');
fprintf('\n%% Jakosc        metoda1    metoda2  metoda3');
fprintf('\n%% DOBRA          40         80          60');
fprintf('\n%% ZLA            10         60          20');
fprintf('\n%% Na poziomie istotnosci alfa=0.05 zweryfikowac hipoteze o niezaleznosci jakosci od metody produkcji?');
Nij=[]; Ni=[]; Nj=[]; Pi=[]; Pj=[]; Pij=[];
pomiary=[];
pomiary=[
    40  80  60
    10  60  20
];

[nrow,ncol]=size(pomiary)
Nij=pomiary
Ni=sum(Nij)
Nj=sum(Nij')
n=sum(Ni)
n=sum(Nj)
Pi=Ni/n
Pj=(Nj/n)'
Pij=Pj*Pi;

%Pij=Pj*Pi

for i=1:nrow
    fprintf('\n');
    for j=1:ncol
        fprintf(' N(%3d,%3d)=%4d ',i,j,Nij(i,j) );
    end
    fprintf('         %5d.    , Pj. = %5.2f\n',Nj(i),Pj(i) );
end
for j=1:ncol
    fprintf('     .%10d',Ni(j));
end
fprintf('\n');
for j=1:ncol
    fprintf('  Pi. = %9.2f',Pi(j));
end
fprintf('\n');
Pij
T=0;
for i=1:nrow
    for j=1:ncol
        nPij=n*Pij(i,j)
        T=T+( Nij(i,j)-n*Pij(i,j) )^2/(n*Pij(i,j));
    end
end
df=(nrow-1)*(ncol-1);
alfa=0.05
ialfa=[];
ialfa=find(talfa==alfa)
df
chi2alfa=tabchi2(df,ialfa)

if T<=chi2alfa
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - przyjeta',T,chi2alfa);
else
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - odrzucona',T,chi2alfa);
end


fprintf('\n\n *******************  Kolokwium Budownictwo **********************');
fprintf('\n%% W celu zweryfikowania hipotezy, o zaleznosci zachorowania na raka od palenia');
fprintf('\n%% wylosowano probe 874 osob i otrzymano wyniki egzaminow jak w tabeli:');
fprintf('\n%%                 ma raka    nie ma raka');
fprintf('\n%% pali               412       299');
fprintf('\n%% nie pali           32       131');
fprintf('\n%% Na poziomie istotnosci alfa=0.02 zweryfikowac hipoteze o niezaleznosci raka od palenia!');
Nij=[]; Ni=[]; Nj=[]; Pi=[]; Pj=[]; Pij=[];
pomiary=[];
pomiary=[
    412    299
    32     131
];
[nrow,ncol]=size(pomiary)
Nij=pomiary
Ni=sum(Nij)
Nj=sum(Nij')
n=sum(Ni)
n=sum(Nj)
Pi=Ni/n
Pj=(Nj/n)'
Pij=Pj*Pi;
for i=1:nrow
    fprintf('\n');
    for j=1:ncol
        fprintf(' N(%3d,%3d)=%4d ',i,j,Nij(i,j) );
    end
    fprintf('         %5d.    , Pj. = %5.2f\n',Nj(i),Pj(i) );
end
for j=1:ncol
    fprintf('     .%10d',Ni(j));
end
fprintf('\n');
for j=1:ncol
    fprintf('  Pi. = %9.2f',Pi(j));
end
fprintf('\n');
Pij
Nijteoria=n*Pij
dNij=Nij-Nijteoria
dNij2=dNij.^2
dNij2przezNijteoria=dNij2./Nijteoria
 
T=0;
for i=1:nrow
    for j=1:ncol
        nPij=n*Pij(i,j)
        T=T+( Nij(i,j)-n*Pij(i,j) )^2/(n*Pij(i,j));
    end
end
df=(nrow-1)*(ncol-1);
alfa=0.05
ialfa=[];
ialfa=find(talfa==alfa)
df
chi2alfa=tabchi2(df,ialfa)

if T<=chi2alfa
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - przyjeta',T,chi2alfa);
else
    fprintf('\n T=%f, chi2alfa=%f, czyli Ho: Fo=N(m,sigma) - odrzucona',T,chi2alfa);
end


return