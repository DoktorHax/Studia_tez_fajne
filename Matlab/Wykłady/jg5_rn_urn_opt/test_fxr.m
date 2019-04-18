function test_fxr
%% Ilustruje rozwiazywanie rownania nieliniowego zle uwarunkowanych
fprintf('\n Funkcja test_fxr');
fprintf('\n - wykresla f(x) za pomoca funkcji fplot()');
fprintf('\n - wyznacza miejsca zerowe za pomoca fzero()');
% wykres funkcji nieliniowej
%lims=[-200 200 -20000 20000];
%punkty startowe x10=1.5, x20=-0.5, x30=0.5
fd  =fopen('test_fxrOUT.m','wt');
%fplot('[test_fx(x)]',lims);
limx=[-2,2];
fplot(@(x) test_fx(x), limx );
xlabel('x'); ylabel('y');hold on;
grid on; pause(5);
%return% dla oszacowania punktow startowych na wykresie
fprintf('\n\n %% 1-sze miejsce zerowe');
x10=1.5;
[x1,fval,exitflag,output]=fzero('test_fx',x10);
if exitflag>0
   fprintf('\n Rozwiazanie zbiezne');
   fprintf('\n x1=%.15f dla p.startowego x10=%.2f',x1,x10);
   fprintf('\n fval=%.8f',fval);
   fprintf('\n exitflag=%3d',exitflag);
   fprintf('\n output.algorithm=%s',output.algorithm);
   fprintf('\n output.funcCount=%d',output.funcCount);
   fprintf('\n output.intervaliterations=%d',output.intervaliterations);
   fprintf('\n output.iterations=%d',output.iterations);
   fprintf('\n output.message=%s',output.message);
 
end
if exitflag>0     fprintf('\n Proces zbiezny ');
else     fprintf('\n Brak zbieznosci procesu'); end
 
fprintf('\n\n %% 2-gie miejsce zerowe');
x20=-0.5;
[x2,fval,exitflag,output]=fzero('test_fx',x20);
if exitflag>0
   fprintf('\n Rozwiazanie zbiezne');
   fprintf('\n x2=%.15f dla p.startowego x20=%.2f',x2,x20);
   fprintf('\n fval=%.8f',fval);
   fprintf('\n exitflag=%3d',exitflag);
   fprintf('\n output.algorithm=%s',output.algorithm);
   fprintf('\n output.funcCount=%d',output.funcCount);
   fprintf('\n output.intervaliterations=%d',output.intervaliterations);
   fprintf('\n output.iterations=%d',output.iterations);
   fprintf('\n output.message=%s',output.message);
 
end
if exitflag>0     fprintf('\n Proces zbiezny ');
else     fprintf('\n Brak zbieznosci procesu'); end
 
fprintf('\n\n %% 3-ie miejsce zerowe');x30=0.5;
[x3,fval,exitflag,output]=fzero('test_fx',x30);
if exitflag>0
   fprintf('\n Rozwiazanie zbiezne');
   fprintf('\n x3=%.15f dla p.startowego x30=%.2f',x3,x30);
   fprintf('\n fval=%.8f',fval);
   fprintf('\n exitflag=%3d',exitflag);
   fprintf('\n output.algorithm=%s',output.algorithm);
   fprintf('\n output.funcCount=%d',output.funcCount);
   fprintf('\n output.intervaliterations=%d',output.intervaliterations);
   fprintf('\n output.iterations=%d',output.iterations);
   fprintf('\n output.message=%s',output.message);
 
end
if exitflag>0     fprintf('\n Proces zbiezny ');
else     fprintf('\n Brak zbieznosci procesu'); end

%%% zaznaczenie wyznaczonych rozwiazan na wykresie funkcji
hold on
plot(x3,0,'mo',x2,0,'r*',x1,0,'bx');
text(x3,0.1,' x3'); text(x2,0.1,' x2'); text(x1,0.1,' x1'); 
title('y= x^3 + log(x^2) + sin(x) + 4 ');
grid on;
saveas(gcf,'test_fxr','emf');
pause(5); close;
fprintf('\n');
fprintf(fd, '\n Rozwiazania rownania nieliniowego');
fprintf(fd, '\n    y = x^3 + log(x^2) + sin(x)+4');
fprintf(fd, '\n po przyjeciu punktow: ');
fprintf(fd, '\n Start         Rozwiazanie');
fprintf(fd, '\n x10 = %6.2f,  x1=%.15f',x10,x1);
fprintf(fd, '\n x20 = %6.2f,  x2=%.15f',x20,x2);
fprintf(fd, '\n x30 = %6.2f,  x3=%.15f',x30,x3);
fclose('all');
end

