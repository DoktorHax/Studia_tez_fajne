classdef student < handle
    properties
        nazwisko=' ';
        grupa=' ';
    end
    methods
        function s=student(Nazwisko,Grupa)
            s.nazwisko=Nazwisko;
            s.grupa=Grupa;
        end
        function przeniesienie(obiekt,NowaGrupa)
            obiekt.grupa=NowaGrupa;
        end
    end
end

