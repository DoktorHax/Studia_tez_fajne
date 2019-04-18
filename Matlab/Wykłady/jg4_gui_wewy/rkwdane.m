function rkwdane
wdold=cd;
[fname,sciezka]=uigetfile('rkwdat*.m','Wybierz a,b,c z pliku tekstowego ...\n\n\n');
        eval(['cd(''',sciezka,''')']);
        datafile=strtok(fname,'.');
        disp('  ... CZYTANIE danych tekstowych:');
        disp('      - sciezka dostepu:               ' );
        disp(sciezka);
        disp('      - nazwa wybranego pliku:          '); 
        disp(datafile);
   [a,b,c]=feval(datafile); 
   disp(' ');
   disp('Przeczytano dane z wybranego pliku, z wykorzystaniem funkcji uigetfile() ') ;
   a
   b
   c
   disp('sciezka dostepu po wybraniu pliku:   ');
   disp(pwd);
   eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
  disp('sciezka dostepu po powrocie do katalogu roboczego:   ');
  disp(pwd);
return


