function anime
%Matlab umo¿liwia bardzo ³atwe tworzenie animacji wykresów.
%Ka¿de polecenie plot generuje nowe okno.
% Zawartoœæ tego okna mo¿na przy pomocy polecenie
% getframe zapisaæ np.: w tablicy.
% Utworzon¹ tablicê odtworzamy
% wykorzystuj¹c polecenie movie().
for k = 1:16
plot(fft(eye(k+16)))
axis equal
M(k) = getframe;
end
movie(M,30)return
