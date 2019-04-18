function g2rozklad
disp('g2rozklad');
disp('   rozklad transmitancji G(s) na ulamki proste');
sG='G(s)= (s+3)/(s^3+4*s^2+5*s+2)';
opis=char(sG);
 L=[1 3];     % licznik od najwyzszej do zerowej potegi
 M=[1 4 5 2]; % mianownik od najwyzszej do zerowej potegi 
[r,b]=residue(L,M); % r -wektor residuow, p- mwektor biegunow  
disp(' tranformata '); disp(''); disp(opis);
disp(' po rozlozeniu na ulamki proste ma postac:');
disp(' r - wektor residuow:'); disp(''); disp(r);
disp(' b - wektor biegunow:'); disp(''); disp(b);
end

