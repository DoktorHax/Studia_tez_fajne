function korelacja
%przeksztalcenie liniowe zmiennych losowych
% X=A*Z
% Mx - macierz kowariancji - szukana
% Mz  - macierz kowariancji znana
% 
A=[1 2
    3 4];
Mz=[123 0
    0  456];
Mx=A*Mz*A';
A
B=A'
Mx
Vx=[Mx(1,1) 0
    0     Mx(2,2)];
Dx=sqrt(Vx);
Dx1=Dx(1,1)
Dx2=Dx(2,2)
R(1,1)=Mx(1,1)/Dx1/Dx1
R(1,2)=Mx(1,2)/Dx1/Dx2
R(2,1)=Mx(2,1)/Dx2/Dx1
R(2,2)=Mx(2,2)/Dx2/Dx2
Vx
Dx
R
A=[]; Mz=[]; Mx=[]; B=[];
A=[30 0
    0 8
    1 0
    0 1
    8 0
]
Mz=[4 0
    0 2]
B=A'
AMz=A*Mz
Mx=AMz*B
Mx

return
