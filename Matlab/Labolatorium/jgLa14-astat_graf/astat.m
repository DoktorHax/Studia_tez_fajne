function [mUab,sUab,mUbc,sUbc,mUca,sUca,Un]=astat
% funkcja [mUab,sUab,mUbc,sUbc,mUca,sUca,Un]=astat
% - czyta pomiary napiec z opliku upomiary.m
% - wykresla przebiegi czasowe napiecia
% - oblicza srednie i odchylenia standardowe 
[Uab,Ubc,Uca,Un,t]=feval(upomiary);
x=[]; x=[Uab Ubc Uca];
% Analiza pomiarow napiecia Uab
plot(t,Uab,'r-',t,Ubc,'b--',t,Uca,'m:');
grid on; xlabel(' czas, min'); ylabel(' U, pu');
title('Przebiegi czasowe nap. miedzyfazowych 20 kV w GPZ 110/20 kV ');
legend('Uab','Ubc','Uca');
fprintf('\n\n Dalej? Nacisnij ENTER');
pause; close;
fd=fopen('astatOUT.m','wt');
mU=mean(x,1); mUab=mU(1); mUbc=mU(2); mUca=mU(3);
sU=std(x,1);  sUab=sU(1); sUbc=sU(2); sUca=sU(3);
fprintf(fd,'\n\n Srednie i odchylenia nap. miedzyfazowych')
fprintf(fd,'  \n                  Uab       Ubc     Uca');
fprintf(fd,  '\n srednia        %5.3f     %5.3f   %5.3f',mUab,mUbc,mUca);
fprintf(fd,  '\n odch. stand.   %5.3g     %5.3g   %5.3g',sUab,sUbc,sUca);
MacKor=corrcoef(x);
fprintf(fd,'\n\n Macierz korelacji nap. miedzyfazowych')
fprintf(fd,  '\n                  Uab       Ubc     Uca');
fprintf(fd,  '\n Uab            %5.3f      %5.3f   %5.3f',MacKor(1,1),MacKor(1,2),MacKor(1,3) );
fprintf(fd,  '\n Ubc            %5.3f      %5.3f   %5.3f',MacKor(2,1),MacKor(2,2),MacKor(3,3) );
fprintf(fd,  '\n Uca            %5.3f      %5.3f   %5.3f',MacKor(3,1),MacKor(3,2),MacKor(3,3) );
%plot(frys,amrys);
hist(Uab);
xlabel('Napiecie Uab,pu');
ylabel('Czestosc wystepowania');
grid on;
% dane o przedzialach
[n,usr]=hist(Uab);
np=length(n); suman=sum(n); npu=n./suman
    fprintf(fd,'\n\n Parametry histogramu nap. Uab');
    fprintf(fd,'\n Nr. przedzialu   Srodek przedzialu   Licznosc przedzialu    Czestosc przedzialu');
    fprintf(   '\n Nr. przedzialu   Srodek przedzialu   Licznosc przedzialu    Czestosc przedzialu');
for i=1:np
    fprintf(fd,'\n %13d %20.8f %20d %20.3f',i,usr(i),n(i),npu(i));
    fprintf(   '\n %13d %20.8f %20d %20.3f',i,usr(i),n(i),npu(i));
end
fprintf('\n\n Dalej? Nacisnij ENTER');
pause;
close
fclose('all');
return


