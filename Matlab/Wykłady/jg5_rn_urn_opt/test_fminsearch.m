function test_fminsearch
a=1.1; b=2.2; c=3.3;
x0=[1.0; 1.0; 1.0];
[x,fval] = fminsearch(@(x) koszt(x,a,b,c),x0);
nx=length(x);
fprintf('\n Lp        start     optimum');
for i=1:nx
    fprintf('\n %3d %8.3g        %8.3g',i,x0(i),x(i));
end
fprintf('\n Wartosc funkcji celu fval=%g',fval);
return
function f = koszt(x,a,b,c)
f = a*x(1)^2 + b*x(2)^2 + c*x(3)^2;
return
