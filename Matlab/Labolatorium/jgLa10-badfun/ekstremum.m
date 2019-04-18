function ekstremum
% fmin('funkcja',xa, xb)
%     - znajduje minmum  funkcji zdefioniowej w m-pliku 'funkcja' w przedziale od xa do xb
% fminbnd(f,xa, xb) /nowsza wersja/
%     - znajduje minmum  funkcji zdefiniowej w m-pliku 'funkcja' w przedziale od xa do xb,
%       przy czym f = inline('funkcja');
%
% wyznaczyc minimum funkcji f(x) = x^2 - 6x +2 w przedziale (-4,+4)
% przy pomocy fmin()
xa=-4; xb=4;
x=xa:0.01:xb;
xmin1=fmin('x.^2-6*x+2',xa,xb);
fmin1=fx(xmin1);
xmin1, fmin1
% przy pomocy fminbnd()
f=inline('x.^2-6*x+2');
xmin2=fminbnd(f,xa,xb);
fmin2=f(xmin2);
xmin2,fmin2
return
