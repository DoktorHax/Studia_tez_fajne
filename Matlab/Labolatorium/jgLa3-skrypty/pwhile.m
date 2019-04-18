% skrypt pwhile.m
% korzystajac z szeregu Maclaurina
% exp(x)=1+x+x^2/2+x^3/6+x^4/24+..
% obliczyc liczbe exp z dokladnoscia eps=1e-3
eps=1e-3; a=1; x=a; nsilnia=1; k=0; Rn=1;
y=1;
while Rn>=eps
k=k+1;
nsilnia=nsilnia*k;
Rn=x^k/nsilnia;
y=y+Rn;
end
disp(' exp(1) = '); disp(y);
%koniec skryptu