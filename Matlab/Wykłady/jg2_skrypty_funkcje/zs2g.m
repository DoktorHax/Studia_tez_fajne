function [z,p,k,L,M]=zs2g(A,B,C,D)
disp('funkcja zs2g');
disp('     zamiana zmiennych stanu na z,p,k transmitancji');
disp(' A, B, C, D - znane macierze');
disp(' rownanie stanu w zapisie macierzowym');
disp(' sX(s) = A*X(s) + B*U(s)');
disp('  Y(s) = C*X(s) + D*U(s)');
disp('  X(s) = [x1,x2,x3,...] - wektor zm. stanu');
disp('  Y(s) = sygnal na wyjsciu');
disp('  U(s) = sygnal na wejsciu');
if nargin<4
    D=[0];
    if nargin<3
        C=[1 -0.5]; 
        if nargin<2
            B=[1;0];
            if nargin<1
                A=[-5 -3; 2 0];
            end
        end
    end
end
disp('A = '); disp(A);
disp('B = '); disp(B);
disp('C = '); disp(C);
disp('D = '); disp(D);
% wyznaczanie wektorow: z- zera, p - bieguny, k - wzmocnienie
[z,p,k]=ss2zp(A,B,C,D);
disp('zera        z = '); disp(z);
disp('bieguny     p = '); disp(p);
disp('wzmocnienie k = '); disp(k);
disp('transmitancja G=zpk(z,p,k)');
G=zpk(z,p,k) % transmitancja
% wyznaczanie wektorow: L - licznik, M - mianownik
[L,M]=ss2tf(A,B,C,D);
disp('Licznik     L = '); disp(L);
disp('Mianownik   M = '); disp(M);
disp('transmitancja G=tf(L,M)');
G=tf(L,M) % transmitancja
end