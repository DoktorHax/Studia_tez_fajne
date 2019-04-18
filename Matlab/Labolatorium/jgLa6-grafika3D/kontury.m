function kontury
% wykres konturowy dla dowolnej funkcji powierzchniowej.
W=[1:-0.1:0 0.1:0.1:1];
[m,n]=size(W);
for k = 1:n
x = linspace(-2*pi,2*pi);
y = linspace(0,4*pi);
z = linspace(0,6*pi);
[X,Y,Z] = peaks;
Z=Z*W(k);
contour(X,Y,Z)
grid on;
M(k) = getframe;
end
movie(M,10,30);
disp('dalej? ENTER');pause;
close;
return
    %contour Contour plot.
    %contour(Z) is a contour plot of matrix Z treating the values in Z
    %as heights above a plane.  A contour plot are the level curves
    %of Z for some values V.  The values V are chosen automatically.
    %contour(X, Y, Z) X and Y specify the (x, y) coordinates of the
    %surface as for SURF. The X and Y data will be transposed or sorted
    %to bring it to MESHGRID form depending on the span of the first
    %row and column of X (to orient the data) and the order of the
    %first row of X and the first column of Y (to sorted the data). The
    %X and Y data must be consistently sorted in that if the first
    %element of a column of X is larger than the first element of
    %another column that all elements in the first column are larger
    %than the corresponding elements of the second. Similarly Y must be
    %consistently sorted along rows.
    %contour(Z, N) and contour(X, Y, Z, N) draw N contour lines,
    %overriding the automatic value.
    %contour(Z, V) and contour(X, Y, Z, V) draw LENGTH(V) contour lines
    %at the values specified in vector V.  Use contour(Z, [v, v]) or
    %contour(X, Y, Z, [v, v]) to compute a single contour at the level v.
    %contour(AX, ...) plots into AX instead of GCA.
    %[C, H] = contour(...) returns contour matrix C as described in
    %CONTOURC and a handle H to a contourgroup object.  This handle can
    %be used as input to CLABEL.
    %The contours are normally colored based on the current colormap
    %and are drawn as PATCH objects. You can override this behavior
    %with the syntax contour(..., LINESPEC) to draw the contours
    %with the color and linetype specified. See the help for PLOT
    %for more information about LINESPEC values.
    %The above inputs to contour can be followed by property/value
    %pairs to specify additional properties of the contour object.
    %Uses code by R. Pawlowicz to handle parametric surfaces and
    %inline contour labels.
    %Example:
    %   [c, h] = contour(peaks); clabel(c, h); colorbar;
 