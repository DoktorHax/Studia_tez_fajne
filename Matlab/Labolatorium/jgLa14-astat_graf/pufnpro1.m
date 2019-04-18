function pufnpro1
%Statystyka stosowana -  przedzial ufnosci dla proporcji (frakcji)
%kwantyle rozkladu N(0,1)
kwantyle=[
% prawdopod.        kwantyl N(0,1)
     0.900         1.282
     0.905         1.311
     0.910         1.341
     0.915         1.373
     0.920         1.406
     0.925         1.440
     0.930         1.476
     0.935         1.515
     0.940         1.555
     0.945         1.599
     0.950         1.645
     0.955         1.696
     0.960         1.751
     0.965         1.812
     0.970         1.881
     0.975         1.960
     0.980         2.054
     0.985         2.171
     0.990         2.327
     0.995         2.576
 ];
 
% Oszacowac przedzialy ufnosci wartosci oczekiwanej na poziomie ufnosci

%alfa     0.1   0.09	0.08	0.07	0.06	0.05    0.04	0.03	0.02	0.01
%alfa/2	  0.05	0.045	0.04	0.035	0.03	0.025	0.02	0.015	0.01	0.005

%1-alfa2  0.95	0.955	0.96	0.965	0.97	0.975	0.98	0.985	0.99	0.995
%zalfa/2  1.64  1.65	1.75	1.81	1.88	1.96    2.05	2.17	2.33	2.58

%1-alfa	  0.90	0.91	0.92	0.93	0.94	0.95	0.96	0.97	0.98	0.99
%zalfa    1.28  1.34	1.41	1.48	1.56	1.64    1.75	1.88	2.05	2.33



fprintf('\n Przyklad z wykladu');
m=380
n=1000
pest=m/n
qest=1-pest
s2=pest*qest
s=sqrt(s2)
alfa=0.05;
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa);
ipr1=ipr(1); za=kwantyle(ipr1,2);
alfa2=alfa/2;
ipr=[]; ipr=find(kwantyle(:,1)>=1-alfa2);
ipr1=ipr(1); za2=kwantyle(ipr1,2);

fprintf('\n\n pest=%f',pest);
fprintf('\n n=%d,   s=sqrt(pets*qest) = %f\n',n,s);
fprintf('\n alfa/2=%f',alfa2);
fprintf('\n alfa  =%f',alfa);
fprintf('\n kwantyl rzedu 1-alfa/2 = %f, za2=%f \n',1-alfa2,za2);
fprintf('\n kwantyl rzedu 1-alfa   = %f, za =%f \n',1-alfa,za);
Z1=pest-za2*s/sqrt(n);
Z2=pest+za2*s/sqrt(n);
fprintf('\n\n przedzial ufnosci dwustronny Pr(Z1<p<Z2)=1-alfa: Z1=%f, Z2=%f',Z1,Z2);
Z1a=pest-za*s/sqrt(n);
Z2a=pest+za*s/sqrt(n);

fprintf('\n\n przedzial ufnosci jednostronny Pr(p>z1a)=1-alfa: Z1a=%f',Z1a);
fprintf('\n\n przedzial ufnosci jednostronny Pr(p<z2a)=1-alfa: Z2a=%f',Z2a);


return