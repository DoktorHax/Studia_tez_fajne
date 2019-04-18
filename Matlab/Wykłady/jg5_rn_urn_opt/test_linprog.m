function test_linprog
f = [-5; -4; -6];
Aineq =  [1 -1  1
      3  2  4
      3  2  0];
bineq = [20; 42; 30];
lb = zeros(3,1);
[x,fval,exitflag,output,lambda] = linprog(f,Aineq,bineq,[],[],lb);
x,fval
end
