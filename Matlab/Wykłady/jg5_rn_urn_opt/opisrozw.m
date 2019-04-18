function opisrozw(fd,x0,x,fval,exitflag,output);
% opis rozwiazania
fprintf(fd,'\n\n---------------------------------');
fprintf(fd,'\n O P I S    R O Z W I A Z A N I A');
fprintf(   '\n\n---------------------------------');
fprintf(   '\n O P I S    R O Z W I A Z A N I A');
fprintf(fd,'\n zmienna  PunktStartowy Rozwiazanie');
fprintf(   '\n zmienna  PunktStartowy Rozwiazanie');
n=length(x);
for i=1:n
    fprintf(fd,'\n %2d    %8.4g   %8.4g',i,x0(i),x(i));
    fprintf(   '\n %2d    %8.4g   %8.4g',i,x0(i),x(i));
end
fprintf(fd,'\n fval = %8.4e',fval);
fprintf(   '\n fval = %8.4e',fval);
fprintf(fd,'\n exitflag = %d',exitflag);
fprintf(   '\n exitflag = %d',exitflag);
switch exitflag 
    case -4
fprintf(fd,'\n -4 - nie mozna zmnieszyc kroku w kierunku poszukiwan');
fprintf(   '\n -4 - nie mozna zmnieszyc kroku w kierunku poszukiwan');
    case -3
        fprintf(fd,'\n -3 - promien poszukiwan zbyt maly');
        fprintf(   '\n -3 - promien poszukiwan zbyt maly');
    case -2
fprintf(fd,'\n -2 - algorytm zakonczyl obliczenia, ale x nie jest rozwiazaniem');
fprintf(   '\n -2 - algorytm zakonczyl obliczenia, ale x nie jest rozwiazaniem');
    case -1
fprintf(fd,'\n -1 - obliczenia zakonczone przez funkcje wyjscia');
fprintf(   '\n -1 - obliczenia zakonczone przez funkcje wyjscia');
    case 0
fprintf(fd,'\n  0 - przekroczona maksymalna liczba iteracji');
fprintf(   '\n  0 - przekroczona maksymalna liczba iteracji');
    case 1
fprintf(fd,'\n  1 - x rozwiazanie zbiezne');
fprintf(   '\n  1 - x rozwiazanie zbiezne');
    case 2
fprintf(fd,'\n  2 - proces iteracyjny zbiezny do punktu nie bedascego rozwiazaniem');
fprintf(   '\n  2 - proces iteracyjny zbiezny do punktu nie bedascego rozwiazaniem');
    case 3
fprintf(fd,'\n  3 - promien obszary zbyt maly');
fprintf(   '\n  3 - promien obszary zbyt maly');
    case 4
        fprintf(fd,'\n  4 - krok w kierunku szukania mniejszy od dokladnosci');
        fprintf(   '\n  4 - krok w kierunku szukania mniejszy od dokladnosci');
    otherwise
fprintf(fd,'\n inny przypadek');
fprintf(   '\n inny przypadek');
end
fprintf(fd,'\n output.iterations    - liczba iteracji  = %4d',output.iterations);
fprintf(fd,'\n output.funcCount     - liczba obliczania funkcji  = %4d',output.funcCount);
fprintf(fd,'\n output.algorithm     - zastosowany algorytm  = %s',output.algorithm);
%fprintf(fd,'\n output.cgiterations  - liczba iteracji CG = %d',output.cgiterations); % tylko dla 'LargeScale'='on'
%fprintf(fd,'\n output.firstorderopt - koncowe podstawienie w algorytmie Levenberg-Marquardt = %8.5e',output.firstorderopt);
fprintf(fd,'\n output.message       - komunikat koncowy  = %s',output.message);
fprintf(fd,'\n K O N I E C     O P I S U     R O Z W I A Z A N I A     wg fsolve()');
fprintf(fd,'\n -------------------------------------------------------------------\n'); 
fprintf(   '\n output.iterations    - liczba iteracji  = %4d',output.iterations);
fprintf(   '\n output.funcCount     - liczba obliczania funkcji  = %4d',output.funcCount);
fprintf(   '\n output.algorithm     - zastosowany algorytm  = %s',output.algorithm);
%fprintf(   '\n output.cgiterations  - liczba iteracji CG = %d',output.cgiterations); % tylko dla 'LargeScale'='on'
%fprintf(   '\n output.firstorderopt - koncowe podstawienie w algorytmie Levenberg-Marquardt = %8.5e',output.firstorderopt);
fprintf(   '\n output.message       - komunikat koncowy  = %s',output.message);
fprintf(   '\n K O N I E C     O P I S U     R O Z W I A Z A N I A     wg fsolve()');
fprintf(   '\n -------------------------------------------------------------------\n'); 
return



