function [xsr,s2,s]=histogram(xnp)
% analiza histogramu
if nargin < 1
    xnp=[ 
        0   300 53
        300 600 41
        600 900 30
        900 1200    22
        1200    1500    16
        1500    1800    12
        1800    2100    9
        2400    2700    5
        2700    3000    3
        3000    3300    2
        3300    3600    0
    ];
end
[nw,mk]=size(xnp);
xid=xnp(:,1);
xig=xnp(:,2);
ni=xnp(:,3);
sumni=sum(ni)
n=sumni
k=nw;
fprintf('\n liczba klas k = %d', k);
hi=xig-xid; % szerokosc przedzialow
xi0=(xid+xig)/2; % srodki przedzialow
xi0ni=xi0.*ni; % 
sumxi0ni=sum(xi0ni)
xsr=sumxi0ni/n
dxi0=xi0-xsr; 
dxi02ni=dxi0.^2.*ni; % kwadraty odchylen od sredniej
sumdxi02ni=sum(dxi02ni)
s2=sumdxi02ni/n
s2d=s2*n/(n-1)
s=sqrt(s2)
sd=sqrt(s2d)
%
fprintf('\n\n xsr=%f,   s2=%f,    s2d=%f,    s=%f,    sd=%f',...
    xsr,s2,s2d,s,sd);
fprintf('\n\n');
%
% skumulowane czestosci
nidystr(1,1)=ni(1,1);
for i=2:k
    nidystr(i,1)=nidystr(i-1)+ni(i,1);
end
nidystr=nidystr/n;
fprintf('\n i      xi0       ni       nidystr');
for i=1:k
    fprintf('\n %2d %8.2f %8d  %8.2f',i, xi0(i,1),ni(i,1), nidystr(i,1) );
end
wni=ni/n;
plot(xi0,wni,'*b'); title('xi(ni/n) - wykres czestosci zmiennej w probie');
grid on; xlabel('xi0'); ylabel('ni/n');
disp('Dalej? ENTER'); pause; close;

plot(xi0,nidystr,'*b'); title(' xi(ni/n) - wykres SKUMULOWANYCH czestosci zmiennej w probie');
grid on; xlabel('xi0'); ylabel('ni/n');
disp('Dalej? ENTER'); pause; close;

lambda=1/xsr
ft=lambda*exp(-lambda*xi0);
plot(xi0,wni,'*b',xi0,ft,'-k'); 
title('xi(ni/n) - wykres czestosci zmiennej w probie');
legend('histogram','rozklad wykladniczy');
grid on; xlabel('xi0'); ylabel('ni/n');
disp('Dalej? ENTER'); pause; close;

return