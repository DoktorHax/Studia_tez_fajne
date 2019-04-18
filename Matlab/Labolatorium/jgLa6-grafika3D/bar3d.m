function bar3d
x=[1 2 3 4];
y=[1 2 3; 4 5 6; 7 8 9; 11 12 13];
	bar(x,y);
disp('Dalej? Enter'); pause; close;
bar3(x,y,'stacked');
disp('Dalej? Enter'); pause; close;
return
