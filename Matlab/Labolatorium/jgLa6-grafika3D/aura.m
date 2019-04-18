function aura
disp(' funkcja aura');
disp(' steruje analiza ukladu regulacji automatycznej');
disp(' o zadanej transmitancji ukladu otwartego');
%
syms s; % deklaracja zmiennej symbolicznej s
%G=(4*s^2 + 21*s +28)/ (s^3 + 9*s^2 + 26 *s +24);
%sG='G=(4*s^2 + 21*s +28)/ (s^3 + 9*s^2 + 26 *s +24)';
%L=[4 21 28]; M=[1 9 26 24];
G=(s+3)/(s^3 + 4*s^2 + 5*s + 2);
sG='G=(s+3)/(s^3 + 4*s^2 + 5*s + 2)';
L=[1 3]; M=[1 4 5 2]; 
%G=(3*s^2 + 2*s +1)/(s^4 +s^3);
%sG='G=(3*s^2 + 2*s +1)/(s^4 +s^3)';
%L=[3 2 1]; M=[1 1 0 0 0];
%G=4/(s^3+3.5*s^2 + 2*s -2);
%sG='G=4*s/(s^3+3.5*s^2 + 2*s -2)'
%L=[4 0]; M=[1 3.5 2 -2];
%G=(s+3)/(s^3 + 4*s^2 + 5*s + 2);
%sG='G=(s+3)/(s^3 + 2*s^2 + 3*s + 4)';
%L=[1 3]; M=[1 2 3 4]; 
disp(sG);
wmin=0; wmax=1e10; wzakres={wmin,wmax}; % zakres zmian czestotliwosci
tp=0; dt=0.01; tk=10; tzakres=tp:dt:tk;
% wyznaczanie odwrtonej transmitancji
g2ft(s,G,sG,tzakres);
% wyznaczanie biegunow i zer transmitancji
gbz(L,M,sG); 
% rozklad na ulamki proste
g2ulamki(L,M,sG);
% charakterystyki czasowe: impulsowa i skokowa
cft(L,M,sG,tzakres);
% charakterystyki czestotliwosciowe Nyquista i Bodego
comega(L,M,sG,wzakres);
end

function g2ft(s,G,sG,tzakres)
disp(''); disp(' wyznaczanie odwrotnej transformacji Laplacea');
opis=char(sG);
% Wyznaczenie odwrotnej transformaty Laplace'a w postaci f(t)=G(s)^-1
copis={char(sG); 'odwrotna transformacja f(t)=G(s)^-1'};
opis=char(copis);
ft = ilaplace(G);
ezplot(ft,tzakres);
grid on; title(opis);
xlabel('t[s]'); ylabel('f(t)');
saveas(gcf,'OdwrotnaTransformacja','emf');
pause(5); close;
disp(''); disp(' zadana transformata'); disp('');
disp('');disp(' odwrotna transformata f(t)='); disp('');
disp(ft);
end

function gbz(L,M,sG)
disp('');
disp('wyznaczanie biegunow i zer transmitancji');
G=tf(L,M);   % transmitancja
b=pole(G); % bieguny transmitancji
disp(''); disp('bieguny transmitancji:'); disp(b);
compass(b,'-b'); grid on;
copis={char(sG); 'bieguny transmitancji'};
opis=char(copis);
title(opis);
xlabel('Real'); ylabel('Imag');
saveas(gcf,'BiegunyTransmitancji','emf');
pause(5);
close;
z=zero(G); % zera transmitancji G(s)
disp(''); disp('zera transmitancji:'); disp(z);
compass(z,'--r'); grid on;
copis={char(sG); 'zera transmitancji'};
opis=char(copis);
title(opis);
xlabel('Real'); ylabel('Imag');
saveas(gcf,'ZeraTransmitancji','emf');
pause(5);
close;
end

function g2ulamki(L,M,sG)
disp('');
disp(' rozklad na ulamki proste');
[r,b,k]=residue(L,M); % r -wektor residuow, b- wektor biegunow  
% k - wektor czynnikow prostych
% k = [], jezeli length(M)<length(L)
% k= [length(M)-length(L)+1]
disp(char(sG));
disp(' po rozlozeniu na ulamki proste ma postac:');
disp(' r - wektor residuow:'); disp(''); disp(r);
disp(' b - wektor biegunow:'); disp(''); disp(b);
disp(' k - wektor czynnikow prostych');
disp('     k= [length(M)-length(L)+1]');
disp('     k = [], jezeli length(M)<length(L)');
if ~isempty(k)
     disp(' k - zawartosc wektora czynnikow prostych:');
     disp(''); disp(k);
