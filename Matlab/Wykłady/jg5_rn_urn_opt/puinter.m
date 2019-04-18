function puinter
%pomiary
U=[210 215 220 225 230 235];
%P=[2.51 2.62 2.72 2.8 2.88 3.01];
P=[441.0 462.25  484.0  506.25  529.0  552.25];
%punkty interpolacyjne
Ui=[210:1:235];
[nUi,mUi]=size(Ui);
x=U; y=P;
xi=Ui;
ynearest = interp1(x,y,xi,'nearest');
ylinear = interp1(x,y,xi,'linear');
ycubic = interp1(x,y,xi,'cubic');
yspline = interp1(x,y,xi,'spline');

% wykres funkcji otrzymanej z interpolacji
plot(x,y,'o',xi,ynearest,'-r',xi,ylinear','--b',xi,ycubic,'-.g',xi,yspline,':m');
title('Interpolacja charakterystyki napieciowej P(U)');
xlabel('U'); ylabel('P');
legend(' wezly','nearest','linear','cubic','spline');
grid on; disp('dalej? enter'); pause;
close;
fd=fopen('puinterOUT.m','wt');
nxi=length(xi);
fprintf(fd,'\n Wyniki interpolacji P(U)');
fprintf(fd,'\n  Lp        Ui        Pi');
for i=1:nxi
    fprintf(fd,'\n %3d %9.4f %9.4f',i,xi(i),yspline(i));
end
fclose(fd);
return

