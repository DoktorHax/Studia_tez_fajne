function dlmreadtest
type danecsv.txt
A = dlmread('danecsv.txt',',',1,2);
A
dlmwrite('danetab.txt',A,'delimiter','\t','precision','%.6f','newline','pc');
type danetab.txt
B = dlmread('danetab.txt','\t');
B
return
