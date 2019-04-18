function testfzero
a=2; x0=0.1;
x=fzero(@(x) cosax(x,a),x0);
x
end
