function fscanftest3
fd = fopen('danefscanf.txt','r');
[A,liczba]=fscanf(fd,'%5c%*f%9c%*f%*5c',[2 inf])';
A
fclose(fd);
return