else
    disp(' k=[] - dla badanej transmitancji wektor k jest pusty');
end
end

function cft(L,M,sG,tzakres)
disp(''); disp('');
disp('charakterystyka impulsowa i skokowa'); 
sc='y(t) - charakterystyki czasowe';
sopis={sG; sc}; copis=char(sopis);
%L=[1 3];     % licznik transmitancji
%M=[1 2 3 4]; % mianownik transmitancji
G=tf(L,M);   % transmitancja
impulse(G); grid on;
saveas(gcf,'CharakterystkaImpulsowa','emf');
pause(5); close;
[yimp,t] = impulse(G,tzakres); % charakterystyka impulsowa
step(G); grid on;
saveas(gcf,'CharakterystkaSkokowa','emf');
pause(5); close;
[yskok,t]= step(G,tzakres);     % charakterystyka skokowa
% charakterystyki czasowe
plot(t,yimp,'-b',t,yskok,'--r'); grid on;
title(copis); 
xlabel('t[s]'); ylabel('y(t)');
legend('odp. na impuls','odp. na skok jednostkowy');
saveas(gcf,'CharakterystkiCzasowe','emf');
pause(5); close;
end

function comega(L,M,sG,wzakres)
disp(''); disp('');
disp(' charakterystyki czestotliwosciowe'); 
%syms s; % deklaracja zmiennej symbolicznej s
% G(s)=(s+3)/(s^3+2s^2+3s+4) - transmitancja ukladu AR
%sG='G(s)=(s+3)/(s^3+2s^2+3s+4) - transmitancja';
% L=[1 3];     % licznik transmitancji
% M=[1 2 3 4]; % mianownik transmitancji
G=tf(L,M);   % transmitancja
%wmin=0; wmax=1e10; wzakres={wmin,wmax}; % zakres zmian czestotliwosci
% charakterystyka Nyquista
sc='Charakterystyka czestotliwosciowa Nyquista';
sopis={sG; sc}; copis=char(sopis);
nyquist(G,wzakres); grid on; title(copis); 
saveas(gcf,'CharNyquist','emf');
pause(5); close;
% charakterystyka Nyquista - wykres oraz wartosci liczbowe
[re,im,w] = nyquist(G,wzakres); % charakterystyka Nyquista
% re(:,:.k) - czesc rzeczywista  dla czest. w(k)
% im(:,:.k) - czesc urojona  dla czest. w(k)re,im,w
% w(k) - zmiany czestliwoswci w rad/s
% k - kolejny krok podwyzszenia czest. od wmin
rek=re(:); % wektor czesci rzeczywistych
imk=im(:); % wektor czesci urojonych
osx=imk*0; % os zerowa
%rek,imk
plot(rek,imk,'-b',rek,osx,'-r'); grid on;
title(copis); 
xlabel('real[s]'); ylabel('imag');
legend('Charakterystyka Nyquista');
saveas(gcf,'CharNyquista','emf');
pause(5); close;
% charakterystyka Bode'go - wykres
sc='Charakterystyka czestotliwosciowa Bodego';
sopis={sG; sc}; copis=char(sopis);
bode(G,wzakres); grid on; title(copis); 
saveas(gcf,'CharBode','emf');
pause(5); close;
% charakterystyka Bode'go - wartosci liczbowe i wykres
[amp,faza,w]=bode(G,wzakres);
ampk=amp(:); % wektor czesci rzeczywistych
fazak=faza(:); % wektor czesci urojonych
ampkdB=20*log10(ampk); % amplitua w dB
wlog10=log10(w); % skala logarytmiczna dla czest.
osx=wlog10*0; % os zerowa
plot(wlog10,ampkdB,'-b'); grid on; title(copis); 
xlabel('log10(w)'); ylabel('dB');
legend(' Charakterystka amplitudowa Bodego');
saveas(gcf,'CharAmpBode','emf');
pause(5); close;
%fazakst=fazak*180/pi; % faza w stopniach
plot(wlog10,fazak,'-b'); grid on; title(copis); 
xlabel('log10(w)'); ylabel('stopnie');
legend(' Charakterystka fazowa Bodego');
saveas(gcf,'CharFazaBode','emf');
pause(5); close;
end



