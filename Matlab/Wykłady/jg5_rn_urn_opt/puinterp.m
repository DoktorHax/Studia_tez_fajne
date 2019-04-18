function puinterp
%pomiary
U = [150       180    190   200    210     220     230     240     250];
P=  [50.625 104.976 130.321 160  194.481 234.256 279.841 331.776 390.625];
%punkty interpolacyjne
Ui=150:10:250;
[nUi,mUi]=size(Ui);
x=U; y=P;
xi=Ui;
ynearest = interp1(x,y,xi,'nearest');
ylinear = interp1(x,y,xi,'linear');
%ycubic = interp1(x,y,xi,'cubic');
ycubic = interp1(x,y,xi,'pchip');
yspline = interp1(x,y,xi,'spline');

% wykres funkcji otrzymanej z interpolacji
plot(x,y,'o',xi,ynearest,'-r',xi,ylinear','--b',xi,ycubic,'-.g',xi,yspline,':m');
title('Interpolacja charakterystyki napieciowej P(U)');
axis([0 300 0 600]);
xlabel('U'); ylabel('P');
legend(' wezly','nearest','linear','cubic','spline');
grid on; pause(5);
close;
fd=fopen('puinterOUT.m','wt');
nxi=length(xi);
fprintf(fd,'\n Wyniki interpolacji P(U)');
fprintf(fd,'\n  Lp        Ui        Pi');
for i=1:nxi
    fprintf(fd,'\n %3d %9.4f %9.4f',i,xi(i),yspline(i));
end
fclose(fd);
end

