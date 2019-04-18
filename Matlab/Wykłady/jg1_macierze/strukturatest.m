function strukturatest
clc; clear;
% testowanie operacji na strukturach
% disp('Tworzenie struktury z uzyciem struct');
disp('s=struct(''a1'',2,''a2'', ''trzy'', ''a3'',[1,2,3,4;5,6,7,8]');
s=struct('a1',2,'a2', 'trzy', 'a3',[1,2,3,4;5,6,7,8]);
disp('s');s
disp('s.a1');s.a1
disp('s.a2');s.a2
disp('s.a3');s.a3
disp('Tworzenie struktury met. ptzypisania danych');
disp('s.a1=22; s.a2=''3=trzy''; s.a3=[11,22,33,44;55,66,77,88]');
s.a1=22; s.a2='3=trzy'; s.a3=[11,22,33,44;55,66,77,88];
disp('s');s
disp('s.a1');s.a1
disp('s.a2');s.a2
disp('s.a3');s.a3
disp('Spawdzanie, czy s to struktura');
disp('czys=istruct(s)');
czys=isstruct(s);
if czys 
    disp('s to struktura');
else
    disp('s to nie struktura');
end
disp('Rozszerzenie struktury przez dodanie pola');
disp('s(1).a4=''nowe pole'' ');
s(1).a4='nowe pole';
disp('s');s
disp('s.a1');s.a1
disp('s.a2');s.a2
disp('s.a3');s.a3
disp('s.a4');s.a4
disp('Przyklad struktury eksperyment z pomiarami');
disp('eksperyment.nazwa=''pomiar 1'' ');
disp('eksperyment.pomiar=[1,2,3,4,5,6,7]');
disp('eksperyment.przyrzad=''klasa 0.5'' ');
%
disp('eksperyment(2).nazwa=''pomiar 2'' ');
disp('eksperyment(2).pomiar=[1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8,9.9]');
%
eksperyment.nazwa='pomiar 1';
eksperyment.pomiar=[1,2,3,4,5,6,7];
eksperyment.przyrzad='klasa 0.5';
eksperyment
eksperyment(2).nazwa='pomiar 2';
eksperyment(2).pomiar=[1.1,2.2,3.3,4.4,5.5,6.6,7.7,8.8,9.9];
eksperyment
disp('dostep do pol struktury przez podanie indeksow')
disp('eksperyment(1).nazwa, eksperyment(1).pomiar ,eksperyment(1).przyrzad');
eksperyment(1).nazwa, eksperyment(1).pomiar ,eksperyment(1).przyrzad
disp('eksperyment(2).nazwa, eksperyment(2).pomiar ,eksperyment(2).przyrzad');
eksperyment(2).nazwa, eksperyment(2).pomiar ,eksperyment(2).przyrzad
disp('filednames(eksperyment) podaje nazwy pol');
nazwypol=fieldnames(eksperyment)
disp('f=getfield(nazwastruktury,{indeks},''nazwa pola'',{indeks pola}');
disp('   to inny sposob dostepu do pol');
disp('f=getfield(eksperyment,{2},''pomiar'',{9})');
f=getfield(eksperyment,{2},'pomiar',{9})
%
end