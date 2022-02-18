nmax = 32;
a = 0;
b = pi/2;
f = @(x)sin(2*x);
A = MySimpson(f,a,b,nmax)
err = abs(1-A)