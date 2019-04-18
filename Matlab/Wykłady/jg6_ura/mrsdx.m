function dxdt=mrsdx(t,x)
global A B u
dxdt=A*x+B*u;
end
