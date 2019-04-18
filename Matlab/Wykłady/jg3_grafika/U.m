 classdef U
     properties
         Stacja='';
         NapiecieZnamionowe=0;
         NumerPomiaru=0;
         Napiecia3f=[0 0 0];
         Napiecie=0;
     end
      
     methods
         
     function pomiar=U(stacja,Un,nrpom,nap3f)
     if nargin~=4
         error('blad argumentow konstruktora U');
      end
     pomiar.Stacja=stacja;
     pomiar.NapiecieZnamionowe=Un;
     pomiar.NumerPomiaru=nrpom;
     pomiar.Napiecia3f=nap3f;
     end
     
     function obiekt=set.Stacja(obiekt,stacja)
         if strcmpi(stacja,' ')
             error('brak nazwy stacji');
         end
         obiekt.Stacja=stacja;
     end
     
     function napiecie=get.Napiecie(obiekt)
         indeksy=find(obiekt.Napiecia3f>0);
         napiecie=mean(obiekt.Napiecia3f(indeksy));
         napiecie=napiecie/obiekt.NapiecieZnamionowe;
         obiekt.Napiecie=napiecie;
         end
     
     function disp(obiekt)
         fprintf('\n Stacja: %s ',obiekt.Stacja);
         fprintf('\n NapiecieZnamionowe: %g V',obiekt.NapiecieZnamionowe);
         fprintf('\n NumerPomiaru: %g ',obiekt.NumerPomiaru);
         fprintf('\n Napiecie: %g pu',obiekt.Napiecie);
     end
     
  
     end%koniec methods
 
   
 end %koniec classdef
     