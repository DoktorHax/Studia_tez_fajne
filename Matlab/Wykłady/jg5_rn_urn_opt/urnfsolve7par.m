function urnfsolve7par
t0=clock; % poczatek obliczen
fd  =fopen('urnfsolve7parOUT.m','wt');
fprintf(fd,'\n Uklad rownan zdefiniowny w funkcji  f=urn7par(x,p1,p2,p3,p4,p5,p6,p7)');
fprintf(fd,'\n f(1)=a* x(1)^2 + b*x(2)^2 +c*x(3)^2-4;');
fprintf(fd,'\n f(2)=d*x(1)*x(2)-1;');
fprintf(fd,'\n f(3)=e*x(1)*x(2)+f*x(1)*x(3)+g*x(2)*x(3)-2;');
fprintf(fd,'\n zostanie rozwiazany za pomoca fsolve z uzyciem wskaznika do funkcji');
fprintf(fd,'\n [x,fval,exitflag,output]=fsolve(@(x) urn7par(x,a,b,c,d,e,f,g),x0,options);');
%
a=1; b=1; c=1; d=1; e=1; f=1; g=1;
%par=[a b c d e f g];
options=optimset('Display','on','LargeScale','off','MaxIter',100,'TolCon',1e-4,'TolFun',1e-4,'TolX',1e-4);
%
fprintf(fd,'\n\n options=optimset(''Display'',''off'',''LargeScale'',''off'',''MaxIter'',100,''TolCon'',1e-4,''TolFun'',1e-4,''TolX'',1e-4);');
 
% 1-szy p. startowy
x0=[1 22 333]; x=x0; % punkt startowy obliczen
fprintf('\n\n 1-szy punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
%
%2-gi punkt startowy
x0=[-1 -22 -333]; x=x0; % punkt startowy obliczen
fprintf('\n\n\n 2-gi punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
 
%3-ci punkt startowy
x0=[1 2 -3]; x=x0; % punkt startowy obliczen
fprintf('\n\n\n 2-gi punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
 
%4-ty punkt startowy
x0=[1.1 0.9 1.0]; x=x0; % punkt startowy obliczen
fprintf('\n\n\n 2-gi punkt startowy obliczen: x0 = [%.2f  %.2f   %.2f]',x0(1),x0(2),x0(3));
[x,fval,exitflag,output]=fsolve(@(x)  urn7par(x,a,b,c,d,e,f,g),x0,options);
opisrozw(fd,x0,x,fval,exitflag,output);
%
et=etime(clock,t0); % czas obliczen
fprintf(fd,'\n Czas obliczen programem urnsolve tobl = %.2f sekund !', et);
fprintf(   '\n Czas obliczen programem urnsolve tobl = %.2f sekund !', et);
fclose('all');
fprintf('\n\n *** Wyniki w pliku urnfsolve7parOUT.m *** \n\n');
return

