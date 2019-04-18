function okrag
% okrag x^2+y^2=r^2 w ukladzie wsp. x=-4:0.1:4, y=[-4 ]
r=2; % promien
x=-4:0.1:4; % zakres zmiennosci x
y1p=sqrt(-x.^2+r^2); % 1-szy polokrag
x1okrag=x;
x1okrag(imag(y1p)~=0) = []; % dla braku punktow okregu
y1p(imag(y1p)~=0) = []; % bez czesci urojonych
 y1m=-y1p; % 2gi polokrag
plot(x1okrag,y1p, '-b',x1okrag,y1m, '-r');
axis([-4 4 -4 4]); hold on;
% hiperbola y=a/x, y=b/x
a=0.5; b=3;
y2=a*x.^(-1); y3=b*x.^(-1);
plot(x, y2, '--g', x, y3, ':k');
axis([-4 4 -4 4]);
grid on;
opis1='x^2+y^2=r^2 - okrag, y=a/x, y=b/x - parabole';
title(opis1);
legend(' Polokrag minus', ' Polokrag plus', ' Hiperbola 1', ' Hiperbola 2');
xlabel('x'); ylabel('y');
fprintf('\n\n ... czekaj na zamkniecie okna graficznego ...\n');
pause(10); 
close;
end
