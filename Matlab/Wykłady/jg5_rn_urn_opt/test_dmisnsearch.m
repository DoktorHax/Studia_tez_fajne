function test_fminsearch
a=10; x0=1;
[x,fval] = fminsearch(@(x) myfun(x,a),x0]);
fprintf('\n Punkt startowy x0=%g',x0),
fprintf('\n Optimum x=%g',x);
fprintf('\n Wartosc funkcji celu fval=%g',fval);
return
function f = koszt(x,a)
f = x(1)^2 + a*x(2)^2;
end
