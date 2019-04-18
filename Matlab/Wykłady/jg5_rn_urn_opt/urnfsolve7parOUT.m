
 Uklad rownan zdefiniowny w funkcji  f=urn7par(x,p1,p2,p3,p4,p5,p6,p7)
 f(1)=a* x(1)^2 + b*x(2)^2 +c*x(3)^2-4;
 f(2)=d*x(1)*x(2)-1;
 f(3)=e*x(1)*x(2)+f*x(1)*x(3)+g*x(2)*x(3)-2;
 zostanie rozwiazany za pomoca fsolve z uzyciem wskaznika do funkcji
 [x,fval,exitflag,output]=fsolve(@(x) urn7par(x,a,b,c,d,e,f,g),x0,options);

 options=optimset('Display','off','LargeScale','off','MaxIter',100,'TolCon',1e-4,'TolFun',1e-4,'TolX',1e-4);

---------------------------------
 O P I S    R O Z W I A Z A N I A
 zmienna  PunktStartowy Rozwiazanie
  1           1     0.5181
  2          22     0.5182
  3         333      1.847
 fval = -5.1249e-02
 fval = -7.3151e-01
 fval = 1.8268e-01
 exitflag = -2
 -2 - algorytm zakonczyl obliczenia, ale x nie jest rozwiazaniem
 output.iterations    - liczba iteracji  =   51
 output.funcCount     - liczba obliczania funkcji  =  172
 output.algorithm     - zastosowany algorytm  = trust-region-dogleg
 output.message       - komunikat koncowy  = No solution found.

fsolve stopped because the problem appears regular as measured by the gradient,
but the vector of function values is not near zero as measured by the
selected value of the function tolerance.

Stopping criteria details:

fsolve stopped because the sum of squared function values, r, has gradient with
relative norm 8.029530e-05; this is less than options.OptimalityTolerance = 1.000000e-04.
However, r = 5.711036e-01, exceeds sqrt(options.FunctionTolerance) = 1.000000e-02.

Optimization Metric                                          Options
norm(grad r) =   8.03e-05                        OptimalityTolerance =   1e-04 (selected)
r =   5.71e-01                               sqrt(FunctionTolerance) =  1.0e-02 (selected)
 K O N I E C     O P I S U     R O Z W I A Z A N I A     wg fsolve()
 -------------------------------------------------------------------


---------------------------------
 O P I S    R O Z W I A Z A N I A
 zmienna  PunktStartowy Rozwiazanie
  1          -1    -0.5181
  2         -22    -0.5182
  3        -333     -1.847
 fval = -5.1249e-02
 fval = -7.3151e-01
 fval = 1.8268e-01
 exitflag = -2
 -2 - algorytm zakonczyl obliczenia, ale x nie jest rozwiazaniem
 output.iterations    - liczba iteracji  =   51
 output.funcCount     - liczba obliczania funkcji  =  172
 output.algorithm     - zastosowany algorytm  = trust-region-dogleg
 output.message       - komunikat koncowy  = No solution found.

fsolve stopped because the problem appears regular as measured by the gradient,
but the vector of function values is not near zero as measured by the
selected value of the function tolerance.

Stopping criteria details:

fsolve stopped because the sum of squared function values, r, has gradient with
relative norm 8.029530e-05; this is less than options.OptimalityTolerance = 1.000000e-04.
However, r = 5.711036e-01, exceeds sqrt(options.FunctionTolerance) = 1.000000e-02.

Optimization Metric                                          Options
norm(grad r) =   8.03e-05                        OptimalityTolerance =   1e-04 (selected)
r =   5.71e-01                               sqrt(FunctionTolerance) =  1.0e-02 (selected)
 K O N I E C     O P I S U     R O Z W I A Z A N I A     wg fsolve()
 -------------------------------------------------------------------


---------------------------------
 O P I S    R O Z W I A Z A N I A
 zmienna  PunktStartowy Rozwiazanie
  1           1    -0.5182
  2           2    -0.5182
  3          -3     -1.847
 fval = -5.1253e-02
 fval = -7.3151e-01
 fval = 1.8268e-01
 exitflag = -2
 -2 - algorytm zakonczyl obliczenia, ale x nie jest rozwiazaniem
 output.iterations    - liczba iteracji  =   37
 output.funcCount     - liczba obliczania funkcji  =  122
 output.algorithm     - zastosowany algorytm  = trust-region-dogleg
 output.message       - komunikat koncowy  = No solution found.

fsolve stopped because the problem appears regular as measured by the gradient,
but the vector of function values is not near zero as measured by the
selected value of the function tolerance.

Stopping criteria details:

fsolve stopped because the sum of squared function values, r, has gradient with
relative norm 7.501360e-05; this is less than options.OptimalityTolerance = 1.000000e-04.
However, r = 5.711036e-01, exceeds sqrt(options.FunctionTolerance) = 1.000000e-02.

Optimization Metric                                          Options
norm(grad r) =   7.50e-05                        OptimalityTolerance =   1e-04 (selected)
r =   5.71e-01                               sqrt(FunctionTolerance) =  1.0e-02 (selected)
 K O N I E C     O P I S U     R O Z W I A Z A N I A     wg fsolve()
 -------------------------------------------------------------------


---------------------------------
 O P I S    R O Z W I A Z A N I A
 zmienna  PunktStartowy Rozwiazanie
  1         1.1      1.883
  2         0.9      0.531
  3           1     0.4142
 fval = 2.4375e-10
 fval = -9.1038e-11
 fval = -1.2168e-10
 exitflag = 1
  1 - x rozwiazanie zbiezne
 output.iterations    - liczba iteracji  =    7
 output.funcCount     - liczba obliczania funkcji  =   29
 output.algorithm     - zastosowany algorytm  = trust-region-dogleg
 output.message       - komunikat koncowy  = Equation solved.

fsolve completed because the vector of function values is near zero
as measured by the selected value of the function tolerance, and
the problem appears regular as measured by the gradient.

Stopping criteria details:

Equation solved. The sum of squared function values, r = 8.250745e-20, is less than
sqrt(options.FunctionTolerance) = 1.000000e-02. The relative norm of the gradient of r,
7.547115e-10, is less than options.OptimalityTolerance = 1.000000e-04.

Optimization Metric                                         Options
relative norm(grad r) =   7.55e-10              OptimalityTolerance =   1e-04 (selected)
r =   8.25e-20                              sqrt(FunctionTolerance) =  1.0e-02 (selected)
 K O N I E C     O P I S U     R O Z W I A Z A N I A     wg fsolve()
 -------------------------------------------------------------------

 Czas obliczen programem urnsolve tobl = 0.12 sekund !