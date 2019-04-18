function g1g2gszplus
disp('funkcja g1g2gszminus');
disp('    wypadkowa transmitancja z dodatnim sprzezeniem zwrotnym');
syms s; % deklaracja zmiennej symbolicznej s
sG1 =  'G1 = 1/(s+1)';
L1=[1]; M1=[1 1]; G1=tf(L1,M1);
sG2 =  'G2 = 1/(s+3)';
L2=[1]; M2=[1 3]; G2=tf(L2,M2);
disp(' --->suma----G1----o--->   = G =G1/(1-G1*G2)');
disp('       +|          |');
disp('        |____G2____|');
disp(sG1);
disp(sG2);
disp(' G - wypadkowa transmitancja ukladu');
G=feedback(G1,G2,+1)
end