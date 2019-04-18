function [mUab,sUab,mUbc,sUbc,mUca,sUca,Un]=Uanstat
% funkcja [mUab,sUab,mUbc,sUbc,mUca,sUca,Un]=Uanstat
% - czyta pomiary napiec z arkusza xlsx
% - wykresla przebiegi czasowe napiecia
% - oblicza srednie i odchylenia standardowe 
fd=fopen('UanstatOUT.m','wt');
fprintf('\n\n Uanstat - poczatek analizy statystycznej napiec w GPZ');
[Uab,Ubc,Uca,Un,t]=Umf; % czytanie pomiarow

x=[Uab Ubc Uca]; % macierz zmiennej losowej 3-wymiarowej
% Analiza pomiarow napiecia Uab
plot(t,Uab,'k-',t,Ubc,'b--',t,Uca,'r:');
grid on; xlabel(' czas, min'); ylabel(' U, pu');
title('Przebiegi czasowe nap. miedzyfazowych 20 kV w GPZ 110/20 kV ');
legend('Uab','Ubc','Uca');
saveas(gcf,'Ut','emf');
pause(5); close;

mU=mean(x,1); mUab=mU(1); mUbc=mU(2); mUca=mU(3);
sU=std(x,1);  sUab=sU(1); sUbc=sU(2); sUca=sU(3);
fprintf(fd,'\n\n Srednie i odchylenia nap. miedzyfazowych');
fprintf(fd,'  \n                  Uab       Ubc     Uca');
fprintf(fd,  '\n srednia        %5.4g     %5.4g   %5.4g',mUab,mUbc,mUca);
fprintf(fd,  '\n odch. stand.   %5.4g     %5.4g   %5.4g',sUab,sUbc,sUca);
 
MacKor=corrcoef(x);
fprintf(fd,'\n\n Macierz korelacji nap. miedzyfazowych');
fprintf(fd,  '\n                  Uab       Ubc     Uca');
fprintf(fd,  '\n Uab            %5.4g      %5.4g   %5.4g',MacKor(1,1),MacKor(1,2),MacKor(1,3) );
fprintf(fd,  '\n Ubc            %5.4g      %5.4g   %5.4g',MacKor(2,1),MacKor(2,2),MacKor(2,3) );
fprintf(fd,  '\n Uca            %5.4g      %5.4g   %5.4g',MacKor(3,1),MacKor(3,2),MacKor(3,3) );
%  badanie rozkladu prawdopoodbienstwa
x=Uab; xopis='Uab';
%x, xopis
rntest(fd,xopis,x); % szacowanie rozkladu prawdopodobienstwa
%
fprintf('\n\n Uanstat - koniec analizy statystycznej pomiarow napiec');
fprintf('\n\n Wyniki zapisano w pliku UanstatOUT.m oraz w plikach graficznych *.emf');
fclose('all');
end
