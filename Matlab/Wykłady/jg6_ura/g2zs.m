function [A,B,C,D] = g2zs(L,M,sG)
disp('funkcja g2zs');
disp('     wyznaczanie zmiennych stanu');
disp(' G = L(s)/M(s) - znane');
disp(' A, B, C, D - szukane macierze');
disp(' rownanie stanu w zapisie macierzowym');
disp(' sX(s) = A*X(s) + B*U(s)');
disp('  Y(s) = C*X(s) + D*U(s)');
disp('  X(s) = [x1,x2,x3,...] - wektor zm. stanu');
disp('  Y(s) = sygnal na wyjsciu');
disp('  U(s) = sygnal na wejsciu');
if nargin<3
    sG='G(s) = (s-1)/(s^2 + 5*s + 6)'; % opis transmitancji
    if nargin<2
        M=[1 5 6]; % mianownik transmitancji 
        if nargin<1
            L=[1 -1];; % licznik transmitancji
        end
    end
end
opis=char(sG);
disp(' zadana transformata'); disp(''); disp(opis);
G = tf(L,M); % tworzenie transmitancji w oparciu o L, M
[A,B,C,D]=ssdata(G); % wyznaczanie macierzy zm. stanu
[nA,mA]=size(A);
disp(' liczba zmiennych stanu n = '); disp(nA);
disp(' Macierze rownania stanu');
disp('A = '); disp(A);
disp('B = '); disp(B);
disp('C = '); disp(C);
disp('D = '); disp(D);
end