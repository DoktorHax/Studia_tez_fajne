function anime
%Matlab umo�liwia bardzo �atwe tworzenie animacji wykres�w.
%Ka�de polecenie plot generuje nowe okno.
% Zawarto�� tego okna mo�na przy pomocy polecenie
% getframe zapisa� np.: w tablicy.
% Utworzon� tablic� odtworzamy
% wykorzystuj�c polecenie movie().
for k = 1:16
plot(fft(eye(k+16)))
axis equal
M(k) = getframe;
end
movie(M,30)return
