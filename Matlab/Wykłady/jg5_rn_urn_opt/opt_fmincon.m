function opt_fmincon
fprintf('\n Program opt_fmincon - wykorzystanie funkcji fmincon do optymalizacji');
fprintf('\n nieliniowej funkcji celu');
fprintf('\n z ograniczeniami rownosciowymi liniowymi i nieliniowymi');
fprintf('\n i ograniczeniami nierownosciowymi liniowymi i nieliniowymi\n\n');
fd=fopen('opt_fminconOUT.m','wt');
x0 =[-1.0;  2.0;   5.0]; % punkt startwoy
% ograniczenia nierównoœciowe liniowe
Aineq = [ 2.0 3.0 4.0]; % macierz ograniczeñ liniowych nierównoœciowych
bineq = [35.0];     % wektor prawych stron ograniczeñ nierównoœciowych liniowych
% ograniczenia równoœciowe liniowe
Aeq = [ 1.0 1.0 1.0];  % macierz ograniczeñ liniowych równoœciowych
beq = [10.0];      % wektor prawych stron ograniczeñ równoœciowych liniowych
% ograniczenia nierównoœciowe na zmnienne decyzyjne
lb=[-10.0;  -5.0;  0.0]; % wektor ograniczeñ dolnych
ub=[ 10.0;   5.0;  inf];   % wektor ograniczeñ górnych
% funkcja celu i jej gradient
[f] = fg(x0);
% nieliniowe ograniczenia funkcyjne nierownosciowe i rownowsciowe
[C,Ceq]=ogrnl(x0);
x0,C,Ceq
% ustalenie opcji procesu optymalizacji
options=optimset('display','iter');
[x,fval,exitflag,output,lambda]=fmincon(@fg,x0,Aineq,bineq,Aeq,beq,lb,ub,@ogrnl,options);
fprintf(fd,'\n              min x1^2 + x2^3 + x3^4');
fprintf(fd,'\n  przy ograniczeniach funkcyjnych:');
fprintf(fd,'\n - liniowych nierownosciowych');
fprintf(fd,'\n              2*x1 + 3*x2 + 4*x3 <= 35');
fprintf(fd,'\n - liniowych rownosciowych');
fprintf(fd,'\n              x1 + x2 + x3 = 10');
fprintf(fd,'\n - nieliniowych nierownosciowych');
fprintf(fd,'\n              1.5+x1*x2-x3 <= 0');
fprintf(fd,'\n              -10 - x1*x2 ><= 0');
fprintf(fd,'\n - nieliniowych rownosciowych');
fprintf(fd,'\n              -46 + x1^2 + x2^2 + x3^2 = 0');
fprintf(fd,'\n  oraz ograniczeniach nakladanych na sterowania');
fprintf(fd,'\n  -10 <= x1 <= 10');
fprintf(fd,'\n  -5 <= x2 <= 5');
fprintf(fd,'\n  0 <= x3 <= inf');
fprintf(fd,'\n\n\n ************* OPTYMALIZACJA ******************');
fprintf(fd,'\n punkt startowy          x0 = %f',x0);
    [f0] = fg(x0); % wartosc funkcji celu przed optymalizacj¹
fprintf(fd,'\n Funkcja celu przed optymalizacja f0 = %',f0);
fprintf(fd,'\n ===============================================');
fprintf(fd,'\n rozwiazanie optymalne   x  = %f',x);
    [f] = fg(x); % wartoœæ funkcji celu po optymalizacji
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
fprintf('\n\n *** KONIEC - wyniki w pliku opt_fminconOUT.m ***');
fclose('all');
end
  
function [f] = fg(x)
%funkcja celu f = x1^2 + x2^3 + x3^4
f = x(1,1)^2 + x(2,1)^3 + x(3,1)^4;
end
 
function [C,Ceq]=ogrnl(x)
%ograniczenia funkcyjne nierownosciowe C
%C(1,1)= 1.5 + x(1)*x(2)-x(3);
%C(2,1)= -10 - x(1)*x(2);
C = [1.5 + x(1)*x(2)-x(3);
     -10 - x(1)*x(2)];
%ograniczenia funkcyjne rownosciowe Ceq
%Ceq(1,1)= -40 + x(1)^2 + x(2)^2 + x(3)^2;
Ceq = [-46 + x(1)^2 + x(2)^2 + x(3)^2];
end

