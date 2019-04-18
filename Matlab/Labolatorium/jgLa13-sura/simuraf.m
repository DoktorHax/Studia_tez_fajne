function simuraf(A,B,C,D)
fd=fopen('simurafOUT.m','wt');
fprintf(fd,'\n funkcja simuraf(A,B,C,D)');
fprintf(fd,'\n badanie ukladu regulacji automatycznej');
fprintf(fd,'\n o znanych macierzach rownania stanu A,B,C,D');
%
syms s; % deklaracja zmiennej symbolicznej s
if nargin<4
   D = [0];
   if nargin<3
      C = [0     0     1];
      if nargin<2
         B = [2; 0; 0];
         if nargin<1
            A =[-3    -3    -3
                 1     0     0
                 0     1     0];
         end
      end
   end
end
% wyznaczenie z-zer, p-biegunow, k-wmocnienia,L-licznika,M-mianownika
% transmitancji ukladu w oparciu o m. stanu A,B,C,D
A,B,C,D
[z,p,k,L,M,r,veck]= ABCD2gs(fd,A,B,C,D);
z,p,k,L,M,r,p,veck
% zapis transmitancji w postaci lancucha
n=length(L); lisi=[];
for i=1:n
    w=L(i);
    if w
        si=int2str(n-i); li=int2str(L(i));
        lisi=[lisi ' + ' li '*s^' si];
    end
end
%lisi
n=length(M); misi=[];
for i=1:n
    w=M(i);
    if w
        si=int2str(n-i); mi=int2str(M(i));
        misi=[misi ' + ' mi '*s^' si];
    end
end
%misi
sG=['G(s) = (' lisi ') / (' misi ')' ];
fprintf(fd,'\n\n  G(s) = L(s) / M(s)  - transmitancja ukladu');
fprintf(fd,'\n\n %s ',sG);
fprintf(fd,'\n\n ******************************************************');
fprintf(fd,'\n *** Numeryczne wyniki analizy transmitancji ukladu ***');
fprintf(fd,'\n ******************************************************');
%
wmin=0; wmax=1e10; wzakres={wmin,wmax}; % zakres zmian czestotliwosci
tp=0; dt=0.01; tk=10; tzakres=tp:dt:tk;
% charakterystyki czasowe: impulsowa i skokowa
cft(fd,L,M,sG,tzakres);
% charakterystyki czestotliwosciowe Nyquista i Bodego
comega(fd,L,M,sG,wzakres);
close('all');
fclose('all');
end

function [z,p,k,L,M,r,veck]= ABCD2gs(fd,A,B,C,D)
fprintf(fd,'\nfunkcja mrs2gs');
fprintf(fd,'\n     zamiana rownania stanu na transmitancje G(s)');
fprintf(fd,'\n A, B, C, D - znane macierze');
fprintf(fd,'\n rownanie stanu w zapisie macierzowym');
fprintf(fd,'\n sX(s) = A*X(s) + B*U(s)');
fprintf(fd,'\n  Y(s) = C*X(s) + D*U(s)');
fprintf(fd,'\n  X(s) = [x1,x2,x3,...] - wektor zm. stanu');
fprintf(fd,'\n  Y(s) = sygnal na wyjsciu');
fprintf(fd,'\n  U(s) = sygnal na wejsciu');
% wyznaczanie wartosci wlasnych macierzy stanu A
lambda=eig(A);
nlambda=length(lambda); relambda=real(lambda); imlambda=imag(lambda);
fprintf(fd,'\n wartosci wlasne macierzy stanu A, lambda = ');
for i=1:nlambda
  fprintf(fd,'\n %9.4g     +j    %9.4g',relambda(i),imlambda(i)); 
end
istab=[]; istab=find(relambda>0);
if ~isempty(istab)
    fprintf(fd,'\n uklad jest niestabilny');
else
    fprintf(fd,'\n uklad jest stabilny');
