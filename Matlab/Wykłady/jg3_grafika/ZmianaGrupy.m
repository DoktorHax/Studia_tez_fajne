function ZmianaGrupy
clear
student1=student('Adamski Adam','jg1');
fprintf('\n - przed zmiana grupy');
fprintf('\n student1: %s,    grupa: %s',student1.nazwisko,student1.grupa);
student2=student1;
fprintf('\n student2: %s,    grupa: %s',student2.nazwisko,student2.grupa);
przeniesienie(student2,'jg2');
fprintf('\n - po zmianie grupy');
fprintf('\n student1: %s,    grupa: %s',student1.nazwisko,student1.grupa);
fprintf('\n student2: %s,    grupa: %s',student2.nazwisko,student2.grupa);
return