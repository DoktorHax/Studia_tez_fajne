function mrs2gs(fd,A,B,C,D)
fprintf(fd,'\nfunkcja mrs2gs');
fprintf(fd,'\n     zamiana rownania stanu na transmitancje G(s)');
fprintf(fd,'\n A, B, C, D - znane macierze');
fprintf(fd,'\n rownanie stanu w zapisie macierzowym');
fprintf(fd,'\n sX(s) = A*X(s) + B*U(s)');
fprintf(fd,'\n  Y(s) = C*X(s) + D*U(s)');
fprintf(fd,'\n  X(s) = [x1,x2,x3,...] - wektor zm. stanu');
fprintf(fd,'\n  Y(s) = sygnal na wyjsciu');
fprintf(fd,'\n  U(s) = sygnal na wejsciu');
if nargin<4
    D=[0];
    if nargin<3
        C=[1 -0.5]; 
        if nargin<2
            B=[1;0];
            if nargin<1
                A=[-5 -3; 2 0];
            end
        end
    end
end
% wyznaczanie wartosci wlasnych macierzy stanu A
lambda=eig(A);
nlambda=length(lambda); relambda=real(lambda); imlambda=imag(lambda);
fprintf(fd,'\n wartosci wlasne macierzy stanu A, lambda = ');
for i=1:nlambda
  fprintf(fd,'\n %9.4g     +j    %9.4g',relambda(i),imlambda(i)); 
end
istab=[]; istab=find(relambda>0);
if ~isempty(istab)
    fprintf(fd,'\n uklad jest niestabilny');
else
    fprintf(fd,'\n uklad jest stabilny');
end
% wyznaczanie wektorow: z- zera, p - bieguny, k - wzmocnienie
[z,p,k]=ss2zp(A,B,C,D);
fprintf(fd,'\nzera        z = ');
nz=length(z); rez=real(z); imz=imag(z);
for i=1:nz     fprintf(fd,'\n %9.4g         +j     %9.4g',rez(i),imz(i));
end
fprintf(fd,'\nbieguny     p = ');
np=length(p); rep=real(p); imp=imag(p);
for i=1:np     fprintf(fd,'\n %9.4g         +j     %9.4g',rep(i),imp(i));
end
fprintf(fd,'\nwzmocnienie k = %9.4g',k);
fprintf(fd,'\ntransmitancja G=zpk(z,p,k)');
G=zpk(z,p,k) % transmitancja
% wyznaczanie wektorow: L - licznik, M - mianownik
[L,M]=ss2tf(A,B,C,D);
fprintf(fd,'\nLicznik     L = ');
nL=length(L); reL=real(L); imL=imag(L);
for i=1:nL     fprintf(fd,'\n %9.4g         +j     %9.4g',reL(i),imL(i));
end
fprintf(fd,'\nMianownik   M = '); 
nM=length(M); reM=real(M); imM=imag(M);
for i=1:nM     fprintf(fd,'\n %9.4g         +j     %9.4g',reM(i),imM(i)); 
end
fprintf(fd,'\ntransmitancja G=tf(L,M)');
G=tf(L,M) % transmitancja
end