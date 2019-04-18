classdef lab
    %laboratorium Matlaba
    properties
        nazwisko=' ';
        cw=0;
        program=' ';
        zal=' ';
    end
    properties (GetAccess=private)
        ocena
    end
    methods
        function a=lab(Nazwisko,NrCw,LaNrCwNazwisko,OcenaCw) %konstruktor
        a.nazwisko=Nazwisko; % przypisanie opowiedneigo nazwiska studenta
        a.cw=NrCw; % przypisanie numeru aktualnego cwiczenia
        a.program=LaNrCwNazwisko; % przypisanie nazwy opracowanego programu
        a.ocena=OcenaCw;
        if a.ocena>2.5 Zal='ZAL'; else Zal=' -  '; end
        a.zal=Zal;
        end % koniec metody 
     function disp(a)
         fprintf('\n Student: %s ',a.nazwisko);
         fprintf('\n Cw: %g ',a.cw);
         fprintf('\n Program: %s ',a.program);
         fprintf('\n Ocena: %g',a.ocena);
         fprintf('\n Zaliczenie: %s ',a.zal);
     end
    end % koniec metod
end % koniec definicji klasy


