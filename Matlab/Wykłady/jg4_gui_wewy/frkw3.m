function frkw3
% Funkcja frkw3.m 
% - otwiera plik na wyniki ze znacznikiem czasu
% - czytana dane z m-pliku, 
% - wyznacza miejsca zerowe za pomoca funkcji roots(),
% - zapisuje wyniki w otwartym pliku tekstowym i na ekranie
%
% uiputfile() - zakladanie pliku tekstowego ze znacznikiem daty
% uigetfile() - czytanie danych z pliku 
%
 t0=clock; % czas rozpoczecia obliczen
 rok=int2str(t0(1)); miesiac=int2str(t0(2)); dzien=int2str(t0(3));
 godz=int2str(t0(4));min=int2str(t0(5));
 % tworzenie nazwy pliku ze znacznikiem czasu
 nazwa=['frkw3OUT_',dzien,'-',miesiac,'-',rok,'_',godz,'h',min,'min.m'];
 [nazwa,sciezka] =...
     uiputfile(nazwa,' UWAGA! Zakceptuj nazwe ... albo wpisz nowa');
 fnames=strcat(sciezka,nazwa);
[fd,msg]=fopen(fnames,'wt');
fprintf(fd,'\n Otwarto plik tekstowy o nazwie ze znacznikiem czasowym \n %s',...
    fnames);
fprintf(fd,'\n Data: %5d-%2d-%2d  godz. %2d, %2dmin, %2.0fs',clock);
fprintf(   '\n Otwarto plik tekstowy o nazwie ze znacznikiem czasowym \n %s',...
    fnames);
fprintf(   '\n Data: %5d-%2d-%2d  godz. %2d, %2dmin, %2.0fs',clock);
%
% czytanie danych z m-pliku 
wdold=cd;
[fname,sciezka]=uigetfile('frkwdat*.m','Wybierz a,b,c z m-pliku ...\n');
        eval(['cd(''',sciezka,''')']);
        datafile=strtok(fname,'.');
        fprintf('\n  ... CZYTANIE danych tekstowych ...');
        fprintf(fd, '\n  ... wybrano sciezke dostepu: %s',sciezka);
        fprintf(    '\n  ... wybrano sciezke dostepu: %s',sciezka);
        fprintf(fd, '\n  ... nazwa wybranego m-pliku: %s.m',datafile); 
        fprintf(    '\n  ... nazwa wybranego m-pliku: %s.m',datafile); 
   [a,b,c,d]=feval(datafile); % czytanie danych z wybranego m-pliku
 fprintf(fd,'\n ... sciezka dostepu po wybraniu pliku: %s  ',pwd);
 fprintf(fd,'\n Przeczytano dane z wykorzystaniem funkcji uigetfile() z pliku: %s.m ',datafile) ;
 fprintf(   '\n ... sciezka dostepu po wybraniu pliku: %s  ',pwd);
 fprintf(   '\n Przeczytano dane z wykorzystaniem funkcji uigetfile() z pliku: %s.m ',datafile) ;
        eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
 fprintf(fd,'\n ... sciezka dostepu po powrocie do katalogu roboczego: %s ',pwd);
 fprintf(   '\n ... sciezka dostepu po powrocie do katalogu roboczego: %s ',pwd);
 fprintf(fd,'\n Przeczytane dane: a=%g, b=%g, c=%g',a,b,c);
 fprintf(   '\n Przeczytane dane: a=%g, b=%g, c=%g',a,b,c);
fprintf(fd,'\n  Przeczytano dane z pliku: %s%s.m\n',sciezka,datafile);
fprintf(   '\n  Przeczytano dane z pliku: %s%s.m\n',sciezka,datafile);
% W(x) = a*x^3 + b*x^2 + c*x + d- wielomian 
% OBLICZENIA
fprintf(fd,'\n PARAMETRY ROWNANIA:');
fprintf(fd,'\n    a = %7.3f,  b = %7.3f,  c = %.3g,   d=%g',a,b,c,d);
fprintf(   '\n PARAMETRY ROWNANIA:');
fprintf(   '\n    a = %7.3f,  b = %7.3f,  c = %.3g,   d=%g',a,b,c,d);
C=[a b c d];
x=roots(C); % rozwiazanie wielomianu
rex=real(x); imx=imag(x);
fprintf(fd,'\n ROZWIAZANIE ROWNANIA:');
fprintf(fd,'\n Lp        real(x)         imag(x)');
fprintf(   '\n ROZWIAZANIE ROWNANIA:');
fprintf(   '\n Lp        real(x)         imag(x)');
nx=length(x);
for i=1:nx
    fprintf(fd,'\n%2d %15.6f %15.6f',i,rex(i),imx(i) );
    fprintf(   '\n%2d %15.6f %15.6f',i,rex(i),imx(i) );
end
et=etime(clock,t0); % czas dzialania programu
fprintf(fd, '\n Czas dzialania funkcji frkw() tobl = %.2f sekund !', et);
fprintf(    '\n Czas dzialania funkcji frkw() tobl = %.2f sekund !', et);
fclose('all');
fprintf('\n\n K O N I E C  obliczen programem frkw()');
%
fprintf('\n\n UWAGA! Wyniki zapisano w pliku %s',fnames);
end
