function [a,ua,b,ub,r,aw,bw]=arl(x,y)
% metoda liniowej regersji y=ax+b + eps
farl=fopen('arlOUT.m','wt');
if nargin<1
%      U     I
pom=[3.28 0.0195;
     4.74 0.0282;
     6.31 0.0375;
     7.83 0.0466;
     9.51 0.0567;
    12.28 0.0733];
x=pom(:,1); y=pom(:,2);
end
[nx,mx]=size(x);
if nx>1     n=nx; else     n=mx; end
w1=ones(n,1);
% dla linii regresji Y=aX+b + eps
fprintf(farl,'\n\n *** obliczenia posrednie analizy regresji ***');
fprintf(farl,'\n n=%d',n);
sumx=sum(x); x2=x.^2; sumx2=sum(x2); xsr=sumx/n;
%sumx, sumx2
sumy=sum(y); y2=y.^2; sumy2=sum(y2); ysr=sumy/n;
%sumy, sumy2
xy=x.*y;
sumxy=sum(xy);
%sumxy
dx=x-xsr*w1;
dx2=dx.^2; sumdx2=sum(dx2);
fprintf(farl,'\nsumdx2=sum((x-xsr)^2)= %9.4g',sumdx2);
fprintf(farl,'\n sumx2=sum(x^2)      = %9.4g',sumx2);
sx2=sum(dx.^2)/(n-1);ux2=sum(dx.^2)/n/(n-1);
sx=sqrt(sx2);        ux=sqrt(ux2);
%xsr,sx
dy=y-ysr*w1;
sy2=sum(dy.^2)/(n-1); uy2=sum(dy.^2)/n/(n-1);
sy=sqrt(sy2);         uy=sqrt(uy2);
%ysr,sy
dxdy=dx.*dy;
sumdxdy=sum(dxdy);
fprintf(farl,'\nsum(xy)=sum((x-xsr)(y-ysr))=%9.4g',sumdxdy);
covxy=sum(dxdy)/(n-1);
rxy=covxy/sx/sy;
%covxy,rxy
covxy=sum(dxdy)/(n-1);
fprintf(farl,'\n sxy=covxy=%9.4g',covxy);
fprintf(farl,'\n sx2=varx= %9.4g,   sx=sqrt(sx2)=%9.4g',sx2,sx);
fprintf(farl,'\n sy2=vary= %9.4g,   sy=sqrt(sy2)=%9.4g',sy2,sy);
Dxy=n*sumxy-sumx*sumy;
Dx2=n*sumx2-(sumx)^2;
Dy2=n*sumy2-(sumy)^2;
%Dxy
%Dx2,
a=Dxy/Dx2;
%a
a=covxy/sx2; disp('stat a='), disp(a)
b=(sumy*sumx2-sumx*sumxy)/Dx2;
%b
b=ysr-a*xsr; disp('stat b='), disp(b)
eps=y-b*w1-a*x;
%eps
eps2=eps.^2;
sumeps2=sum(eps2); 
fprintf(farl,'\n        sumeps2=sum(eps^2)=%9.4g',sumeps2);
%sumeps2
s2=sumeps2/(n-2);
s=sqrt(s2);
fprintf(farl,'\n        s2=eps^2/(n-2)=%9.4g',s2);
fprintf(farl,'\n odch.stand. sqrtg(s2)=%9.4g',s);
%s
sa=s*sqrt(n/Dx2);
sb=s*sqrt(sumx2/Dx2);
%sa,sb
sa2=s2/(sx2*(n-1));
ua=sqrt(sa2);
sb2=sumx2*s2/n/(sx2*(n-1));
ub=sqrt(sb2);
disp('stat ua='), disp(ua)
disp('stat ub='), disp(ub)
r=(n*sumxy-sumx*sumy)/sqrt(Dx2*Dy2);
%a,ua, b,ub,r
% dopasowanie linii PROSTEJ do pomiarow
iw=floor(n/2);
aw=(ysr-y(iw))/(xsr-x(iw));
bw=ysr-aw*xsr;
yw=aw*x+bw;
dyw=y-yw;
fprintf(farl,'\n Linia prosta DOPASOWANA do pomiarow yw=aw*x+bw');
fprintf(farl,'\n aw= %9.4g',aw);
fprintf(farl,'\n bw= %9.4g',bw);
fprintf(farl,'\n Pomiar     x  yw=aw*x+bw  y-yw');
for i=1:n
    fprintf(farl,'\n %2d %9.4g %9.4g %9.4g', i,x(i),yw(i),dyw(i) );  
end

fprintf(farl,'\n Metoda regresji liniowej');
fprintf(farl,'\n Liczba pomiarow n = %d',n);
fprintf(farl,'\n xsr = %9.4g  odch. stand. sx = %9.4g, niepewnosc wartosci sredniej ux = %9.4g',xsr,sx,ux);
fprintf(farl,'\n ysr = %9.4g  odch. stand. sy = %9.4g, niepewnosc wartosci sredniej uy = %9.4g',ysr,sy,uy);
fprintf(farl,'\n rxy = %9.4g',rxy);
yreg=a*x+b*w1;
fprintf(farl,'\n Linia regresji I=aU+b');
fprintf(farl,'\n a = %9.4g, niepewnosc standardowa ua = %9.4g',a,ua);
fprintf(farl,'\n b = %9.4g, niepewnosc standardowa ub = %9.4g',b,ub);
fprintf(farl,'\n wsp. korelacji r = %9.4g',r);
fprintf(farl,'\n Pomiar     x        dx        x2         y         dy        y2        xy      dxdy      ax+b   eps=y-ax-b   eps^2 ');
for i=1:n
    fprintf(farl,'\n %2d %9.4g %9.4g %9.4g %9.4g  %9.4g %9.4g %9.4g %9.4g %9.4g  %9.4g %9.4g %9.4g',...
                     i,x(i),dx(i),x2(i),y(i),dy(i), y2(i),xy(i),dxdy(i),yreg(i),eps(i), eps2(i) );  
end
fprintf(farl,'\nSUMA %8.4g           %9.4g %9.4g            %9.4g %9.4g                                %9.4g',...
    sumx,         sumx2, sumy,       sumy2,sumxy,                 sumeps2);

% wykresy 
plot(x,y,'X',x,yw,'-k');
title('Pomiary i dopasowana PROSTA yw=aw*x+bw');
ylabel('y'); xlabel('x');
legend('pomiary','dopasowana PROSTA');
grid on; pause; disp('Dalej? ENTER');
close;
plot(x,y,'X',x,yreg,'-k');
title('Pomiary oraz Linia regresji y=a*x+b');
ylabel('y'); xlabel('x');
legend('pomiary','regersja');
grid on; pause; disp('Dalej? ENTER');
close;
fclose(farl);
fprintf('\n Wyniki w arlOUT.m');
return

