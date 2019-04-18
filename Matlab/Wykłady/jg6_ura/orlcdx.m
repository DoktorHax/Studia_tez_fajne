function dxdt=orlcdx(t,x)
global A B Em psi
e=Em*sin(100*pi*t+psi); % wymuszenie
dxdt=A*x+B*e; % rownanie stanu
end

