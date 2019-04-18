function faxb
% Funkcja faxb.m rozwiazuje uklad liniowych rownan A*x=b
%  macierz A jest wczytana jako plik ASCII o nazwie A.dat lub plik binarny A.mat
%  wektor  b jest wczytany jako plik ASCII o nazwie b.dat lub plik binarny 
%  wektor  x jest zapisany na dysku jako plik ASCII o nazwie x.dat lub plik binarny.x.mat
% funkcja faxb.m oraz macierze A, b musza sie znajdowac w tym samym katalogu.
% czytanie i zapisywanie plikow ascii
load A.dat % wczytany plik ascii zostanie zapamietany jako macierz A
disp(' A = '); disp(A) % macierz A zostanie wyswietlona na ekranie
save A; % zapisanie na dysku A.mat
load b.dat % wczytany plik acii zostanie zapamietany jako macierz b
save b;
disp(' b = '); disp(b)% macierz b zostanie wyswietlona na ekranie
x = A\b;
save 'x.dat' x -ascii %rozwiazanie x zostanie zapisane na dysku jako x.dat
disp(' x = '); disp(x)% macierz b zostanie wyswietlona na ekranie
% czytanie i zapisywanie plikow binarnych
load A.mat; 
disp(' A = '); disp(A) % macierz A zostanie wyswietlona na ekranie
load b.mat;
disp(' b = '); disp(b)% macierz b zostanie wyswietlona na ekranie
x = A\b;
disp(' x = '); disp(x)% macierz b zostanie wyswietlona na ekranie
save x;
end
