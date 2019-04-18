function go2gszminus
disp('funkcja go2gzminus);
disp('    wypadkowa transmitancja z ujemnym sprzezeniem zwrotnym');
syms s; % deklaracja zmiennej symbolicznej s
G1 = 1/(s+1); 
sG1 =  'G1 = 1/(s+1)';
G2 = 1/(s+3); 
sG2 =  'G2 = 1/(s+3)';
disp(' --->suma----G1----o--->   = G =G1/(1+G1*G2)');
disp('       -|          |');
disp('        |____G2____|');
disp(sG1);
disp(sG2);
disp(' G =');
G=feedback(G1,G2)
end