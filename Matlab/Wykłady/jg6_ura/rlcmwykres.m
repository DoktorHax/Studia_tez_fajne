function rlcmwykres
fprintf('\n Wykres stanu stanu nieustalonego w obwodzie RLCM');
fprintf('\n%% Data: %5d-%2d-%2d  godz. %2d, %2dmin, %2.0fs',clock);
% wybor katalogu z danymi do wykresu
wdold=cd;% aktualny katalog
[fname,sciezka]=uigetfile('rlcm*.m','Wybierz plik z danymi do wykresu');
eval(['cd(''',sciezka,''')']); datafile=strtok(fname,'.');
fprintf(   '\n  Przeczytano dane z pliku: %s%s.m\n\n',sciezka,datafile);
eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
[tabwy]=feval(datafile);
%      t[s]           i1[A]      i2[A]     uc[V]
% tabwy=[
%   0.0000        0.000000     0.000000     0.000000
%   0.0100        0.182514    -0.073563    -0.005591
t=tabwy(:,1); i1=tabwy(:,2); i2=tabwy(:,3); uC=tabwy(:,4); 
   t0=clock; % czas rozpoczecia wykresow
   rok=int2str(t0(1)); miesiac=int2str(t0(2)); dzien=int2str(t0(3));
   godz=int2str(t0(4));mins=int2str(t0(5));seks=int2str(t0(6));
   czas=['data' rok '-' miesiac '-' dzien '_h' godz '_' mins '_' seks];
   plot(t,i1,t,i2);
   title('Przebieg pradu i1(t), i2(t)'); grid on;
    xlabel('t[s]');  ylabel('i[A]'); legend('i1(t)','i2(t)');
    prady = strcat('Prady_',czas); 
    saveas(gcf,prady,'fig'); pause(5);
    close;
   plot(t,uC);
    title('Przebieg napiecia na kondensatorze uC(t)'); grid on;
    xlabel('t[s]');  ylabel('uC[V]');
    napC = strcat('Nap_kond_',czas); 
    saveas(gcf,napC,'fig'); pause(5);
    close;
fprintf('\n KONIEC wykresow');
fclose('all');
end
