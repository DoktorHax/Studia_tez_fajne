function [PierwiastekIloczynu, SumaKwadratow]=funtest(a,b)
if nargin<2
    b=400;
    if nargin<1
        a=100;
    end
end
disp('a='); disp(a);
disp('b='); disp(b);
%
PierwiastekIloczynu=fun2(a,b);
disp('PierwiastekIloczynu=fun2(a,b)'); disp(PierwiastekIloczynu);
%
SumaKwadratow=fun3(a,b);
disp('SumaKwadratow=fun3(a,b)'); disp(SumaKwadratow);
function f2=fun2(p1,p2);
    f2=sqrt(p1.*p2);
end
%
disp('function f2=fun2(p1,p2)');
disp('    f2=sqrt(p1.*p2);');
disp('end');
disp('  ');
function f3=fun3(w1,w2)
    f3=w1.^2+w2.^2;
end
disp('');
disp('function f3=fun3(w1,w2)');
disp('    f3=w1.^2+w2.^2;');
disp('end');
%
end %koniec function [PierwiastekIloczynu, SumaKwadratow]=fun1(a,b)

