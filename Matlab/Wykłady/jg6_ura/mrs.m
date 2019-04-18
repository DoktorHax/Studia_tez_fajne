function mrs
global A B u 
u=[1]; % skok jednostkowy jako sygnal wejsciowy
t0=clock; % czas rozpoczecia obliczen
   rok=int2str(t0(1)); miesiac=int2str(t0(2)); dzien=int2str(t0(3));
   godz=int2str(t0(4));mins=int2str(t0(5));seks=int2str(t0(6));
   czas=[rok '_' miesiac '_' dzien '_h' godz '_' mins];
plikWy= strcat('mrswy',czas);
% wybor œcie¿ki pliku do zapisu i nazwy pliku
wdold=cd;% aktualny katalog
[fn, cdnowyOUT]=uiputfile('*.m','Wybierz katalog na wyniki',plikWy); 
eval(['cd(''',cdnowyOUT,''')']);
fd=fopen(fn,'wt');
fprintf(fd,'\n function [tabwy]=%s',plikWy);
eval(['cd(''',wdold,''')']); % powrot do katalogu z programem
fprintf(fd,'\n%% Analiza macierzowego rownania stanu');
fprintf(fd,'\n%% Data: %5d-%2d-%2d  godz. %2d, %2dmin, %2.0fs',clock);
% wybor katalogu z danymi
[fname,sciezka]=uigetfile('*DAT.m','Wybierz plik z danymi','mrsDAT.m');
eval(['cd(''',sciezka,''')']); datafile=strtok(fname,'.');
fprintf(fd,'\n%%Przeczytano dane z pliku: %s%s.m\n\n',sciezka,datafile);
fprintf(   '\n  Przeczytano dane z pliku: %s%s.m\n\n',sciezka,datafile);
eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
[A,B,C,D]=feval(datafile);
[nA,mA]=size(A); % liczba zmiennych stanu
% Ustalenie czasu symulacji
t0=0; tmax=10; dt=0.01; 
tp=t0:dt:tmax;
x0=zeros(1,mA);
%options=odeset('RelTol',1e-4,'AbsTol',[1e-3 1e-3 1e-3 1e-4]);
[t,x]=ode45('mrsdx',tp,x0);
y=C*x' + D*u;
nt=length(t);
fprintf(fd,'\n %% Wyniki symulacji programu mrs();');
fprintf(fd,'\n%%  t[s]           u         y        x1      x2     x3...');
fprintf(fd,'\n tabwy=[');
for k=1:nt
    fprintf(fd,'\n %8.4g %9.3g %9.3g',t(k),u,y(k));
    for i=1:nA
        fprintf(fd,'%9.3g',x(k,i));
    end
end
fprintf(fd,'\n ];');
fprintf(fd,'\n end');
ut=ones(1,nt)';

   plot(t,ut,'-r',t,y,'--b','LineWidth',2); grid on;
   ymin=min(y);
   umax=max(u); osmax=umax;
   ymax=max(y); if ymax>umax osmax=ymax; end
   xmin=0; xmax=max(t); 
   axis([xmin xmax 0.9*ymin 1.1*osmax]);
   title('Przebieg sygnalu wejsciowego u(t) oraz wyjsciowego y(t)');
   grid on; xlabel('t[s]'); ylabel('u,y');
   legend('u(t)', 'y(t)');
   uyt = strcat('uyt_',czas); 
   saveas(gcf,uyt,'emf'); pause(5);     close;
   xi=[];
   for i=1:nA
         plot(t,x(:,i),'LineWidth',1.5);
         title('Przebieg x1(t), x2(t), x3(t), ...'); grid on;
         xlabel('t[s]');  ylabel('x(t)');
        cxi=int2str(i);  xi=[xi; 'x' cxi ]; 
        legend(xi);     hold on;
   end
    xt = strcat('xt_',czas); 
    saveas(gcf,xt,'emf'); pause(5); 
    hold on;
    close;
fprintf('\n KONIEC mrs() - wyniki w postaci funkcji w m-pliku: %s',plikWy);
fclose('all');
end
 
