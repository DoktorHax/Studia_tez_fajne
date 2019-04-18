function testsr2
%Statystyka stosowana -  test dla sredniej - model 2, czyli N(m,sigma), sigma NIEZNAE
% Nalezy uzyc nieobciazonej estamaty wariancji
% var=1/(n-1)*suma(xi-xsr)^2
%Statystyka stosowana - przedzialy ufnosci dla sredniej przy niznanym sigma
% m, sigma - nieznane
% wykorzystanie rozkladu Studenta

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