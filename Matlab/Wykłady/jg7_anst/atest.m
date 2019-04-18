function atest
% test dla sredniej, odch. stand., kowariancji
% dane pomiarowe
x = [
  %  U,V       P, kW     Q,kvar    
  231.0000    2.3000    0.4000
  228.0000    3.5000    0.8000
  232.0000    0.1000         0
  221.0000    4.2000    1.1000
];
fprintf('\n\n pomiary x:');
fprintf('\n %f    %f    %f     %f',x);
srx=mean(x,1);
srU=srx(1); srP=srx(2); srQ=srx(3);
fprintf('\n\n srednie srx:');
fprintf('\n %f    %f    %f',srx);
stdx=std(x,1);
odchU=stdx(1); odchP=stdx(2); odchQ=stdx(3);
fprintf('\n\n odchylenia standardowe  stdx:');
fprintf('\n %f    %f    %f',stdx);
covx=cov(x);
fprintf('\n\n macierz kowariancji  stdx:');
fprintf('\n %f    %f    %f',covx);
corx=corrcoef(x);
fprintf('\n\n macierz wsp. korelacji corx:');
fprintf('\n %f    %f    %f',corx);
return
