function go2gzminus
disp('funkcja g2f');
disp('     wyznaczanie odwrotnej transformacji Laplacea');
syms s; % deklaracja zmiennej symbolicznej s
G(s) = (s+1)/((s+3)*(s+4));
sG='G(s) = (s+1)/((s+3)*(s+4))';
opis=char(sG);
ft = ilaplace(G);
disp(''); disp(' zadana transformata'); disp(''); disp(opis);
disp(''); disp(' odwrotna transformata');
disp('f(t)='); disp('');
disp(ft);
end