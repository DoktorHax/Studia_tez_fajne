function celltest
% testowanie dzialan na tablicach komorkowych z lancuchami i liczbami
tabkom1={}; tabkom2={}; tab_kom={};
tabkom1={
    'tablica komorkowa 1-sza'  1.1   2.2   3.3;
    };
disp('tabkom1');
celldisp(tabkom1);
cellplot(tabkom1);
pause(10);
%
tabkom2={
    'TablicaKom Wiersz 3-ci ' 111.1   222    333;
    'TablicaKom Wiersz 4'      1111  2222   3333;
    };
disp('tabkom2');
celldisp(tabkom2);
cellplot(tabkom2);
pause(10)
% laczenie tablic komorkowych
tab_kom=[tabkom1;tabkom2];
disp('tab_kom1');
celldisp(tab_kom)
cellplot(tab_kom)
%sp12='123456789012'; % ustala dlugosc maksymalna nazwy na 12 znakow
[nw,nk]=size(tab_kom);
nw,nk
% tworzenie tablicy znakowej z nazwami
nazwy=[];
% oraz tablicy numerycznej z liczbowymi parametrami
parametry=[];
if nw
      nazwy = char(tab_kom(:,1));
   parametry =[cell2mat(tab_kom(:,2:end)) ];
else    % brak 
   nazwy=[];
   parametry=[];
end %if nw 
disp('nazwy - tablica znakowa');
nazwy
disp('parametry - tablica numeryczna'); 
parametry
end