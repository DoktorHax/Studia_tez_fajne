function sininterp
% znane wartosci funkcji sinus odczytane z tabeli
% znane wartosci funkcji sinus odczytane z tabeli
%x = 0:0.5:pi; y = sin(x); % wezly interpolacji
x = 0:1:2*pi; y = sin(x); % wezly interpolacji
% poszukiwane wartosci funkcji sinus w punktach posrednich
%xi = 0:.1:pi;
xi = 0:.1:2*pi;
% interpolacja wielomianowa
ynearest = interp1(x,y,xi,'nearest');
ylinear = interp1(x,y,xi,'linear');
%ycubic = interp1(x,y,xi,'cubic');
ycubic = interp1(x,y,xi,'pchip');
yspline = interp1(x,y,xi,'spline');
 
% wykres funkcji otrzymanej z interpolacji
plot(x,y,'o',xi,ynearest,'-r',xi,ylinear','--b',xi,ycubic,'-.g',xi,yspline,':m');
title('Interpolacja wartoœci funkcji sinus');
xlabel('x'); ylabel('y');
legend(' wezly','nearest','linear','cubic','spline');
grid on; pause(5); close;
fd=fopen('sininterOUT.m','wt');
nxi=length(xi);
fprintf(fd,'\n Wyniki interpolacji funkcji sinus');
fprintf(fd,'\n  Lp        xi        yi');
for i=1:nxi
    fprintf(fd,'\n %3d %9.4f %9.4f',i,xi(i),yspline(i));
end
fclose(fd);
end
