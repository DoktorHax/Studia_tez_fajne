function sumg2g
disp(' funkcja sumg2g');
disp('    wyznaczanie transmitancji na podstawie sumy prostych ulamkow');
% r - wektor residuow
% p - wektor biegunow
% k - wektor czynnika prostego
sGsuma='Gsuma=1/(s+2) + -1/(s+1) + 2/(s+1)^2';
r=[1 -1 2]; p=[-2 -1 -1]; k=[];
[L,M]=residue(r,p,k);
disp(sGsuma);
disp(' wynikowa transmitancja w postaci G=L(s)/M(s)');
disp('wektor wspolczynnikow licznika L ');  disp(L);
disp('wektor wspolczynnikow mianownika M'); disp(M);
end