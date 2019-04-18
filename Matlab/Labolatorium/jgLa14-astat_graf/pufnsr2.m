function punfsr2
%Statystyka stosowana - przedzialy ufnosci dla sredniej przy niznanym sigma
% m, sigma - nieznane
% wykorzystanie rozkladu Studenta
fprintf('\n Przyklad z wykladu');
xsr=2.1; s=1.41; n=10;
fprintf('\n\n PRZEDZIALY UFNOSCI dla wart. oczekiwanej, przy nieznanych: m, sigma');
fprintf('\n =====================================================================');
alfa=0.10;
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
fprintf('\n\n xsr=%f',xsr);
fprintf('\n n=%d,   s = %f\n',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, ta2=%f \n',1-alfa2,ta2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, ta =%f \n',1-alfa,ta);
T1=xsr-ta2*s/sqrt(n);
T2=xsr+ta2*s/sqrt(n);
fprintf('\n\n przedzial ufnosci dwustronny Pr(T1<m<T2)=1-alfa: T1=%f, T2=%f',T1,T2);
T1a=xsr-ta*s/sqrt(n);
T2a=xsr+ta*s/sqrt(n);
fprintf('\n\n przedzial ufnosci jednostronny Pr(m>T1a)=1-alfa: T1a=%f',T1a);
fprintf('\n\n przedzial ufnosci jednostronny Pr(m<T2a)=1-alfa: T2a=%f',T2a);

fprintf('\n Dalej? - ENTER'); pause;
fprintf('\n\n PRZEDZIALY UFNOSCI dla wariancji');
fprintf('\n ==================================');
alfa=0.10;
alfa2=alfa/2;
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n alfa/2 = %f',alfa2');
fprintf('\n ODCZYTAJ z tablic rozkladu chikwadrat Pr(chi2<c1)=alfa2 \n'); 
c1=input('\n PODAJ odczytana wartosc c1 = ');
fprintf('\n\n ***');
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n 1-alfa/2 = %f',1-alfa2');
fprintf('\n ODCZYTAJ z tablic rozkladu chikwadrat Pr(chi2<c2)=1-alfa2 \n'); 
c2=input('\n PODAJ odczytana wartosc c2 = ');
fprintf('\n\n ***');
c1,c2
fprintf('\n n=%d,   s = %f\n',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n kwantyl rzedu alfa/2   = %f, c1=%f \n',alfa2,c1);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, c2=%f \n',1-alfa2,c2);
W1=n*s^2/c2;
W2=n*s^2/c1;
fprintf('\n\n przedzial ufnosci dwustronny Pr(W1<sigma^2<W2)=1-alfa: W1=%f, W2=%f',W1,W2);
fprintf('\n Dalej? - ENTER'); pause;




fprintf('\n\n ========================\n');
fprintf('\nStatystyka stosowana - Lista 4 - zad. 1 \n');
%
alfa=0.01;
alfa2=alfa/2;
xsr=20.8;
s=2.8;
n=5;

fprintf('\n\n PRZEDZIALY UFNOSCI dla wart. oczekiwanej, przy nieznanych: m, sigma');
fprintf('\n =====================================================================');
alfa=0.10;
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
fprintf('\n\n xsr=%f',xsr);
fprintf('\n n=%d,   s = %f\n',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, ta2=%f \n',1-alfa2,ta2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, ta =%f \n',1-alfa,ta);
T1=xsr-ta2*s/sqrt(n);
T2=xsr+ta2*s/sqrt(n);
fprintf('\n\n przedzial ufnosci dwustronny Pr(T1<m<T2)=1-alfa: T1=%f, T2=%f',T1,T2);
T1a=xsr-ta*s/sqrt(n);
T2a=xsr+ta*s/sqrt(n);
fprintf('\n\n przedzial ufnosci jednostronny Pr(m>T1a)=1-alfa: T1a=%f',T1a);
fprintf('\n\n przedzial ufnosci jednostronny Pr(m<T2a)=1-alfa: T2a=%f',T2a);

fprintf('\n Dalej? - ENTER'); pause;
fprintf('\n\n PRZEDZIALY UFNOSCI dla wariancji');
fprintf('\n ==================================');
alfa=0.05;
alfa2=alfa/2;
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n alfa/2 = %f',alfa2');
fprintf('\n ODCZYTAJ z tablic rozkladu chikwadrat Pr(chi2<c1)=alfa2 \n'); 
c1=input('\n PODAJ odczytana wartosc c1 = ');
fprintf('\n\n ***');
fprintf('\n liczba stopni swobody n-1 = %d',n-1);
fprintf('\n 1-alfa/2 = %f',1-alfa2');
fprintf('\n ODCZYTAJ z tablic rozkladu chikwadrat Pr(chi2<c2)=1-alfa2 \n'); 
c2=input('\n PODAJ odczytana wartosc c2 = ');
fprintf('\n\n ***');
c1,c2
fprintf('\n n=%d,   s = %f\n',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n kwantyl rzedu alfa/2   = %f, c1=%f \n',alfa2,c1);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, c2=%f \n',1-alfa2,c2);
W1=n*s^2/c2;
W2=n*s^2/c1;
fprintf('\n\n przedzial ufnosci dwustronny Pr(W1<sigma^2<W2)=1-alfa: W1=%f, W2=%f',W1,W2);
fprintf('\n Dalej? - ENTER'); pause;

return