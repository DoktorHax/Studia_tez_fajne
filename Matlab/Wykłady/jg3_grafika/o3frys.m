function [U,I]= o3frys(Esk,Zodb,Zn)
% [U,I]=o3f(Esk,Zodb,Zn
% oblicza wektor napiec i pradow w obwodzie 3-fazowym
% skladajacym sie ze:
%     zrodla idealnego 3-fazowego
%     niesymetrycznego odbioru 3-fazowego
%     przewodu neutralego
% Dodatkowo rysowany jest wykres wektorowy za pomoca compass()
%     napiec 3-fazowych odbiornika
%     pradow 3-fazowych odbiornika
% compass(a,b) rysuje wektor o skladowych a,b
% compass(z) dla z=a+j*b oznacza compass(a,b)
if nargin < 3
    Zn=0.1;
end
if nargin < 2
    Zodb=10+20i;
end
if nargin < 1
    Esk=220;
end

j=sqrt(-1); w=2*pi*50;
% jednostki podstawowe
Up=Esk; Zb=abs(Zodb); Ip=Up/Zb;
za=1+j*1; % obciazenie 100%
zb=0.8+j*0.8; % obciazenie 80%
zc=0.5; % obciazenie rezystancyjne 50%
zn=Zn/Zb;
% obliczenia pradow i napiec
	Ea = sqrt(2);
	Eb = sqrt(2)*exp(j*( -2*pi/3) )
	Ec = sqrt(2)*exp(j*(  2*pi/3) )
ya=1/za; yb=1/zb; yc=1/zc;
yn=1/zn;
Un = (ya*Ea+yb*Eb+yc*Ec)/(ya+yb+yc+yn);
Ua=Ea-Un; Ub=Eb-Un; Uc=Ec-Un;
Ia=ya*Ua; Ib=yb*Ub; Ic=yc*Uc;
% wykresy wektorowe
U=[Ua Ub Uc]
compass(U), title('napiecia fazowe');
disp(' Dalej? Wcisnij ENTER');
pause;
I=[Ia Ib Ic]
compass(I), title('prady fazowe');
disp(' Dalej? Wcisnij ENTER');
pause;
% wykresy wektorowe z wykorzystaniem subplot
U=[Ua Ub Uc];
subplot(221), compass(U), title('napiecia fazowe');
I=[Ia Ib Ic];
subplot(222), compass(I), title('prad fazowe');
E=[Ea Eb Ec];
subplot(223), compass(E), title('sem');
subplot(224), compass(Un), title('napiecie punktu neutralnego');
pause;
% wyprowadzanie wynikow na ekran
disp('prady fazowe');
disp(' Ia, A '); Ia*Ip
disp(' Ib, A '); Ib*Ip
disp(' Ic, A '); Ic*Ip
disp('napiecia fazowe');
disp(' Ua, V '); Ua*Up
disp(' Ub, V '); Ub*Up
disp(' Uc, V '); Uc*Up
U=U*Up; % wartosci w V
I=I*Ip; % wartosci w A
U
I
disp('KONIEC');
return