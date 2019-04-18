
 funkcja simuraf(A,B,C,D)
 badanie ukladu regulacji automatycznej
 o znanych macierzach rownania stanu A,B,C,D
funkcja mrs2gs
     zamiana rownania stanu na transmitancje G(s)
 A, B, C, D - znane macierze
 rownanie stanu w zapisie macierzowym
 sX(s) = A*X(s) + B*U(s)
  Y(s) = C*X(s) + D*U(s)
  X(s) = [x1,x2,x3,...] - wektor zm. stanu
  Y(s) = sygnal na wyjsciu
  U(s) = sygnal na wejsciu
 wartosci wlasne macierzy stanu A, lambda = 
     -2.26     +j            0
     -0.37     +j        1.091
     -0.37     +j       -1.091
 uklad jest stabilny
zera        z = 
bieguny     p = 
     -2.26         +j             0
     -0.37         +j         1.091
     -0.37         +j        -1.091
wzmocnienie k =         2
transmitancja G=zpk(z,p,k)
Licznik     L = 
         0         +j             0
         0         +j             0
         0         +j             0
         2         +j             0
Mianownik   M = 
         1         +j             0
         3         +j             0
         3         +j             0
         3         +j             0
transmitancja G=tf(L,M)

 rozklad na ulamki proste
 po rozlozeniu na ulamki proste ma postac:
 wektor residuow   r =
      0.42         +j             0
     -0.21         +j       -0.3637
     -0.21         +j        0.3637
 wektor biegunow   p = 
     -2.26         +j             0
     -0.37         +j         1.091
     -0.37         +j        -1.091
 veck - wektor czynnikow prostych
     veck= [length(M)-length(L)+1]
     veck = [], jezeli length(M)<length(L)
 veck=[] - dla badanej transmitancji wektor veck jest pusty

  G(s) = L(s) / M(s)  - transmitancja ukladu

 G(s) = ( + 2*s^0) / ( + 1*s^3 + 3*s^2 + 3*s^1 + 3*s^0) 

 ******************************************************
 *** Numeryczne wyniki analizy transmitancji ukladu ***
 ******************************************************


charakterystyka impulsowa i skokowa


 charakterystyki czestotliwosciowe