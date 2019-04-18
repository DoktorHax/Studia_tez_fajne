function wewy
% uiputfile() - zakladanie pliku tekstowego ze znacznikiem daty
 t0=clock; % czas rozpoczecia obliczen
 rok=int2str(t0(1)); miesiac=int2str(t0(2)); dzien=int2str(t0(3));
 godz=int2str(t0(4));min=int2str(t0(5));
 nazwa=['rkwOUT_',dzien,'-',miesiac,'-',rok,'_',godz,'h',min,'min'];
 [nazwa,sciezka] = uiputfile(nazwa,' UWAGA! Zakceptuj nazwe ... albo wpisz nowa');
 fnames=strcat(sciezka,nazwa);
[fd,msg]=fopen(fnames,'wt');
fprintf('\n Otwarto plik tekstowy o nazwie ze znacznikiem czasowym \n %s', fnames);
fprintf(fd, '\n Data: %5d-%2d-%2d  godz. %2d, %2dmin, %2.0fs',clock);
% uigetfile() - czytanie danych z m-pliku 
wdold=cd;
[fname,sciezka]=uigetfile('rkwdat*.m','Wybierz a,b,c z m-pliku ...\n');
        eval(['cd(''',sciezka,''')']);
        datafile=strtok(fname,'.');
        fprintf('\n  ... CZYTANIE danych tekstowych ...');
        fprintf(fd, '\n  ... wybrano sciezke dostepu: %s',sciezka);
        fprintf(    '\n  ... wybrano sciezke dostepu: %s',sciezka);
        fprintf(fd, '\n  ... nazwa wybranego m-pliku: %s.m',datafile); 
        fprintf(    '\n  ... nazwa wybranego m-pliku: %s.m',datafile); 
   [a,b,c]=feval(datafile); % czytanie danych z wybranego m-pliku
 fprintf(fd,'\n ... sciezka dostepu po wybraniu pliku: %s  ',pwd);
 fprintf(fd,'\n Przeczytano dane z wykorzystaniem funkcji uigetfile() z pliku: %s.m ',datafile) ;
 fprintf(   '\n ... sciezka dostepu po wybraniu pliku: %s  ',pwd);
 fprintf(   '\n Przeczytano dane z wykorzystaniem funkcji uigetfile() z pliku: %s.m ',datafile) ;
        eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
 fprintf(fd,'\n ... sciezka dostepu po powrocie do katalogu roboczego: %s ',pwd);
 fprintf(   '\n ... sciezka dostepu po powrocie do katalogu roboczego: %s ',pwd);
 fprintf(fd,'\n Przeczytane dane: a=%g, b=%g, c=%g',a,b,c);
 fprintf(   '\n Przeczytane dane: a=%g, b=%g, c=%g',a,b,c);
% zamkniecie pliku tekstowego
fclose(fd);
fprintf('\n\n UWAGA! Wyniki zapisano w pliku %s',fnames);
end



