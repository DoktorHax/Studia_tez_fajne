% skrypt epskomp.m
% Wyznaczanie dokladnosci komputera
% z wykorzystaniem instrukcji for i break.
eps=1;
for i=1:1000
eps=eps/2;
	if(eps+1<=1), break, end
end
disp(' Dokladnosc komputera wyznaczona z for i break'); disp(eps);
% Wyznaczanie dokladnosci komputera
% z wykorzystaniem instrukcji while.
eps=1;
while (eps+1>1)
    eps=eps/2;
end
disp(' Dokladnosc komputera wyznaczona z while'); disp(eps);
%koniec skryptu
