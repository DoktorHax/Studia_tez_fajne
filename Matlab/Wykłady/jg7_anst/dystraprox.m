function [npar,par,prwi,x]=dystraprox(fd,prx,x)
N=length(x);
fprintf(fd,'Liczba pomiarow N=%d',N);
fprintf(fd,'\n  Pomiary ');
fprintf(   '\n  Lp         x           prx');
fprintf(   'Liczba pomiarow N=%d',N);
fprintf(   '\n  Pomiary ');
fprintf(   '\n  Lp         x           prx');

for k=1:N
  % fprintf(fd,'\n %3d    %9.4f      %9.4f', k, x(k), prx(k) );
  % fprintf(   '\n %3d    %9.4f      %9.4f', k, x(k), prx(k) );
   
end
% APROKSYMACJA
i=1; BladSum=1;
while BladSum>0.1
    par=[];
    par=polyfit(x,prx,i); 
    prwi=polyval(par,x);
    fprintf(fd,'\n  - aproksymacja wielomianem stopnia n = %d', i);
    fprintf(    '\n  - aproksymacja wielomianem stopnia n = %d', i);
    for k=1:i+1
        fprintf(fd,'\n         p(%d) = %9.4f', k, par(k) );
        fprintf(   '\n         p(%d) = %9.4f', k, par(k) );
    end
    wi=int2str(i);
    opis=['stopien wielomianu ' wi];
    plot(x,prx,':r',x,prwi,'-b'); grid on;
    title(opis);   xlabel('x'); ylabel('F(x)');
    legend('realizacja','aproksymacja');
    disp('dalej? enter'); pause;
    close;
    i=i+1;
    % blad aproksymacji
    BladAprox = prwi - prx;
        BladSum = sqrt(sum(BladAprox.^ 2));
    BladSum
end
npar=i-1;
return
