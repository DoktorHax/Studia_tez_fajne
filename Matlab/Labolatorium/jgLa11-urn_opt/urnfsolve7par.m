function urnfsolve7par
t0=clock; % poczatek obliczen
fd  =fopen('urnfsolve7parOUT.m','wt');
fprintf(fd,'\n Uklad rownan zdefiniowny w funkcji  f=urn7par(x,p1,p2,p3,p4,p5,p6,p7)');
fprintf(fd,'\n f(1)=a* x(1)^2 + b*x(2)^2 +c*x(3)^2-4;');
fprintf(fd,'\n f(2)=d*x(1)*x(2)-1;');
fprintf(fd,'\n f(3)=e*x(1)*x(2)+f*x(1)*x(3)+g*x(2)*x(3)-2;');
fprintf(fd,'\n zostanie rozwiazany za pomoca fsolve z uzyciem wskaznika do funkcji');
fprintf(fd,'\n [x,fval,exitflag,output]=fsolve(@(x) urn7par(x,a,b,c,d,e,f,g),x0,options);');
%
a=1; b=1; c=1; d=1; e=1; f=1; g=1;
%par=[a b c d e f g];
options=optimset('Display','on','LargeScale','off','MaxIter',100,'TolCon',1e-4,'TolFun',1e-4,'TolX',1e-4);
%
fprintf(fd,'\n\n options=optimset(''Display'',''off'',''LargeScale'',''off'',''MaxIter'',100,''TolCon'',1e-4,''TolFun'',1e-4,''TolX'',1e-4);');
 
% 1-szy p. startowy
x0=[1 22 333]; x=x0; % punkt startowy obliczen
fprintf('\n\n 1-szy punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
%
%2-gi punkt startowy
x0=[-1 -22 -333]; x=x0; % punkt startowy obliczen
fprintf('\n\n\n 2-gi punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
 
%3-ci punkt startowy
x0=[1 2 -3]; x=x0; % punkt startowy obliczen
fprintf('\n\n\n 2-gi punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
 
%4-ty punkt startowy
x0=[1.1 0.9 1.0]; x=x0; % punkt startowy obliczen
fprintf('\n\n\n 2-gi punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
%
et=etime(clock,t0); % czas obliczen
fprintf(fd,'\n Czas obliczen programem urnsolve tobl = %.2f sekund !', et);
fprintf(   '\n Czas obliczen programem urnsolve tobl = %.2f sekund !', et);
fclose('all');
fprintf('\n\n *** Wyniki w pliku urnfsolve7parOUT.m *** \n\n');
end


function f = urn7par(x,p1,p2,p3,p4,p5,p6,p7)
% uklad rownan
%p1=par(1); p2=par(2); p3=par(3); p4=par(4);
%p5=par(5); p6=par(6); p7=par(7);
f(1)= p1*x(1)^2 + p2*x(2)^2 +p3*x(3)^2-4;
f(2)=p4*x(1)*x(2)-1;
f(3)=p5*x(1)*x(2)+p6*x(1)*x(3)+p7*x(2)*x(3)-2;
end




function opisrozw(fd,x0,x,fval,exitflag,output);
% opis rozwiazania
fprintf(fd,'\n\n O P I S    R O Z W I A Z A N I A \n');
fprintf(   '\n\n O P I S    R O Z W I A Z A N I A \n');
fprintf(fd,'\n zmienna  PunktStartowy Rozwiazanie');
fprintf(   '\n zmienna  PunktStartowy Rozwiazanie');
n=length(x);
for i=1:n
    fprintf(fd,'\n %2d    %8.4f   %8.4f',i,x0(i),x(i));
    fprintf(   '\n %2d    %8.4f   %8.4f',i,x0(i),x(i));
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
fprintf(fd,'\n output.firstorderopt - koncowe podstawienie w algorytmie Levenberg-Marquardt = %8.5e',output.firstorderopt);
fprintf(fd,'\n output.message       - komunikat koncowy  = %s',output.message);
fprintf(fd,'\n K O N I E C     O P I S U \n');
 
fprintf(   '\n output.iterations    - liczba iteracji  = %4d',output.iterations);
fprintf(   '\n output.funcCount     - liczba obliczania funkcji  = %4d',output.funcCount);
fprintf(   '\n output.algorithm     - zastosowany algorytm  = %s',output.algorithm);
%fprintf(   '\n output.cgiterations  - liczba iteracji CG = %d',output.cgiterations); % tylko dla 'LargeScale'='on'
fprintf(   '\n output.firstorderopt - koncowe podstawienie w algorytmie Levenberg-Marquardt = %8.5e',output.firstorderopt);
fprintf(   '\n output.message       - komunikat koncowy  = %s',output.message);
fprintf(   '\n K O N I E C     O P I S U \n');
end