end
% wyznaczanie wektorow: z- zera, p - bieguny, k - wzmocnienie
[z,p,k]=ss2zp(A,B,C,D);
fprintf(fd,'\nzera        z = ');
nz=length(z); rez=real(z); imz=imag(z);
for i=1:nz     fprintf(fd,'\n %9.4g         +j     %9.4g',rez(i),imz(i));
end
fprintf(fd,'\nbieguny     p = ');
np=length(p); rep=real(p); imp=imag(p);
for i=1:np     fprintf(fd,'\n %9.4g         +j     %9.4g',rep(i),imp(i));
end
fprintf(fd,'\nwzmocnienie k = %9.4g',k);
fprintf(fd,'\ntransmitancja G=zpk(z,p,k)');
G=zpk(z,p,k) % transmitancja
% wyznaczanie wektorow: L - licznik, M - mianownik
[L,M]=ss2tf(A,B,C,D);
fprintf(fd,'\nLicznik     L = ');
nL=length(L); reL=real(L); imL=imag(L);
for i=1:nL     fprintf(fd,'\n %9.4g         +j     %9.4g',reL(i),imL(i));
end
fprintf(fd,'\nMianownik   M = '); 
nM=length(M); reM=real(M); imM=imag(M);
for i=1:nM     fprintf(fd,'\n %9.4g         +j     %9.4g',reM(i),imM(i)); 
end
fprintf(fd,'\ntransmitancja G=tf(L,M)');
G=tf(L,M) % transmitancja
fprintf(fd,'\n');
fprintf(fd,'\n rozklad na ulamki proste');
[r,p,veck]=residue(L,M);
%    r - wektor residuow
%    p - wektor biegunow  
% veck - wektor czynnikow prostych
% veck = [], jezeli length(M)<length(L)
% veck= [length(M)-length(L)+1]
fprintf(fd,'\n po rozlozeniu na ulamki proste ma postac:');
fprintf(fd,'\n wektor residuow   r =');
nr=length(r); rer=real(r); imr=imag(r);
for i=1:nr     fprintf(fd,'\n %9.4g         +j     %9.4g',rer(i),imr(i));
end
fprintf(fd,'\n wektor biegunow   p = ');
np=length(p); rep=real(p); imp=imag(p);
for i=1:np     fprintf(fd,'\n %9.4g         +j     %9.4g',rep(i),imp(i));
end
fprintf(fd,'\n veck - wektor czynnikow prostych');
fprintf(fd,'\n     veck= [length(M)-length(L)+1]');
fprintf(fd,'\n     veck = [], jezeli length(M)<length(L)');
if ~isempty(veck)
     fprintf(fd,'\n veck - zawartosc wektora czynnikow prostych:');
     fprintf(fd,'\n'); disp(veck);
else
    fprintf(fd,'\n veck=[] - dla badanej transmitancji wektor veck jest pusty');
end
%
end

function cft(fd,L,M,sG,tzakres)
fprintf(fd,'\n'); fprintf(fd,'\n');
fprintf(fd,'\ncharakterystyka impulsowa i skokowa'); 
sc='y(t) - charakterystyki czasowe';
sopis={sG; sc}; copis=char(sopis);
%L=[1 3];     % licznik transmitancji
%M=[1 2 3 4]; % mianownik transmitancji
G=tf(L,M);   % transmitancja
impulse(G); grid on;
sc='Charakterystyka impulsowa';
sopis={sG; sc}; copis=char(sopis);
impulse(G); grid on; title(copis); 
saveas(gcf,'CharakterystkaImpulsowa','emf');
pause(5); close;
[yimp,t] = impulse(G,tzakres); % charakterystyka impulsowa
sc='Charakterystyka skokowa';
sopis={sG; sc}; copis=char(sopis);
step(G); grid on; title(copis); 
saveas(gcf,'CharakterystkaSkokowa','emf');
pause(5); close;
[yskok,t]= step(G,tzakres);     % charakterystyka skokowa
% charakterystyki czasowe
sc='Charakterystyka skokowa i impulsowa';
sopis={sG; sc}; copis=char(sopis);
plot(t,yimp,'-b',t,yskok,'--r'); grid on;
title(copis); 
xlabel('t[s]'); ylabel('y(t)');
legend('odp. na impuls','odp. na skok jednostkowy');
saveas(gcf,'CharakterystkiCzasowe','emf');
pause(5); close;
end

function comega(fd,L,M,sG,wzakres)
fprintf(fd,'\n'); fprintf(fd,'\n');
fprintf(fd,'\n charakterystyki czestotliwosciowe'); 
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
% charakterystyka czest. modulu i argumentu
sc='Charakterystyka czestotliwosciowa - wykres modu³u i argumentu';
sopis={sG; sc}; copis=char(sopis);
w = logspace(-1,1); % wektor czestotliwosci
freqs(L,M,w); grid on; title(copis); 
saveas(gcf,'CharModulArg','emf');
pause(5); close;
end



