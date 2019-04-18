function testpro1
%Statystyka stosowana -  test dla roznicy dwoch proporcji - model 1, czyli N(m,sigma), sigma znane
%kwantyle rozkladu N(0,1)
kwantyle=[
% prawdopod.        kwantyl N(0,1)
     0.900         1.282
     0.905         1.311
     0.910         1.341
     0.915         1.373
     0.920         1.406
     0.925         1.440
     0.930         1.476
     0.935         1.515
     0.940         1.555
     0.945         1.599
     0.950         1.645
     0.955         1.696
     0.960         1.751
     0.965         1.812
     0.970         1.881
     0.975         1.960
     0.980         2.054
     0.985         2.171
     0.990         2.327
     0.995         2.576
 ];
 
% Oszacowac przedzialy ufnosci wartosci oczekiwanej na poziomie ufnosci

%alfa     0.1   0.09	0.08	0.07	0.06	0.05    0.04	0.03	0.02	0.01
%alfa/2	  0.05	0.045	0.04	0.035	0.03	0.025	0.02	0.015	0.01	0.005

%1-alfa2  0.95	0.955	0.96	0.965	0.97	0.975	0.98	0.985	0.99	0.995
%zalfa/2  1.64  1.65	1.75	1.81	1.88	1.96    2.05	2.17	2.33	2.58

%1-alfa	  0.90	0.91	0.92	0.93	0.94	0.95	0.96	0.97	0.98	0.99
%zalfa    1.28  1.34	1.41	1.48	1.56	1.64    1.75	1.88	2.05	2.33




fprintf('\n 1-sza próba\n');
m1=42
n1=48
pest1=m1/n1
fprintf('\n 2-ga próba\n');
m2=36
n2=48
pest2=m2/n2
%
pest=(m1+m2)/(n1+n2)
qest=1-pest
varpq=pest*qest*(1/n1+1/n2);
 % Ho - hipoteza zerowa

% TESTOWANIE dla alfa=0.05;
alfa=0.01;
fprintf('\n==========================\n');
fprintf('\nTest dla alfa=%f\n',alfa);
fprintf('\n==========================\n');
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa);
ipr1=ipr(1); za=kwantyle(ipr1,2);
alfa2=alfa/2;
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa2);
ipr1=ipr(1); za2=kwantyle(ipr1,2);
% za2=1.96; za=1.64;
fprintf('\n pest1=%f,   pest2=%f testowana proporcja, Ho: p1=p2\n',pest1,pest2);
fprintf('\n n1=%d, n2=%d   varpq = %f\n',n1,n2,varpq);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, za2=%f \n',1-alfa2,za2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, za =%f \n',1-alfa,za);
pest12=pest1-pest2
Zo=(pest1-pest2)/sqrt(varpq)
fprintf('\n\n statystyka do weryfikacji hipotezy Ho: p1=p2\n');
fprintf('\n czyli Zo=(pest1-pest2)/sqrt(varpq) = %f',Zo);
fprintf('\n kwantyl dla 1-alfa za = %f, przy statystyce Zo=%f',za, Zo);
fprintf('\n *** WERYFIKACJA hipotez Ho, H1, H2, H3 ***');
Ho=1;
if Zo<-za | Zo>za 
fprintf('\n Ho: p1-p2=0 - hipoteza odrzucona na rzecz hipotez alternatywnych');
Ho=0;
else
fprintf('\n Ho: p1-p2 - hipoteza przyjeta, gdyz Zo<-za | Zo>za');
end
fprintf('\nHipotezy alternatywne:');
fprintf('\n kwantyl dla 1-alfa/2 za2 = %f',za2);
fprintf('\nH1: p1<>p2 - Q{(-inf,za2)lub(za2,inf)}, czyli dla 1-alfa/2 mamy za2=%f',za2);
fprintf('\nH2: p1>p2  - Q(za,inf),   czyli dla 1-alfa mamy  za=%f', za);
if Zo>za fprintf('  - hipoteza H2 przyjeta, gdyz %f > %f',Zo,za); end
fprintf('\nH3: p1<p2  - Q(-inf,-za), czyli dla 1-alfa mamy -za=%f',-za);
if Zo<-za fprintf('  - hipoteza przyjeta H3, gdyz %f < %f',Zo,-za); end



fprintf('\n\n *******************  Lista 5 zad. 10 **********************');
fprintf('\n%% Sposrod 296 losowo wybranych kobiet stwierdzilo, ze przy kupowaniu koszul zwracaja uwage na marke.');
fprintf('\n%% Wsrod 251 mezczyzn 27 przynalo sie do analogicznego zachowania.');
fprintf('\n%% Na poziomie istotnosci alfa = 0.01 zweryfikowac hipoteze zerowa,');
fprintf('\n%% o rownosci proporcji pK i pM kobiuet i mezczyzn zwracjacych uwage na marke koszul.');
fprintf('\n%%H0: pK-pM');

fprintf('\n 1-sza próba - KOBIETY\n');
m1=63
n1=296
pest1=m1/n1
fprintf('\n 2-ga próba - MEZCZYZNI\n');
m2=27
n2=251
pest2=m2/n2
%
pest=(m1+m2)/(n1+n2)
qest=1-pest
varpq=pest*qest*(1/n1+1/n2);
 % Ho - hipoteza zerowa

% TESTOWANIE dla alfa=0.05;
alfa=0.01;
fprintf('\nTest dla alfa=%f',alfa);
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa);
ipr1=ipr(1); za=kwantyle(ipr1,2);
alfa2=alfa/2;
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa2);
ipr1=ipr(1); za2=kwantyle(ipr1,2);
% za2=1.96; za=1.64;
fprintf('\n pest1=%f,   pest2=%f testowana proporcja, Ho: p1=p2',pest1,pest2);
fprintf('\n n1=%d, n2=%d   varpq = %f',n1,n2,varpq);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, za2=%f',1-alfa2,za2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, za =%f',1-alfa,za);
pest12=pest1-pest2
Zo=(pest1-pest2)/sqrt(varpq)
fprintf('\n\n statystyka do weryfikacji hipotezy Ho: p1=p2');
fprintf('\n czyli Zo=(pest1-pest2)/sqrt(varpq) = %f',Zo);
fprintf('\n kwantyl dla 1-alfa za = %f, przy statystyce Zo=%f',za, Zo);
fprintf('\n *** WERYFIKACJA hipotez Ho, H1, H2, H3 ***');
Ho=1;
if Zo<-za | Zo>za 
fprintf('\n Ho: p1-p2=0 - hipoteza odrzucona na rzecz hipotez alternatywnych');
Ho=0;
else
fprintf('\n Ho: p1-p2 - hipoteza przyjeta, gdyz Zo<-za | Zo>za');
end
fprintf('\nHipotezy alternatywne:');
fprintf('\n kwantyl dla 1-alfa/2 za2 = %f',za2);
fprintf('\nH1: p1<>p2 - Q{(-inf,za2)lub(za2,inf)}, czyli dla 1-alfa/2 mamy za2=%f',za2);
fprintf('\nH2: p1>p2  - Q(za,inf),   czyli dla 1-alfa mamy  za=%f', za);
if Zo>za fprintf('  - hipoteza H2 przyjeta, gdyz %f > %f',Zo,za); end
fprintf('\nH3: p1<p2  - Q(-inf,-za), czyli dla 1-alfa mamy -za=%f',-za);
if Zo<-za fprintf('  - hipoteza przyjeta H3, gdyz %f < %f',Zo,-za); end


fprintf('\n*******************  Lista 5 zad. 10 - koniec rozwiazania **********************\n');



return