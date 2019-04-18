function rnrys
% graficzny obraz rozkladu normalnego
m=3;
x=0:0.02*m:2*m;
s=0.1:0.1:1;
ns=length(s);
for k=1:ns
    y=rngauss(x,m,s(k));
    plot(x,y,'b');
    if k==1 hold on; end
end
grid on;
xlabel('x'); ylabel('N(x,m,s)');
title('Gestosc prawdopodobienstwa N(m,s) dla m=3 oraz s=0.1:0.1:1');
hold on;
input('Dalej?Enter');
close;
end
