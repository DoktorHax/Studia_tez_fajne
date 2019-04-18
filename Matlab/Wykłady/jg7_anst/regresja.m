function regresja

tab=[
%    kobiety    mezczyzni
        18      21
        24      29
        40      51
        33      30
    ];
% linjia regresji
[n,m]=size(tab)

x=tab(:,1)
y=tab(:,2)
sumx=sum(x)
sumy=sum(y)
xsr=sumx/n
ysr=sumy/n
x2=x.^2
sumx2=sum(x2)

xy=x.*y
sumxy=sum(xy)
xsrysr=xsr*ysr
nxsrysr=n*xsr*ysr
xsr2=xsr^2
nxsr2=n*xsr2
a=(sumxy-n*xsr*ysr)/(sumx2-n*xsr^2)
axsr=a*xsr
ysr
b=ysr-a*xsr


return