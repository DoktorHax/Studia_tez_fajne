function scanczyt
% czytanie textscan
fd=fopen('danescan.txt');
blok1 = textscan(fd,'%q%f%f%f',3,'CommentStyle',{'/*','*/'} );
blok2 = textscan(fd,'%d',      3,'CommentStyle',{'/*','*/'} );
blok3 = textscan(fd,'%s',      6,'CommentStyle',{'/*','*/'} );
blok4 = textscan(fd,'%f',        'CommentStyle',{'/*','*/'} );
S=blok1{1}
A=[blok1{2},blok1{3},blok1{4}];
A
C=reshape(blok3{1},2,[]);
C
D=reshape(blok4{1},2,[]);
D
fclose(fd);
return
