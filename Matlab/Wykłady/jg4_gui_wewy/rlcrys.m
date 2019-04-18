function rlcrys(k);
% ========== SYMULACJA REZONANSU dla zmienianej pojemnosci =====================
global Cs C vslider vedit rys
j=sqrt(-1); w=2*pi*50;
R=0.02; XL=0.03; E=220*exp(j*pi/6);
if k==1
Cs=0.01;
set(rys,'Enable','on');
elseif k==2
C=get(vslider,'value');
set (vedit,'string',['Cs=',num2str(C)]);
Cs=C
end
if k==3
    XC=1/w/Cs;
    Z=R+j*(XL-XC);
    I=E/Z;
    UR=R*I;
    UL=j*XL*I;
    UC=-j*XC*I;
    subplot(323),compass(I),title('prad I');
    subplot(324),compass(UL),title('napiecie na cewce UL');
    subplot(325),compass(UC),title('napiecie na kondensatorze UC' );
    ULC=UL+UC;
    subplot(326),compass(ULC),title('napiecie na cewce i kondensatorze ULC' );
end
return


