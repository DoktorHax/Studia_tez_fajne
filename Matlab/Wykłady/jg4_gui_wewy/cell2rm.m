function [bus,branch,Sbase,nazwez,nazgal,blad]=cell2rm(fd)
if nargin<1
    fd=fopen('cell2rmOUT.m','wt');
end
% funkcja czyta i transformuje dane z tablic komorkowych do formatu wymaganego przez Rozplyw Mocy /rm/
% czytanie danych wejsciowych z wybranego m-pliku
wdold=cd;  blad=0; bus=[]; branch=[]; nazwez=[]; nazgal=[];
[fname,sciezka]=uigetfile('ormdat*.m',' UWAGA! Teraz wybierz m-plik z DANYMI do obliczania Rozplywu Mocy.m ...'); % zmiana 11.12.16
eval(['cd(''',sciezka,''')']); datafile=strtok(fname,'.');
fprintf(fd,'\n  Wybrano m-plik z DANYMI do obliczen:  %s%s.m\n',sciezka,datafile);
fprintf(   '\n  Wybrano m-plik z DANYMI do obliczen:  %s%s.m\n',sciezka,datafile);
% dane w tablicach komorkowych
[sbus,slin,stra,Sbase]=feval(datafile); 
eval(['cd(''',wdold,''')']);   % powrot do katalogu z programem
% Dane czytane 
%   nazwa   typ Un_kV    Um   Uk_st   Pd   Qd     Pg    Qg     Gsh    Bsh   Qgmin   Qgmax   Qkomp 
%  'wez'     1     2     3    4      5    6      7      8      9      10      11    12        13  
%TRANSFORMACJA DANYCH WEZLOWYCH
sp12='123456789012';       % ustala dlugosc maksymalna nazwy na 12 znakow
[nw,n]=size(sbus);
%wezel=sbus(:,1)   % nazwy wezlow
nazwez=strvcat(sp12, char(sbus(:,1)));   % nazwy wezlow
nazwez=nazwez(2:end,:);
bus=[[1:nw]' cell2mat(sbus(:,2:end))];   %zmiana   end =14
%przeliczenie na [ pu ]
bus(:,[6:9,12:14])=bus(:,[6:9,12:14])/Sbase;
Zb=bus(:,3).^2/Sbase;
bus(:,10)=bus(:,10)*1e-6.*Zb;   %   zmiana  Gsh oraz Bsh w mikroS na pu
bus(:,11)=bus(:,11)*1e-6.*Zb;   %   zmiana  Gsh oraz Bsh w mikroS na pu
% po przetransformowaniu danych wezlowych do tablicy bus
%   nr   typ Un_kV    Um   Uk_st   Pd   Qd     Pg    Qg     Gsh    Bsh   Qgmin   Qgmax   Qkomp 
%   1     2     3     4      5     6     7      8     9      10     11  %   12      13     14
%if blad  return  end

%TRANSFORMACJA DANYCH lINII
%    nazwg      nazwp      nazwk   R   X   G  B Imax/Smax st  lkm Smm2    czytane
%                                  1   2   3  4       5    6    7   8      
[nl,n]=size(slin);
if nl   % brak linii
   nazlin=strvcat( sp12,char(slin(:,1)));  nazlin=nazlin(2:end,:);  
   nazwp =strvcat( sp12,char(slin(:,2)));  nazwp=nazwp(2:end,:);
   nazwk =strvcat( sp12,char(slin(:,3)));  nazwk=nazwk(2:end,:); 
   line=[zeros(nl,2) cell2mat(slin(:,4:end)) ];   % end = 11
   strvcatnazwp0=deblank(strvcat(nazwp));      strvcatnazwk0=deblank(strvcat(nazwk));
   for ii=1:nw
      nazw0=deblank(nazwez(ii,:));
      wp = strmatch(nazw0,strvcatnazwp0,'exact');
      if ~isempty(wp)    line(wp,1)=ii;      end
      wk = strmatch(nazw0,strvcatnazwk0,'exact');
      if ~isempty(wk)    line(wk,2)=ii;       end
   end % for ii=1:nw
   prawid=line(:,1) .* line(:,2); nrline=find(prawid ==0);
   if ~isempty(nrline)
      for ii=1:length(nrline)
         fprintf(fd,'\n linia nr=%3d - >%s<  ma bledne nazwy wez這w',nrline(ii),nazlin(nrline(ii),:));
         fprintf(   '\n linia nr=%3d - >%s<  ma bledne nazwy wez這w',nrline(ii),nazlin(nrline(ii),:));
      end     
      blad=1;   %blad nazw linii
      return;
   end  %if ~isempty(nrline)
else
   nazlin=[]; line=[];
end  % if nl
%    nazwgal wp  wk    R   X   G  B Imax/Smax st  lkm Smm2          pamietane
%             1   2    3   4   5  6     7      8    9  10
%TRANSFORMACJA DANYCH TRANSFORMATOROW
[nt,n]=size(stra);
if nt         
   naztr=strvcat(sp12,char(stra(:,1)));  naztr=naztr(2:end,:);    
   nod  =strvcat(sp12,char(stra(:,2)));    nod=nod(2:end,:);    
   ndo  =strvcat(sp12,char(stra(:,3)));    ndo=ndo(2:end,:);    
   transf=[zeros(nt,2) cell2mat(stra(:,4:end)) ];   
   strvcatnod0=deblank(strvcat(nod));      strvcatndo0=deblank(strvcat(ndo));
 
   for ii=1:nw
      nazw0=deblank(nazwez(ii,:));
      wp = strmatch(nazw0,strvcatnod0,'exact');
      if ~isempty(wp)  transf(wp,1)=ii;       end
      wk = strmatch(nazw0,strvcatndo0,'exact');
      if ~isempty(wk)  transf(wk,2)=ii;       end
   end
   prawid=transf(:,1) .* transf(:,2); nrtrafo=find(prawid ==0);
   if ~isempty(nrtrafo)
      for ii=1:length(nrtrafo)
         fprintf(   '\n trafo nr=%3d - >%s<  ma bledne nazwy wez這w',nrtrafo(ii),naztr(nrtrafo(ii),:));
         fprintf(fd,'\n trafo nr=%3d - >%s<  ma bledne nazwy wez這w',nrtrafo(ii),naztr(nrtrafo(ii),:));
      end     
      blad=2;   %blad nazw trafo
      return;
   end  %if ~isempty(nrtrafo)
nazgal=[nazlin; naztr];  
else
   nbrt=0; transf=[];
end %  if ~isempty(stra)
% nazwg    nazwp    nazwk    R     X     G       B      Smax    to    tk     tmin   tmax     dt  st  lkm Smm2
%                            1     2     3       4        5      6     7        8      9     10  11   12  13  

nazgal=[nazlin; naztr];

% Converting numerical bus names into inner bus numbers

[n,mw]=size(bus);   [nbrl,mbrl]=size(line);   [nbrt,mbrt]=size(transf);
if nbrl & nbrt   % checking lines and transformers in branch data
   branch=[line(:,1:7) zeros(nbrl,5)  line(:,8:10); transf(:,1:13) zeros(nbrt,2) ];
elseif nbrl & ~nbrt  %there are only lines and no transformers
   branch=[line(:,1:7) zeros(nbrl,5)  line(:,8:10)];
   fprintf(   '\n brak transformatorow w sieci');
   fprintf(fd,'\n brak transformatorow w sieci');
elseif ~nbrl & nbrt % there transformers and no lines
   branch=[ transf(:,1:13) zeros(nbrl,2) ];
   fprintf(   '\n brak linii w sieci');
   fprintf(fd,'\n brak linii w sieci');
end
%  sprawdzenie konfiguracji
prawid=branch(:,1) .* branch(:,2); nrbranch=find(prawid ==0);

% przeliczenie na [ pu ]
 
Zb= bus(branch(:,1),3).^2/Sbase;
branch(:,3)=branch(:,3)./Zb;  %  R   przel
branch(:,4)=branch(:,4)./Zb;  %  X  przel
branch(:,5)=branch(:,5).*Zb*1e-6;  %  G   przel
branch(:,6)=branch(:,6).*Zb*1e-6;  %  B  przel
tm=branch(:,8); tm2=tm.^2; 
% przeliczenie impedancji transf. w pu na strone wtorna
itm=find(tm(:)~=0)
branch(itm,3)=branch(itm,3)./tm2(itm);
branch(itm,4)=branch(itm,4)./tm2(itm);
branch(itm,5)=branch(itm,5).*tm2(itm);
branch(itm,6)=branch(itm,6).*tm2(itm);
TYP=bus(:,2); REF=find(TYP(:)==3);   PU=find(TYP(:)==2 | TYP(:)==6 ); 
nru=size(PU,1);     % buses with voltage control
PQ=find(TYP(:)==1 | TYP(:)==5 );   % PQ buses type 1 and 5
nd=size(PQ,1);  
if REF
   fprintf(fd,'\n wezel bilansujacy ma teraz numer %d \n',bus(REF,1));
   fprintf(   '\n wezel bilansujacy ma teraz numer %d \n',bus(REF,1));
elseif nru
   REF=PU(1);
   bus(REF,2)=3;
   fprintf(   '\n W danych stwierdzono brak wezla bilansujacego, dlatego wybrano wezel o nr=%d jako wezel bilansujacy \n',bus(REF,1), REF);
   fprintf(fd,'\n W danych stwierdzono brak wezla bilansujacego, dlatego wybrano wezel o nr=%d jako wezel bilansujacy \n',bus(REF,1), REF);
   if nru-1
      PU=PU(2:nru);
   else
      PU=[];
   end
   nru=nru-1;
else
   REF=PQ(1);
   bus(REF,2)=3;
   fprintf(fd,'\nW danych stwierdzono brak wezla bilansujacego, dlatego wybrano wezel o nr=%d jako wezel bilansujacy \n',bus(REF,1));
   fprintf(   '\nW danych stwierdzono brak wezla bilansujacego, dlatego wybrano wezel o nr=%d jako wezel bilansujacy \n',bus(REF,1));
   PQ=PQ(2:nd);
   nd=nd-1;
end
%   REF; PU; PQ
nREF=size(REF,1); nPU=size(PU,1); nPQ=size(PQ,1);
%bus=bus(kol',:);
w2z = bus(:,1);     % nazwy numeryczne
z2w = zeros(max(w2z), 1); 
z2w(w2z) = [1:size(bus, 1)]';
bus=[zeros(size(bus, 1),1) bus];  % zapamietanie nazw numerycznych
branch=[branch(:,1:2) zeros(size(branch,1), 2)   branch(:,3:15)]; 
%inner bus numbers         
bus(  :, 1)   = z2w( bus(:, 2) );
branch(:, 3) = z2w( branch(:, 1) );
branch(:, 4) = z2w( branch(:, 2) );
%
fprintf(fd,'\n\n\n Po przetransformowaniu danych wezlowych do tablicy bus');
fprintf(fd,'\n nr  nazwanr typ   Un_kV      Um      Uk_st     Pd     Qd         Pg       Qg       Gsh      Bsh      Qgmin     Qgmax   Qkomp'); 
fprintf(fd,'\n  -   -       -       kV      pu         st     pu     pu         pu       pu        pu       pu         pu        pu      pu');
fprintf(fd,'\n  1   2       3        4       5         6       7      8          9       10        11       12         13        14      15');
[nbus,mbus]=size(bus);
for i=1:nbus
nr=bus(i,1); nazwanr=bus(i,2); typ=bus(i,3); Un_kV=bus(i,4); Um=bus(i,5); Uk_st=bus(i,6); 
Pd=bus(i,7); Qd=bus(i,8); Pg=bus(i,9); Qg=bus(i,10); Gsh=bus(i,11); Bsh=bus(i,12);
Qgmin=bus(i,13); Qgmax=bus(i,14); Qkomp=bus(i,15);
fprintf(fd,'\n%3d %3d %7d %8.3f %8.5f %8.1f %8.5f %8.5f  %8.5f %8.5f  %8.5f %8.5f  %8.5f %8.5f  %8.5f',...
    nr,nazwanr,typ,Un_kV,Um,Uk_st,Pd,Qd,Pg,Qg,Gsh,Bsh,Qgmin,Qgmax,Qkomp);
end
%

fprintf(fd,'\n\n\n Po przetransformowaniu danych galeziowych do tablicy branch');
fprintf(fd,'\n nrp  nrk  wp    wk        R        X       G      B     ImaxSmax      to        tk     tmin      tmax        dt  st       lkm  Smm2');
fprintf(fd,'\n  -   -     -     -       pu       pu      pu     pu       A/MVA       pu        pu       pu        pu        pu   -        km   mm2');
fprintf(fd,'\n  1   2     3     4        5        6       7      8          9        10        11       12        13        14  15        16    17');
[nbr,mbr]=size(branch);
for i=1:nbr
nr=i; nrp=branch(i,1); nrk=branch(i,2); wp=branch(i,3); wk=branch(i,4); 
R=branch(i,5); X=branch(i,6); G=branch(i,7); B=branch(i,8); ImaxSmax=branch(i,9);
to=branch(i,10); tk=branch(i,11); tmin=branch(i,12); tmax=branch(i,13); dt=branch(i,14); 
st=branch(i,15); lkm=branch(i,16); Smm2=branch(i,17);
fprintf(fd,'\n%3d %3d %5d %5d %8.5f %8.5f %8.5f %8.5f %8.0f  %8.5f %8.5f  %8.5f %8.5f  %8.5f %3d  %8.3f %5.0f',...
    nrp,nrk,wp,wk,R,X,G,B,ImaxSmax,to,tk,tmin,tmax,dt,st,lkm,Smm2);
end

fclose('all');
fprintf('\n\n KONIEC czytania danych z tablic komorkowych');

return;


