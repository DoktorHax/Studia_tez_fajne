function [Uab,Ubc,Uca,Un,t]=Umf
% function [Uab,Ubc,Uca,Un,t]=Umf
% zawiera pomiary napiec miedzyfazowych w V, rejestrowane co 1 min.
% na szynach 20 kV stacji GPZ zasilajacej zaklady przemyslowe
Un = 20; % napiecie znamionowe w kV
Uxls='xlsU.xlsx'; % nazwa arkusza xlsx z pomiarami napiec
%w kolumnach i wierszach arkusza:
%Time_Stamp               Uab        Ubc        Uca
%rrrr-mm-dd hh:mm:ss        V          V          V
%2017.01.01 00:00:00    20472,38    20449,95    20391,93        
%2017.01.01 00:01:00    20465,02    20443,17    20384,7     
%2017.01.01 00:02:00    20464,35    20442,96    20383,31
Uxls='xlsU.xlsx';
[num,txt]=xlsread(Uxls);
upom=num/Un/1000; % przeliczenie na jednostki wzgledne
Uab=upom(:,1); Ubc=upom(:,2); Uca=upom(:,3);
%Uab, Ubc, Uca
n=length(Uab);
for i=1:n
    t(i)=i; % pomiary wykonywane byly co 1 min.
end
end
