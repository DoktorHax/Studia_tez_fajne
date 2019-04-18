function prsym
% Funkcja szacuje prawdopodobienstwo
% nie przekroczenia dopuszczalnego rozchylu katowego systemow 
fd=fopen('prsymOUT.m','wt');
wdold=cd;
[fname,sciezka]=uigetfile('prsymDAT*.m','Wybierz plik z danymi\n\n\n');
eval(['cd(''',sciezka,''')']);  datafile=strtok(fname,'.');
fprintf(fd,'\n Wybrano plik danych: %s',datafile);
[Pmin,Pmax,Qmin,Qmax,Umin,Umax,Xmin,Xmax,dkdop]=feval(datafile); 
eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
% SYMULACJA
rng('shuffle'); % generator liczb pseudolosowych bazuje na zegarze
nsym=4*10000; % liczba symulacji jednakowa dla kazdej zmiennej losowej
pseudor=rand(nsym,1);isym=0; dsym=[]; irealizacja=0;
while isym<nsym
irealizacja=irealizacja+1;
rP=Pmin+(Pmax-Pmin)*pseudor(isym+1);
rQ=Qmin+(Qmax-Qmin)*pseudor(isym+2);
rU=Umin+(Umax-Umin)*pseudor(isym+3); 
rX=Xmin+(Xmax-Xmin)*pseudor(isym+4);
isym=isym+4;
dsym(irealizacja)=atan(rP/(rQ+rU^2./rX));
end
% uporzadkowanie rosnaco realizacji funkcji zmiennych losowych
dsymsort=sort(dsym);
% dystrybuanta empiryczna
ndsymsort=length(dsymsort); prsym=1:ndsymsort; prsym=prsym/ndsymsort;
[prdop,ysr,sigma,Fea]=Feaprox(fd,dsymsort,prsym,dkdop);
fprintf(fd,'\n Zrealizowano %d losowan, dla poszczegolnych zmiennych losowych',nsym/4);
fprintf(fd,'\n Dopuszczalny rozchyl katowy %g stopni',dkdop*180/pi);
fprintf(fd,'\n Prawdopoodbienstwo nie przekroczenia dopuszczalnego rozchylu katowego: %g',prdop);
fclose('all');
return