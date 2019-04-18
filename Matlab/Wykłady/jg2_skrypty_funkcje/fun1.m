function [PierwiastekIloczynu, KwadratIloczynu]=fun1(a,b)
PierwiastekIloczynu=fun2(a,b);
KwadratIloczynu=fun3(a,b);
function f2=fun2(p1,p2);
    f2=sqrt(p1.*p2);
end
function f3=fun3(w1,w2)
    f3=w1.^2+w2.^2;
end
end

