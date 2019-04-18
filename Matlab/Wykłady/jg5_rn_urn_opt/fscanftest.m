function fscanftest
fd = fopen('danefscanf.txt','r');
A=fscanf(fd,'%*5c%f%*9c%f%*5c',[2 inf])';
A
fclose(fd);
return
