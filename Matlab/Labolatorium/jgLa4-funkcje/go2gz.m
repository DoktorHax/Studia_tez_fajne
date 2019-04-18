function go2gz
disp('funkcja go2gz');
disp('    transmitancja ukladu zamknietego');
syms s; % deklaracja zmiennej symbolicznej s
sGo =  'Go = (s+3)/(s^3 +4s^2+5s+2) - transmitancja ukladu otwartego';
L1=[1 3]; M1=[14 5 2]; G1=tf(L1,M1);
sG2 =  'G2 = 1/1';
L2=[1]; M2=[1]; G2=tf(L2,M2);
disp(' --->suma----Go----o--->   = G = Go/(1+Go)');
disp('       -|          |');
disp('        |__________|');
disp(sGo);
disp('G - transmitancja ukladu zamknietego');
G=feedback(G1,G2)
end