function readczyt1
% czytanie textread
%fd=fopen('daneread1.txt');
[nazwisko, imie,ocena,cw] = textread('daneread1.txt','%s%s%f%s');
nazwisko,imie,ocena,cw
n=length(ocena);
for i=1:n
grupa.nazwisko(i,:)=nazwisko(i,:);
grupa.imie(i,:)=imie(i,:);
grupa.ocena(i)=ocena(i);
grupa.cw(i,:)=cw(i,:);
end
grupa
%fclose(fd);
return
