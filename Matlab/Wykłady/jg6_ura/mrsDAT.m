function [A,B,C,D] = mrsDAT
fprintf('\n funkcja mrsDAT');
fprintf('\n      wyznaczanie zmiennych stanu');
fprintf('\n  G = L(s)/M(s) - znane');
fprintf('\n  A, B, C, D - szukane macierze');
fprintf('\n  rownanie stanu w zapisie macierzowym');
fprintf('\n  sX(s) = A*X(s) + B*U(s)');
fprintf('\n   Y(s) = C*X(s) + D*U(s)');
fprintf('\n   X(s) = [x1,x2,x3,...] - wektor zm. stanu');
fprintf('\n   Y(s) = sygnal na wyjsciu');
fprintf('\n   U(s) = sygnal na wejsciu');
    sG='G(s) = (s - 1)/(s^3 + s^2 + 10*s + 2)'; % opis transmitancji
     M=[1  1 10 2]; % mianownik transmitancji 
     L=[1 -1]; % licznik transmitancji
opis=char(sG);
fprintf('\n  Zadana transformata: ',opis);
G = tf(L,M); % tworzenie transmitancji w oparciu o L, M
[A,B,C,D]=ssdata(G); % wyznaczanie macierzy zm. stanu
fprintf('\n  Uzyskano macierze rownania stanu: A, B, C');
% A,B,C,D
end