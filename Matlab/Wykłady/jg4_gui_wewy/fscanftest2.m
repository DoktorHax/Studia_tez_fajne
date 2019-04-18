function fscanftest2
fd = fopen('danefscanf.txt','r');
A=fscanf(fd,'%5c%*f%9c%*f%5c',[3 inf])';
A
C=char(A);
C
fclose(fd);
return
