function ilg2g
disp(' funkcja ilg2g');
disp('    wyznaczanie transmitancji w oparciu o zera i bieguny');
%z - wektor zer, p - wektor biegunow
%k - wzmocnienie
sGzpk='Gzpk=(s+1)/((s+3)*(s+4)';
z=[-1]; p=[-3 -4]; k=1;
%sGzpk='Gzpk=4/((s+2)*(s+2)*(s-0.5)';
%z=[]; p=[-2 -2 0.5]; k=4;
%
Gzpk=zpk(z,p,k)
disp('');
disp('wynikowa transmitancja w postaci G = L(s)/M(s)');
G=tf(Gzpk)
end