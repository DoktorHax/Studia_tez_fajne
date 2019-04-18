function rexp
%wykladniczy rozklad prawd.
%f(x)=lambda*exp(-lambda*x)
%EX=1/lambada
%sigma=1/lambda
%F(x)=1-exp(-lambda*x) - dystrybuanta
lambda=1/52000
a=70000
p=1-exp(-lambda*a)
EX=1/lambda
VX=1/lambda^2
sigma=1/lambda

return