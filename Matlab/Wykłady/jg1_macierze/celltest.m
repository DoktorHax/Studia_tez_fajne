function celltest
clc;clear;
% testowanie dzialan na tablicach komorkowych z lancuchami i liczbami
tabkom1={}; tabkom2={}; tab_kom={};
tabkom1={
    'tablica komorkowa 1-sza'             1.1      2.2    3.3;
    };
disp('tabkom1');
celldisp(tabkom1);
cellplot(tabkom1);
pause(10);
%
tabkom2={
    'Tab.Kom.2.  Wiersz 3-ci'             444.4   555.5  666.6;
    'Tablica Komorkowa3. Wiersz 4-ty'     7777.7 8888.8 9999.9;
    };
disp('tabkom2');
celldisp(tabkom2);
cellplot(tabkom2);
pause(10); close;
% laczenie tablic komorkowych
tab_kom=[tabkom1;tabkom2];
disp('tab_kom1=[tabkom1;tabkom2]');
celldisp(tab_kom)
cellplot(tab_kom)
pause(10); close;
[nw,nk]=size(tab_kom);
disp('Wymiary tablicykomorkowej [nw,nk]=size(tab_kom)');
disp('    - liczba wierszy nw = '); disp(nw);
disp('    - liczba kolumn  nk = '); disp(nk);
disp(' Tworzenie tablicy znakowej z 1-szej kolumny tablicy komorkowej');
disp('   nazwy=char(tab(tab_kom(:,1))');
disp(' oraz tablicy numerycznej z pozosta³ych kolumn');
disp('   parametry=[cell2mat(tab_kom(:,2:end))]');
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
disp('tablica znakowa nazwy =');
nazwy
disp('tablica numeryczna parametry ='); 
parametry
end