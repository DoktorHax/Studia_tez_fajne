function csvreadtest
%czytanie danych z pliku separowanych przecinkiem
type danecsv.txt
A = csvread('danecsv.txt',1,1);
A
csvwrite('danecsv1.txt',A,1,1);
type danecsv1.txt
B = csvread('danecsv1.txt');
B
return