function ero
fprintf('\n Program ero - Ekonomiczny Rozdzial Obciazen');
fd=fopen('eroOUT.m','wt');
PL=200;
PG1min=40;  PG1max=200; PG10=10;
PG2min=50;  PG2max=240; PG20=190;
x0 =[PG10  PG20]; % punkt startowy
x=x0;
% ograniczenia nier�wno�ciowe liniowe - brak
Aneq = []; % macierz ogranicze� liniowych nier�wno�ciowych
Bneq = [];     % wektor prawych stron ogranicze� nier�wno�ciowych liniowych
% ograniczenia r�wno�ciowe liniowe PG1+PG2=PL
Aeq = [ 1 1];  % macierz ogranicze� liniowych r�wno�ciowych
Beq = [PL];      % wektor prawych stron ogranicze� r�wno�ciowych liniowych
% ograniczenia nier�wno�ciowe na zmnienne decyzyjne
LB=[PG1min; PG2min]; % wektor ogranicze� dolnych
UB=[PG1max; PG2max];   % wektor ogranicze� g�rnych
% funkcja celu i jej gradient
[f,fgrad] = erofg(x);
% nieliniowe ograniczenia funkcyjne nierownosciowe i rownowsciowe - brak
C=[]; Ceq=[]; %puste
% ustalenie opcji procesu optymalizacji
options=optimset('display','iter','gradobj','on');
[x,fval,exitflag,output,lambda]=...
    fmincon(@erofg,x,Aneq,Bneq,Aeq,Beq,LB,UB,[],options);
fprintf(fd,'\n\n\n ************* OPTYMALIZACJA ******************');
fprintf(fd,'\n punkt startowy:');
fprintf(fd,'\n  %f',x0);
    [f0,fgrad0] = erofg(x0); % wartosc funckji celu przed optymalizacj�
fprintf(fd,'\n Funkcja celu przed optymalizacja f0 = %f',f0);
fprintf(fd,'\n ===============================================');
fprintf(fd,'\n rozwiazanie optymalne:');
fprintf(fd,'\n  %f',x);
    [f,fgrad] = erofg(x); % warto�� funkjci celu po optymalizacji
fprintf(fd,'\n Funkcja celu po optymalizacji f = %f',fval);
fprintf(fd,'\n exitflag = %d',exitflag);
fprintf(fd,'\n output.iterations = %d',output.iterations);
fprintf(fd,'\n output.funcCount  = %d',output.funcCount);
fprintf(fd,'\n output.algorithm = %s',output.algorithm);
fprintf(fd,'\n lambda.lower = %f', lambda.lower);
fprintf(fd,'\n lambda.upper = %f', lambda.upper);
fprintf(fd,'\n lambda.ineqlin = %f', lambda.ineqlin);
fprintf(fd,'\n lambda.eqlin = %f', lambda.eqlin);
fprintf(fd,'\n lambda.ineqnonlin = %f', lambda.ineqnonlin);
fprintf(fd,'\n lambda.eqnonlin = %f', lambda.eqnonlin);
fprintf('\n\n *** KONIEC - wyniki w pliku eroOUT.m ***');
fclose('all');
return

