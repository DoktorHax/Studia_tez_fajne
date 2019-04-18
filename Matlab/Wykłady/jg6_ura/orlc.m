function orlc(R,XL,XC,E,psiE)
% Funkcja rlc(R,XL,XC,E,psiE)
% symuluje stan nieustalony w obwodzie RLC
% Rownania rozniczkowe definiuje funkcja: dxdt=rlcdx(t,x)
% Konieczne zmienne globalne global A B e
global A B Em psi
fd=fopen('orlcOUT.m','wt');
fprintf('\n\n Symulacja stanu nieustalonego w obwodzie RLC \n');
w=100*pi; % pulsacja pradu
% parametry obwodu
if nargin < 5    psiE=60; %stopnie
  if nargin < 4      E=100; % V
   if nargin < 3      XL=80; 
     if nargin < 2      XC=80; 
      if nargin < 1          R=100.0; % omy
      end
     end
   end
  end
end
L=XL/w; % XL w omach, L w H
Co=1/w/XC; % XC w omach, C w F
Em=sqrt(2)*E; % amplituda sem
psi=psiE/180*pi;
t0=0; tk=0.1; dt=0.001; % czas poczatku i konca analizy w s
tp=t0:dt:tk; % przedzial analizy
x0=[0 0]; % warunek poczatkowy
A = [-R/L  -1/L 
     1/Co     0];
B = [1/L; 0];
C = [1 0]; D=[0];
%
[t,x]=ode45(@orlcdx,tp,x0); % wersje nowsze
i=x(:,1); % przebieg pradu
uC=x(:,2); % przebieg napiecia na kondensatorze
e=Em*sin(100*pi*t+psi); % wymuszenie sem e
uL=e-R*i-uC; % przebieg napiecia na cewce
uLuC=uL+uC; % suma napiec na cewce i kondensatorze
plot(t,i,'k-');title('Przebieg pradu w obwodzie RLC');
xlabel('t[s]'); ylabel('i, A'); grid on;
saveas(gcf,'orlc_it','emf'); pause(5); close;
plot(t,uC,'r-',t,uL,'b--',t,uLuC,'k-',t,e,'g:','LineWidth',1.5);
title('Przebiegi napiec w obwodzie RLC po zal. sem e');
xlabel('t[s]'); ylabel('uL,uC,uLuC,[V]'); grid on;
legend('uC','uL','uL+uC,e');
saveas(gcf,'orlc_ut','emf'); pause(5); close;
fprintf(fd,'\n Parametry obwodu  R = %9.3f om',R);
fprintf(fd,'\n                  XL = %9.3f om,  L = %9.3f mH',XL,L*1000);
fprintf(fd,'\n                  XC = %9.3f om,  C = %9.3f mF',XC,C*1000);
fprintf(fd,'\n SEM w obwodzie:   E = %9.3f V, psiE = %6.2f st',E,psiE);
% zamiana macierzowego rownania stanu w transmitancje ukladu
mrs2gs(fd,A,B,C,D);
%
fprintf(fd,'\n\n Wyniki symulacji stanu nieustalonego w obwodzie RLC');
fprintf(fd,'\n      t,s       i,A       uC,V        e,V       uL,V   uL+uC,V');
nt=length(tp);
for k=1:nt
    ti=tp(k);
    fprintf(fd,'\n%9.3f %9.3f  %9.3f  %9.3f  %9.3f  %9.3f',ti,i(k),uC(k),e(k),uL(k),uL(k)+uC(k) );
end
fclose('all');
fprintf('\n\n Koniec orlc() - wyniki w pliku orlcOUT.m oraz w plikach *.emf');
end

