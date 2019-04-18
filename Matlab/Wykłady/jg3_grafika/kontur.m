function kontur
[c, h] = contour(peaks);
clabel(c, h);
colorbar;
return