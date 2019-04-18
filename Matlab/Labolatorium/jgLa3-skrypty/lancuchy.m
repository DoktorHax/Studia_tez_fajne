%skrypt lancuchy
% ilustruje porownanie lancuchow wg strcmp() i strncmp()
% - lancuchy zwykle
% - lancuchy w tablicach komorkowych
% - lancuchy w tablicach o jednakowych wymiarach
spacja=' ';
disp(' Porownanie lancuchow zwyklych');
str1 = 'Marian'; str2 = 'Marysia'; str3='Karolina'; str4='Marucha';
wynik = strcmp(str1,str2);
disp('str1 = '); disp(str1);
disp('str2 = ');disp(str2);
if wynik 
    disp('strcmp(str1,str2) - lancuchy identyczne');
else
    disp('strcmp(str1,str2) - lancuchy rozne');
end
disp(spacja);
wynik = strncmp(str1,str2,4);
if wynik 
    disp('strncmp(str1,str2,4) - lancuchy identyczne');
else
    disp('strncmp(str1,str2,4) - lancuchy rozne');
end
disp(spacja);
%lancuchy w tablicach komorkowych
disp(' Porownanie lancuchow w tablicach komorkowych');
Akomorkowa={str1;str2;str3};
Bkomorkowa={str1;str2;str4};
wynik=strcmp(Akomorkowa,Bkomorkowa);
disp('Akomorkowa = '); disp(Akomorkowa);
disp('Bkomorkowa = ');disp(Bkomorkowa);
disp('strcmp(Akomorkowa,Bkomorkowa - daje wynik:');
disp(wynik);
disp(spacja);
%lancuchy w tablicach o jednakowych wymiarach
disp(' Porownanie lancuchow w tablicach o jednakowych wymiarach');
disp(' Na tabliach o jednakowych wymiarach moga byc wykonane operacje logiczne');
A=[str2];B=[str4];
wynik=A==B;
disp('A'); disp(A);
macA=double(A);  disp('macA = '); disp(macA);
disp('B');disp(B);
macB=double(B);  disp('macB = '); disp(macB);
disp('A==B porownuje kody ASCII - daje wynik:');
disp(wynik);
disp(spacja);
A=[str2];B=[str4];
wynik=A>=B;
disp('A'); disp(A);
macA=double(A);  disp('macA = '); disp(macA);
disp('B');disp(B);
macB=double(B);  disp('macB = '); disp(macB);
disp('A>=B porownuje kody ASCII - daje wynik:');
disp(wynik);
disp('Koniec skryptu lancuchy');

