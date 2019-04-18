function orlcfunapp(app,R,XL,XC)
% Funkcja orlcfunapp(app,R)
% wykorzystuje appdesigner
% symuluje stan nieustalony w obwodzie szeregowym RLC przy zmiennym R
% rownania rozniczkowe definiuje funkcja: dxdt=orlcdx(t,x)
% zagniezdzona w funkcji nested_ode(app,tzakres,x0,R)
w=100*pi; % pulsacja pradu
% parametry obwodu
psiE=60; %stopnie
E = 100; % V
% R=wartosc z suwaka przekazana  , om
L = XL/w; % XL w omach, L w H
Co=1/w/XC; % XC w omach, C w F
Em=sqrt(2)*E; % amplituda sem
psi=psiE/180*pi;
t0=0; tk=0.1; dt=0.001; % czas poczatku i konca analizy w s
tp=t0:dt:tk; % przedzial analizy
x0=[0 0]; % warunek poczatkowy
% wywolanie funkcji zagniezdzonej 
[t,x]=nested_ode(app,tp,x0,R,L,Co);
%
=x(:,1); % przebieg pradu
uC=x(:,2); % przebieg napiecia na kondensatorze
e=Em*sin(100*pi*t+psi); % wymuszenie sem e
uL=e-R*i-uC; % przebieg napiecia na cewce
uLuC=uL+uC; % suma napiec na cewce i kondensatorze
plot(app.UIAxes,t,uC,'r-',t,uL,'b--',t,uLuC,'k-',t,e,'g:','LineWidth',1.5);
plot(app.UIAxes2,t,i,'k-');
end

function [t,x]=nested_ode(app,tp,x0,R,L,Co);
    A = [-R/L  -1/L 
         1/Co     0];
    B = [1/L; 0];
    C = [1 0]; D=[0];

[t,x]=ode23(@orlcdx,tp,x0); 
    function dxdt=orlcdx(t,x)
    e=Em*sin(100*pi*t+psi); % wymuszenie
    dxdt=A*x+B*e; % rownanie stanu
    end
end