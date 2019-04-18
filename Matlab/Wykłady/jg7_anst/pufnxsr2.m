function pufnxsr2
%Statystyka stosowana -  test dla sredniej - model 2, czyli N(m,sigma), sigma NIEZNAE
% Nalezy uzyc nieobciazonej estamaty wariancji
% var=1/(n-1)*suma(xi-xsr)^2
%Statystyka stosowana - przedzialy ufnosci dla sredniej przy niznanym sigma
% m, sigma - nieznane
% wykorzystanie rozkladu Studenta
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


fprintf('\n Przyklad z wykladu');
xsr=135; s=40; n=26;
m=120; % testowana wartosc oczekiwana
% TESTOWANIE dla alfa=0.05;
alfa=0.05;
fprintf('\nTest Studenta dla alfa=%f\n',alfa);
fprintf('\n==========================\n');
alfa2=alfa/2;
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n 1-alfa/2 = %f',1-alfa2');
fprintf('\n ODCZYTAJ z tablic rozkladu Studenta Pr(T<ta2)=1-alfa2 \n'); 
ta2=input('\n PODAJ odczytana wartosc ta2 = ');
fprintf('\n\n ***');
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n 1-alfa = %f',1-alfa');
fprintf('\n ODCZYTAJ z tablic rozkladu Studenta Pr(T<ta)=1-alfa \n');
ta=input('\n PODAJ odczytana wartosc ta = ');
ta2
ta
fprintf('\n\n xsr=%f,   m=mo=%f',xsr, m);
fprintf('\n n=%d,   s = %f',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, ta2=%f',1-alfa2,ta2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, ta =%f',1-alfa,ta);
fprintf('\n xsr=%f,    testowana wartosc oczekiwana, Ho: m=mo=%f',xsr,m);
fprintf('\n n=%d,   s = %f',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, za2=%f',1-alfa2,ta2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, za =%f',1-alfa,ta);
To=(xsr-m)/s*sqrt(n);
fprintf('\n\n statystyka do weryfikacji hipotezy Ho: m=mo=%f',m);
fprintf('\n czyli To=(xsr-m)/sigma*sqrt(n) = %f',To);
fprintf('\n kwantyl dla 1-alfa ta = %f, przy statystyce To=%f',ta, To);
fprintf('\n\n *** WERYFIKACJA hipotez Ho, H1, H2, H3 ***');
Ho=1;
if To<-ta | To>ta 
fprintf('\n Ho: m=mo=%f - hipoteza odrzucona na rzecz hipotez alternatywnych', m);
Ho=0;
else
fprintf('\n Ho: m=mo=%f - hipoteza przyjeta', m);
end
fprintf('\n\n Hipotezy alternatywne:');
fprintf('\n kwantyl dla 1-alfa/2 ta2 = %f',ta2);
fprintf('\n\n H1: m<>mo - Q{(-inf,ta2)lub(ta2,inf)}, czyli dla 1-alfa/2 mamy ta2=%f',ta2);
fprintf('\n\n H2: m>mo  - Q(ta,inf),   czyli dla 1-alfa mamy  ta=%f', ta);
if To>ta fprintf('  - hipoteza H2 przyjeta, gdyz %f > %f',To,ta); end
fprintf('\n\n H3: m<mo  - Q(-inf,-ta), czyli dla 1-alfa mamy -ta=%f',-ta);
if To<-ta fprintf('  - hipoteza przyjeta H3, gdyz %f < %f',To,-ta); end


fprintf('\n\n *******************  Lista 5 zad. 2 **********************');
fprintf('\n%% Wylosowano 26 chorych do pomiaru cisnienia. Uzyskano xsr=135 i s=40.');
fprintf('\n%% Zakladajac N(m,sigma) zweryfikowac hipoteze na poziomie ufnosci alfa=0.05,');
fprintf('\n%% Czy na poziomie istotnosci alfa = 0.05 mozna zweryfikowac hipoteze,');
fprintf('\n%% ze pacjencji pochodza z populacji o srednim cisnieniu 120.');
fprintf('\n%%H0: m=mo, tzn. abs(Zo)<za');
sigma=40; xsr=135; n=26;
m=120; % Ho - hipoteza zerowa
alfa=0.05;
fprintf('\nTest Studenta dla alfa=%f\n',alfa);
fprintf('\n==========================\n');
alfa2=alfa/2;
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n 1-alfa/2 = %f',1-alfa2');
fprintf('\n ODCZYTAJ z tablic rozkladu Studenta Pr(T<ta2)=1-alfa/22, alfa/2 = %f\n',alfa2); 
ta2=input('\n PODAJ odczytana wartosc ta2 = ');
fprintf('\n\n ***');
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n 1-alfa = %f',1-alfa');
fprintf('\n ODCZYTAJ z tablic rozkladu Studenta Pr(T<ta)=1-alfa, alfa = %f \n',alfa);
ta=input('\n PODAJ odczytana wartosc ta = ');
ta2
ta
fprintf('\n\n xsr=%f,   m=mo=%f',xsr, m);
fprintf('\n n=%d,   s = %f',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, ta2=%f',1-alfa2,ta2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, ta =%f',1-alfa,ta);
fprintf('\n xsr=%f,    testowana wartosc oczekiwana, Ho: m=mo=%f',xsr,m);
fprintf('\n n=%d,   s = %f',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, za2=%f',1-alfa2,ta2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, za =%f',1-alfa,ta);
To=(xsr-m)/s*sqrt(n);
fprintf('\n\n statystyka do weryfikacji hipotezy Ho: m=mo=%f',m);
fprintf('\n czyli To=(xsr-m)/sigma*sqrt(n) = %f',To);
fprintf('\n kwantyl dla 1-alfa ta = %f, przy statystyce To=%f',ta, To);
fprintf('\n\n *** WERYFIKACJA hipotez Ho, H1, H2, H3 ***');
Ho=1;
if To<-ta | To>ta 
fprintf('\n Ho: m=mo=%f - hipoteza odrzucona na rzecz hipotez alternatywnych', m);
Ho=0;
else
fprintf('\n Ho: m=mo=%f - hipoteza przyjeta', m);
end
fprintf('\n\n Hipotezy alternatywne:');
fprintf('\n kwantyl dla 1-alfa/2 ta2 = %f',ta2);
fprintf('\n\n H1: m<>mo - Q{(-inf,ta2)lub(ta2,inf)}, czyli dla 1-alfa/2 mamy ta2=%f',ta2);
fprintf('\n\n H2: m>mo  - Q(ta,inf),   czyli dla 1-alfa mamy  ta=%f', ta);
if To>ta fprintf('  - hipoteza H2 przyjeta, gdyz %f > %f',To,ta); end
fprintf('\n\n H3: m<mo  - Q(-inf,-ta), czyli dla 1-alfa mamy -ta=%f',-ta);
if To<-ta fprintf('  - hipoteza przyjeta H3, gdyz %f < %f',To,-ta); end
fprintf('\n*******************  Lista 5 zad. 2 - koniec rozwiazania **********************\n');


return