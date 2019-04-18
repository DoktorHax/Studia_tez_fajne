function rlcman
global R1 L1 R2 L2 M C D E psi
t0=clock; % czas rozpoczecia obliczen
godz=int2str(t0(4));mins=int2str(t0(5));seks=int2str(t0(6));
czas=['_' godz '_' mins '_' seks];
plikWy= strcat('rlcmwy',czas);
% wybor œcie¿ki pliku do zapisu i nazwy pliku
wdold=cd;% aktualny katalog
[fn, cdnowyOUT]=uiputfile('*.m','Wybierz katalog na wyniki',plikWy); 
eval(['cd(''',cdnowyOUT,''')']);
fd=fopen(fn,'wt');
fprintf(fd,'\n function [tabwy]=%s',plikWy);
eval(['cd(''',wdold,''')']); % powrot do katalogu z programem
fprintf(fd,'\n%%Symulacja stanu nieustalonego w obwodzie RLCM');
fprintf(fd,'\n%% Data: %5d-%2d-%2d  godz. %2d, %2dmin, %2.0fs',clock);
% wybor katalogu z danymi
[fname,sciezka]=uigetfile('*DAT.m','Wybierz plik z danymi','rlcmDAT.m');
eval(['cd(''',sciezka,''')']); datafile=strtok(fname,'.');
fprintf(fd,'\n%%Przeczytano dane z pliku: %s%s.m\n\n',sciezka,datafile);
fprintf(   '\n  Przeczytano dane z pliku: %s%s.m\n\n',sciezka,datafile);
eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
[tabwe]=feval(datafile);
R1=tabwe(1,1);L1=tabwe(1,2);
R2=tabwe(1,3);L2=tabwe(1,4);
M=tabwe(1,5); C = tabwe(1,6);
E=tabwe(1,7); psi=tabwe(1,8);
D=M^2-L1*L2;
% Ustalenie czasu symulacji
t0=0; tmax=10; dt=0.01; 
tp=t0:dt:tmax;
% predkosc katowa wirowania wektorow w=100*pi
w=100*pi;
x0=[0 0 10];
%options=odeset('RelTol',1e-4,'AbsTol',[1e-3 1e-3 1e-3 1e-4]);
[t,x]=ode45('rlcmdx',tp,x0);
nt=length(t);
fprintf(fd,'\n %% Wyniki symulacji programu rlcman();');
fprintf(fd,'\n%%      t[s]           i1[A]      i2[A]     uc[V]');
fprintf(fd,'\n tabwy=[');
for k=1:nt
    fprintf(fd,'\n %8.4f    %12.6f %12.6f %12.6f',t(k),x(k,1),x(k,2),x(k,3) );
end
fprintf(fd,'\n ];');
fprintf(fd,'\n end');
   t0=clock; % czas rozpoczecia wykresow
   rok=int2str(t0(1)); miesiac=int2str(t0(2)); dzien=int2str(t0(3));
   godz=int2str(t0(4));mins=int2str(t0(5));seks=int2str(t0(6));
   czas=['data' rok '-' miesiac '-' dzien '_h' godz '_' mins '_' seks];
   plot(t,x(:,1),t,x(:,2));
   title('Przebieg pradu i1(t), i2(t)'); grid on;
    xlabel('t[s]');  ylabel('i[A]'); legend('i1(t)','i2(t)');
    prady = strcat('Prady_',czas); 
    saveas(gcf,prady,'fig'); pause(5);
    close;
   plot(t,x(:,3));
    title('Przebieg napiecia na kondensatorze uC(t)'); grid on;
    xlabel('t[s]');  ylabel('uC[V]');
    napC = strcat('Nap_kond_',czas); 
    saveas(gcf,napC,'fig'); pause(5);
    close;
fprintf('\n KONIEC');
fclose('all');
end

