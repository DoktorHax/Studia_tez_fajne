function testpro1
%Statystyka stosowana -  test dla proporcji - model 1, czyli N(m,sigma), sigma znane
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



fprintf('\n Przyklad z wykladu - list 5 zad. 9');
m=14
n=70
pest=m/n
qest=1-pest
s2=pest*qest
s2n=s2/n

p=0.25; % Ho - hipoteza zerowa

% TESTOWANIE dla alfa=0.05;
alfa=0.05;
fprintf('\n==========================\n');
fprintf('\nTest dla alfa=%f\n',alfa);
fprintf('\n==========================\n');
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa);
ipr1=ipr(1); za=kwantyle(ipr1,2);
alfa2=alfa/2;
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa2);
ipr1=ipr(1); za2=kwantyle(ipr1,2);
% za2=1.96; za=1.64;
fprintf('\n pest=%f,    testowana proporcja, Ho: p=po=%f',pest,p);
fprintf('\n n=%d,   s2 = %f,     s2/n =%f\n',n,s2,s2n);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, za2=%f \n',1-alfa2,za2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, za =%f \n',1-alfa,za);
s2n
pestmp=pest-p
Zo=(pest-p)/sqrt(s2/n)
fprintf('\n\n statystyka do weryfikacji hipotezy Ho: p=po=%f',p);
fprintf('\n czyli Zo=(pest-p)/sqrt(s2/n) = %f',Zo);
fprintf('\n kwantyl dla 1-alfa za = %f, przy statystyce Zo=%f',za, Zo);
fprintf('\n\n *** WERYFIKACJA hipotez Ho, H1, H2, H3 ***');
Ho=1;
if Zo<-za | Zo>za 
fprintf('\n Ho: p=po=%f - hipoteza odrzucona na rzecz hipotez alternatywnych', p);
Ho=0;
else
fprintf('\n Ho: p=po=%f - hipoteza przyjeta, gdyz Zo>-za & Zo<za', p);
end
fprintf('\n\n Hipotezy alternatywne:');
fprintf('\n kwantyl dla 1-alfa/2 za2 = %f',za2);
fprintf('\n\n H1: p<>po - Q{(-inf,za2)lub(za2,inf)}, czyli dla 1-alfa/2 mamy za2=%f',za2);
fprintf('\n\n H2: p>po  - Q(za,inf),   czyli dla 1-alfa mamy  za=%f', za);
fprintf('\n\n H3: p<po  - Q(-inf,-za), czyli dla 1-alfa mamy -za=%f',-za);


return