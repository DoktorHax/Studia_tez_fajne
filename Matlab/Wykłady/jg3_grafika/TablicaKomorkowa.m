function TablicaKomorkowa
% Tworzenie przez indeksowanie
A(1,1) = {[1 4 3; 0 5 8; 7 2 9]}; 
A(1,2) = {'Imie Nazwisko'}; 
A(2,1) = {3+7i}; 
A(2,2) = {-1:0.2:1}; 
A(3,3)={5};
celldisp(A); % wyswietlenie zawartosci  tablicy A
cellplot(A); % prezentacja graficzna tablicy komorkowej B
pause; disp('Dalej? ENTER');
close;
return
